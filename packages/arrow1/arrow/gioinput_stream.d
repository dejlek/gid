module arrow.gioinput_stream;

import arrow.c.functions;
import arrow.c.types;
import arrow.file;
import arrow.file_mixin;
import arrow.readable;
import arrow.readable_mixin;
import arrow.seekable_input_stream;
import arrow.types;
import gid.gid;
import gio.input_stream;
import gobject.object;

/** */
class GIOInputStream : arrow.seekable_input_stream.SeekableInputStream
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_gio_input_stream_get_type != &gidSymbolNotFound ? garrow_gio_input_stream_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(gio.input_stream.InputStream gioInputStream)
  {
    GArrowGIOInputStream* _cretval;
    _cretval = garrow_gio_input_stream_new(gioInputStream ? cast(GInputStream*)gioInputStream.cPtr(No.dup) : null);
    this(_cretval, Yes.take);
  }

  /** */
  gio.input_stream.InputStream getRaw()
  {
    GInputStream* _cretval;
    _cretval = garrow_gio_input_stream_get_raw(cast(GArrowGIOInputStream*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.input_stream.InputStream)(cast(GInputStream*)_cretval, No.take);
    return _retval;
  }
}
