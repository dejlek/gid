module Gid.c.functions;

public import Gid.basictypes;
import Gid.loader;
import Gid.c.types;

version(Windows)
  private immutable LIBS = [];
else version(OSX)
  private immutable LIBS = [];
else
  private immutable LIBS = [];

__gshared extern(C)
{
}

shared static this()
{
}
