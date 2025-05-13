/// Module for [GIOOutputStream] class
module arrow.giooutput_stream;

import arrow.c.functions;
import arrow.c.types;
import arrow.file;
import arrow.file_mixin;
import arrow.output_stream;
import arrow.types;
import arrow.writable;
import arrow.writable_mixin;
import gid.gid;
import gio.output_stream;
import gobject.object;

/** */
class GIOOutputStream : arrow.output_stream.OutputStream
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_gio_output_stream_get_type != &gidSymbolNotFound ? garrow_gio_output_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GIOOutputStream self()
  {
    return this;
  }

  /** */
  this(gio.output_stream.OutputStream gioOutputStream)
  {
    GArrowGIOOutputStream* _cretval;
    _cretval = garrow_gio_output_stream_new(gioOutputStream ? cast(GOutputStream*)gioOutputStream._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  gio.output_stream.OutputStream getRaw()
  {
    GOutputStream* _cretval;
    _cretval = garrow_gio_output_stream_get_raw(cast(GArrowGIOOutputStream*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.output_stream.OutputStream)(cast(GOutputStream*)_cretval, No.Take);
    return _retval;
  }
}
