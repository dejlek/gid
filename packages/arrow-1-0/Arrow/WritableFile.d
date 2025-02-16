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
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_writable_file_get_type != &gidSymbolNotFound ? garrow_writable_file_get_type() : cast(GType)0;
  }

  bool writeAt(long position, ubyte[] data);
}
