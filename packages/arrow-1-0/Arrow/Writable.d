module Arrow.Writable;

public import Arrow.WritableIfaceProxy;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

interface Writable
{

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_writable_get_type != &gidSymbolNotFound ? garrow_writable_get_type() : cast(GType)0;
  }

  /**
   * It ensures writing all data on memory to storage.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool flush();

  bool write(ubyte[] data);
}
