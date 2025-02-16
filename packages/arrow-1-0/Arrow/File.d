module Arrow.File;

public import Arrow.FileIfaceProxy;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

interface File
{

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_file_get_type != &gidSymbolNotFound ? garrow_file_get_type() : cast(GType)0;
  }

  bool close();

  FileMode getMode();

  bool isClosed();

  long tell();
}
