module freetype2.c.functions;

import Gid.loader;
import freetype2.c.types;
public import GLib.c.types;

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
