module ArrowFlight.MessageReader;

import ArrowFlight.Descriptor;
import ArrowFlight.RecordBatchReader;
import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GObject.ObjectG;
import Gid.gid;

class MessageReader : RecordBatchReader
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gaflight_message_reader_get_type();
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
