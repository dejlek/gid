module ArrowFlight.MetadataReader;

import Arrow.Buffer;
import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class MetadataReader : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gaflight_metadata_reader_get_type();
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
