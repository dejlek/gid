module ArrowFlight.MetadataWriter;

import Arrow.Buffer;
import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class MetadataWriter : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gaflight_metadata_writer_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Writes metadata to the client.
   * Params:
   *   metadata = A #GArrowBuffer to be sent.
   * Returns: %TRUE on success, %FALSE on error.
   */
  bool write(Buffer metadata)
  {
    bool _retval;
    GError *_err;
    _retval = gaflight_metadata_writer_write(cast(GAFlightMetadataWriter*)cPtr, metadata ? cast(GArrowBuffer*)metadata.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
