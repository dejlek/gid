module gstcontroller.control_point;

import gid.gid;
import gobject.boxed;
import gst.types;
import gstcontroller.c.functions;
import gstcontroller.c.types;
import gstcontroller.types;

/**
    An internal structure for value+time and various temporary
  values used for interpolation. This "inherits" from
  GstTimedValue.
*/
class ControlPoint : gobject.boxed.Boxed
{

  this()
  {
    super(gMalloc(GstControlPoint.sizeof), Yes.Take);
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_control_point_get_type != &gidSymbolNotFound ? gst_control_point_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override ControlPoint self()
  {
    return this;
  }

  @property gst.types.ClockTime timestamp()
  {
    return (cast(GstControlPoint*)cPtr).timestamp;
  }

  @property void timestamp(gst.types.ClockTime propval)
  {
    (cast(GstControlPoint*)cPtr).timestamp = propval;
  }

  @property double value()
  {
    return (cast(GstControlPoint*)cPtr).value;
  }

  @property void value(double propval)
  {
    (cast(GstControlPoint*)cPtr).value = propval;
  }

  /**
      Copies a #GstControlPoint
    Returns:     A copy of cp
  */
  gstcontroller.control_point.ControlPoint copy()
  {
    GstControlPoint* _cretval;
    _cretval = gst_control_point_copy(cast(GstControlPoint*)cPtr);
    auto _retval = _cretval ? new gstcontroller.control_point.ControlPoint(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
