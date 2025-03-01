module arrowflight.metadata_reader;

import arrow.buffer;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.global;
import glib.error;
import gobject.object;

class MetadataReader : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_metadata_reader_get_type != &gidSymbolNotFound ? gaflight_metadata_reader_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  Buffer read()
  {
    GArrowBuffer* _cretval;
    GError *_err;
    _cretval = gaflight_metadata_reader_read(cast(GAFlightMetadataReader*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Buffer(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }
}
