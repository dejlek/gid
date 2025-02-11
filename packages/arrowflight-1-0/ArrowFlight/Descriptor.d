module ArrowFlight.Descriptor;

import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GObject.ObjectG;
import Gid.gid;

class Descriptor : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gaflight_descriptor_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  bool equal(Descriptor otherDescriptor)
  {
    bool _retval;
    _retval = gaflight_descriptor_equal(cast(GAFlightDescriptor*)cPtr, otherDescriptor ? cast(GAFlightDescriptor*)otherDescriptor.cPtr(No.Dup) : null);
    return _retval;
  }

  string toString_()
  {
    char* _cretval;
    _cretval = gaflight_descriptor_to_string(cast(GAFlightDescriptor*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }
}
