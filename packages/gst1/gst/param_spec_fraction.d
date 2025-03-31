/// Module for [ParamSpecFraction] class
module gst.param_spec_fraction;

import gid.gid;
import gobject.param_spec;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    A GParamSpec derived structure that contains the meta data for fractional
    properties.
*/
class ParamSpecFraction
{
  GstParamSpecFraction cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gst.ParamSpecFraction");

    cInstance = *cast(GstParamSpecFraction*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gobject.param_spec.ParamSpec parentInstance()
  {
    return cToD!(gobject.param_spec.ParamSpec)(cast(void*)&(cast(GstParamSpecFraction*)cPtr).parentInstance);
  }

  @property void parentInstance(gobject.param_spec.ParamSpec propval)
  {
    cValueFree!(gobject.param_spec.ParamSpec)(cast(void*)&(cast(GstParamSpecFraction*)cPtr).parentInstance);
    dToC(propval, cast(void*)&(cast(GstParamSpecFraction*)cPtr).parentInstance);
  }

  @property int minNum()
  {
    return (cast(GstParamSpecFraction*)cPtr).minNum;
  }

  @property void minNum(int propval)
  {
    (cast(GstParamSpecFraction*)cPtr).minNum = propval;
  }

  @property int minDen()
  {
    return (cast(GstParamSpecFraction*)cPtr).minDen;
  }

  @property void minDen(int propval)
  {
    (cast(GstParamSpecFraction*)cPtr).minDen = propval;
  }

  @property int maxNum()
  {
    return (cast(GstParamSpecFraction*)cPtr).maxNum;
  }

  @property void maxNum(int propval)
  {
    (cast(GstParamSpecFraction*)cPtr).maxNum = propval;
  }

  @property int maxDen()
  {
    return (cast(GstParamSpecFraction*)cPtr).maxDen;
  }

  @property void maxDen(int propval)
  {
    (cast(GstParamSpecFraction*)cPtr).maxDen = propval;
  }

  @property int defNum()
  {
    return (cast(GstParamSpecFraction*)cPtr).defNum;
  }

  @property void defNum(int propval)
  {
    (cast(GstParamSpecFraction*)cPtr).defNum = propval;
  }

  @property int defDen()
  {
    return (cast(GstParamSpecFraction*)cPtr).defDen;
  }

  @property void defDen(int propval)
  {
    (cast(GstParamSpecFraction*)cPtr).defDen = propval;
  }
}
