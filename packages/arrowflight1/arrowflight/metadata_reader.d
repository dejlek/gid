/// Module for [MetadataReader] class
module arrowflight.metadata_reader;

import arrow.buffer;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class MetadataReader : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_metadata_reader_get_type != &gidSymbolNotFound ? gaflight_metadata_reader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MetadataReader self()
  {
    return this;
  }

  /** */
  arrow.buffer.Buffer read()
  {
    GArrowBuffer* _cretval;
    GError *_err;
    _cretval = gaflight_metadata_reader_read(cast(GAFlightMetadataReader*)cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap.getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }
}
