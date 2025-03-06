module gen_adrdox;

import std.algorithm;
import std.array;
import std.file;
import std.getopt;
import std.json;
import std.path;
import std.process;
import std.range;
import std.stdio;
import std.string;
import std.typecons;

int main(string[] args)
{
  auto packagesPath = "../packages";
  auto host = "www.kymorphia.com/gid/";
  bool dryRun;

  try
  {
    auto helpInformation = getopt(
        args,
        "dry-run", "Don't actually execute commands, display them instead", &dryRun,
    );

    if (helpInformation.helpWanted)
    {
      defaultGetoptPrinter("giD adrdox documentation generator helper\n" ~ args[0]
        ~ " COMMAND [OPTIONS]\n  COMMAND: generate (generate html adrdox), fixtocs (fix table of contents)",
        helpInformation.options);
      return 0;
    }
  }
  catch (Exception e)
  {
    writeln(e.msg);
    return 1;
  }

  if (args.length < 2 || !args[1].among("generate"))
  {
    writeln("Command is a required argument");
    return 1;
  }

  auto cmd = args[1];

  auto depTree = dirEntries(packagesPath, SpanMode.shallow).filter!(ent => ent.isDir) // Hash of packageName => depName[]
    .map!(ent => tuple(ent.name.baseName, getDeps(buildPath(ent.name, "dub.json")))).assocArray;

  foreach (pkg; depTree.keys.sort) // Loop over sub packages, construct recursive versioned dependencies
  {
    bool[string] rDeps;

    void recurseDeps(string[] deps)
    {
      foreach (d; deps)
      {
        rDeps[d] = true;
        recurseDeps(depTree[d]);
      }
    }

    recurseDeps(depTree[pkg]);

    auto depArgs = rDeps.keys.sort.map!(dep => ["--load", buildPath(packagesPath, dep), "--package-path",
      dep[0 .. $ - 1] ~ ".*=//" ~ host ~ dep ~ "/"]).joiner.array;

    auto adrdoxCmd = ["dub", "run", "adrdox", "--", buildPath(packagesPath, pkg), "-o", buildPath("api", pkg)] ~ depArgs;

    if (!dryRun)
    {
      writeln("Generating " ~ pkg ~ " docs");

      auto ret = execute(adrdoxCmd);

      if (ret.status != 0)
      {
        writeln("Failed to generate docs for '" ~ pkg ~ "', dumping output:");
        writeln(ret.output);
        return 1;
      }
    }
    else
      writeln(adrdoxCmd.join(" "));
  }

  return 0;
}

string[] getDeps(string dubFile)
{
  auto js = parseJSON(readText(dubFile));
  return "dependencies" in js ? js["dependencies"].object.keys.map!(pkg => pkg.chompPrefix("gid:")).array.sort.array
    : [];
}
