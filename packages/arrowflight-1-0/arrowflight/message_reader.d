module arrowflight.message_reader;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.descriptor;
import arrowflight.record_batch_reader;
import arrowflight.types;
import gid.gid;
import gobject.object;

class MessageReader : RecordBatchReader
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_message_reader_get_type != &gidSymbolNotFound ? gaflight_message_reader_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  Descriptor getDescriptor()
  {
    GAFlightDescriptor* _cretval;
    _cretval = gaflight_message_reader_get_descriptor(cast(GAFlightMessageReader*)cPtr);
    auto _retval = ObjectG.getDObject!Descriptor(cast(GAFlightDescriptor*)_cretval, Yes.Take);
    return _retval;
  }
}
