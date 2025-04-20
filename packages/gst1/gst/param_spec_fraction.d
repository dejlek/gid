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
      throw new GidConstructException("Null instance pointer for gst.param_spec_fraction.ParamSpecFraction");

    cInstance = *cast(GstParamSpecFraction*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `parentInstance` field.
      Returns: super class
  */
  @property gobject.param_spec.ParamSpec parentInstance()
  {
    return cToD!(gobject.param_spec.ParamSpec)(cast(void*)&(cast(GstParamSpecFraction*)cPtr).parentInstance);
  }

  /**
      Set `parentInstance` field.
      Params:
        propval = super class
  */
  @property void parentInstance(gobject.param_spec.ParamSpec propval)
  {
    cValueFree!(gobject.param_spec.ParamSpec)(cast(void*)&(cast(GstParamSpecFraction*)cPtr).parentInstance);
    dToC(propval, cast(void*)&(cast(GstParamSpecFraction*)cPtr).parentInstance);
  }

  /**
      Get `minNum` field.
      Returns: minimal numerator
  */
  @property int minNum()
  {
    return (cast(GstParamSpecFraction*)cPtr).minNum;
  }

  /**
      Set `minNum` field.
      Params:
        propval = minimal numerator
  */
  @property void minNum(int propval)
  {
    (cast(GstParamSpecFraction*)cPtr).minNum = propval;
  }

  /**
      Get `minDen` field.
      Returns: minimal denominator
  */
  @property int minDen()
  {
    return (cast(GstParamSpecFraction*)cPtr).minDen;
  }

  /**
      Set `minDen` field.
      Params:
        propval = minimal denominator
  */
  @property void minDen(int propval)
  {
    (cast(GstParamSpecFraction*)cPtr).minDen = propval;
  }

  /**
      Get `maxNum` field.
      Returns: maximal numerator
  */
  @property int maxNum()
  {
    return (cast(GstParamSpecFraction*)cPtr).maxNum;
  }

  /**
      Set `maxNum` field.
      Params:
        propval = maximal numerator
  */
  @property void maxNum(int propval)
  {
    (cast(GstParamSpecFraction*)cPtr).maxNum = propval;
  }

  /**
      Get `maxDen` field.
      Returns: maximal denominator
  */
  @property int maxDen()
  {
    return (cast(GstParamSpecFraction*)cPtr).maxDen;
  }

  /**
      Set `maxDen` field.
      Params:
        propval = maximal denominator
  */
  @property void maxDen(int propval)
  {
    (cast(GstParamSpecFraction*)cPtr).maxDen = propval;
  }

  /**
      Get `defNum` field.
      Returns: default numerator
  */
  @property int defNum()
  {
    return (cast(GstParamSpecFraction*)cPtr).defNum;
  }

  /**
      Set `defNum` field.
      Params:
        propval = default numerator
  */
  @property void defNum(int propval)
  {
    (cast(GstParamSpecFraction*)cPtr).defNum = propval;
  }

  /**
      Get `defDen` field.
      Returns: default denominator
  */
  @property int defDen()
  {
    return (cast(GstParamSpecFraction*)cPtr).defDen;
  }

  /**
      Set `defDen` field.
      Params:
        propval = default denominator
  */
  @property void defDen(int propval)
  {
    (cast(GstParamSpecFraction*)cPtr).defDen = propval;
  }
}
