/// Module for [Descriptor] class
module arrowflight.descriptor;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import gobject.object;

/** */
class Descriptor : gobject.object.ObjectG
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
    return cast(void function())gaflight_descriptor_get_type != &gidSymbolNotFound ? gaflight_descriptor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override Descriptor self()
  {
    return this;
  }

  /** */
  bool equal(arrowflight.descriptor.Descriptor otherDescriptor)
  {
    bool _retval;
    _retval = gaflight_descriptor_equal(cast(GAFlightDescriptor*)cPtr, otherDescriptor ? cast(GAFlightDescriptor*)otherDescriptor.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    _cretval = gaflight_descriptor_to_string(cast(GAFlightDescriptor*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
