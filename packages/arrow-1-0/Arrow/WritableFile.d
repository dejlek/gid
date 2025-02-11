module Arrow.WritableFile;

public import Arrow.WritableFileIfaceProxy;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

interface WritableFile
{

  static GType getType()
  {
    return garrow_writable_file_get_type();
  }

  bool writeAt(long position, ubyte[] data);
}
