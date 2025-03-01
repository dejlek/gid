module arrow.readable;

public import arrow.readable_iface_proxy;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.global;
import glib.bytes;
import glib.error;
import gobject.object;

interface Readable
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_readable_get_type != &gidSymbolNotFound ? garrow_readable_get_type() : cast(GType)0;
  }

  Buffer read(long nBytes);

  Bytes readBytes(long nBytes);
}
