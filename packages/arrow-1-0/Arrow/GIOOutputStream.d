module Arrow.GIOOutputStream;

import Arrow.File;
import Arrow.FileT;
import Arrow.OutputStream : DArrowOutputStream = OutputStream;
import Arrow.Types;
import Arrow.Writable;
import Arrow.WritableT;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;
import Gio.OutputStream;

class GIOOutputStream : DArrowOutputStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_gio_output_stream_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(OutputStream gioOutputStream)
  {
    GArrowGIOOutputStream* _cretval;
    _cretval = garrow_gio_output_stream_new(gioOutputStream ? cast(GOutputStream*)gioOutputStream.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  OutputStream getRaw()
  {
    GOutputStream* _cretval;
    _cretval = garrow_gio_output_stream_get_raw(cast(GArrowGIOOutputStream*)cPtr);
    auto _retval = ObjectG.getDObject!OutputStream(cast(GOutputStream*)_cretval, No.Take);
    return _retval;
  }
}
