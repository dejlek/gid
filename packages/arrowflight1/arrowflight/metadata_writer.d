/// Module for [MetadataWriter] class
module arrowflight.metadata_writer;

import arrow.buffer;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class MetadataWriter : gobject.object.ObjectG
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
    return cast(void function())gaflight_metadata_writer_get_type != &gidSymbolNotFound ? gaflight_metadata_writer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override MetadataWriter self()
  {
    return this;
  }

  /**
      Writes metadata to the client.
  
      Params:
        metadata = A #GArrowBuffer to be sent.
      Returns: true on success, false on error.
  */
  bool write(arrow.buffer.Buffer metadata)
  {
    bool _retval;
    GError *_err;
    _retval = gaflight_metadata_writer_write(cast(GAFlightMetadataWriter*)cPtr, metadata ? cast(GArrowBuffer*)metadata.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
