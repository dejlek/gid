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
    return garrow_writable_get_type();
  }

  /**
   * It ensures writing all data on memory to storage.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool flush();

  bool write(ubyte[] data);
}
