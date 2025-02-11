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
    return garrow_file_get_type();
  }

  bool close();

  FileMode getMode();

  bool isClosed();

  long tell();
}
