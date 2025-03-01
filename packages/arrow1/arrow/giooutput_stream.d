module arrow.giooutput_stream;

import arrow.c.functions;
import arrow.c.types;
import arrow.file;
import arrow.file_mixin;
import arrow.output_stream : DArrowOutputStream = OutputStream;
import arrow.types;
import arrow.writable;
import arrow.writable_mixin;
import gid.global;
import gio.output_stream;
import gobject.object;

class GIOOutputStream : DArrowOutputStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_gio_output_stream_get_type != &gidSymbolNotFound ? garrow_gio_output_stream_get_type() : cast(GType)0;
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
