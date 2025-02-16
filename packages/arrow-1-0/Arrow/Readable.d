module Arrow.Readable;

public import Arrow.ReadableIfaceProxy;
import Arrow.Buffer;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.Bytes;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

interface Readable
{

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_readable_get_type != &gidSymbolNotFound ? garrow_readable_get_type() : cast(GType)0;
  }

  Buffer read(long nBytes);

  Bytes readBytes(long nBytes);
}
