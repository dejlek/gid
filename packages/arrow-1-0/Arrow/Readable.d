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
    return garrow_readable_get_type();
  }

  Buffer read(long nBytes);

  Bytes readBytes(long nBytes);
}
