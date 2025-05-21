/// Module for [MessageReader] class
module arrowflight.message_reader;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.descriptor;
import arrowflight.record_batch_reader;
import arrowflight.types;
import gid.gid;
import gobject.object;

/** */
class MessageReader : arrowflight.record_batch_reader.RecordBatchReader
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_message_reader_get_type != &gidSymbolNotFound ? gaflight_message_reader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MessageReader self()
  {
    return this;
  }

  /** */
  arrowflight.descriptor.Descriptor getDescriptor()
  {
    GAFlightDescriptor* _cretval;
    _cretval = gaflight_message_reader_get_descriptor(cast(GAFlightMessageReader*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrowflight.descriptor.Descriptor)(cast(GAFlightDescriptor*)_cretval, Yes.Take);
    return _retval;
  }
}
