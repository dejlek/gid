/// Module for [OtVarAxisInfo] class
module harfbuzz.ot_var_axis_info;

import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Data type for holding variation-axis values.
    
    The minimum, default, and maximum values are in un-normalized, user scales.
    
    <note>Note: at present, the only flag defined for @flags is
    #HB_OT_VAR_AXIS_FLAG_HIDDEN.</note>
*/
class OtVarAxisInfo : gobject.boxed.Boxed
{

  /**
      Create a `ot_var_axis_info.OtVarAxisInfo` boxed type.
      Params:
        axisIndex = Index of the axis in the variation-axis array
        tag = The #hb_tag_t tag identifying the design variation of the axis
        nameId = The `name` table Name ID that provides display names for the axis
        flags = The #hb_ot_var_axis_flags_t flags for the axis
        minValue = The minimum value on the variation axis that the font covers
        defaultValue = The position on the variation axis corresponding to the font's defaults
        maxValue = The maximum value on the variation axis that the font covers
  */
  this(uint axisIndex = uint.init, harfbuzz.types.Tag tag = harfbuzz.types.Tag.init, harfbuzz.types.OtNameId nameId = harfbuzz.types.OtNameId.init, harfbuzz.types.OtVarAxisFlags flags = harfbuzz.types.OtVarAxisFlags.init, float minValue = 0.0, float defaultValue = 0.0, float maxValue = 0.0)
  {
    super(gMalloc(hb_ot_var_axis_info_t.sizeof), Yes.Take);
    this.axisIndex = axisIndex;
    this.tag = tag;
    this.nameId = nameId;
    this.flags = flags;
    this.minValue = minValue;
    this.defaultValue = defaultValue;
    this.maxValue = maxValue;
  }

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_ot_var_axis_info_get_type != &gidSymbolNotFound ? hb_gobject_ot_var_axis_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override OtVarAxisInfo self()
  {
    return this;
  }

  /**
      Get `axisIndex` field.
      Returns: Index of the axis in the variation-axis array
  */
  @property uint axisIndex()
  {
    return (cast(hb_ot_var_axis_info_t*)cPtr).axisIndex;
  }

  /**
      Set `axisIndex` field.
      Params:
        propval = Index of the axis in the variation-axis array
  */
  @property void axisIndex(uint propval)
  {
    (cast(hb_ot_var_axis_info_t*)cPtr).axisIndex = propval;
  }

  /**
      Get `tag` field.
      Returns: The #hb_tag_t tag identifying the design variation of the axis
  */
  @property harfbuzz.types.Tag tag()
  {
    return (cast(hb_ot_var_axis_info_t*)cPtr).tag;
  }

  /**
      Set `tag` field.
      Params:
        propval = The #hb_tag_t tag identifying the design variation of the axis
  */
  @property void tag(harfbuzz.types.Tag propval)
  {
    (cast(hb_ot_var_axis_info_t*)cPtr).tag = propval;
  }

  /**
      Get `nameId` field.
      Returns: The `name` table Name ID that provides display names for the axis
  */
  @property harfbuzz.types.OtNameId nameId()
  {
    return (cast(hb_ot_var_axis_info_t*)cPtr).nameId;
  }

  /**
      Set `nameId` field.
      Params:
        propval = The `name` table Name ID that provides display names for the axis
  */
  @property void nameId(harfbuzz.types.OtNameId propval)
  {
    (cast(hb_ot_var_axis_info_t*)cPtr).nameId = propval;
  }

  /**
      Get `flags` field.
      Returns: The #hb_ot_var_axis_flags_t flags for the axis
  */
  @property harfbuzz.types.OtVarAxisFlags flags()
  {
    return cast(harfbuzz.types.OtVarAxisFlags)(cast(hb_ot_var_axis_info_t*)cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = The #hb_ot_var_axis_flags_t flags for the axis
  */
  @property void flags(harfbuzz.types.OtVarAxisFlags propval)
  {
    (cast(hb_ot_var_axis_info_t*)cPtr).flags = cast(hb_ot_var_axis_flags_t)propval;
  }

  /**
      Get `minValue` field.
      Returns: The minimum value on the variation axis that the font covers
  */
  @property float minValue()
  {
    return (cast(hb_ot_var_axis_info_t*)cPtr).minValue;
  }

  /**
      Set `minValue` field.
      Params:
        propval = The minimum value on the variation axis that the font covers
  */
  @property void minValue(float propval)
  {
    (cast(hb_ot_var_axis_info_t*)cPtr).minValue = propval;
  }

  /**
      Get `defaultValue` field.
      Returns: The position on the variation axis corresponding to the font's defaults
  */
  @property float defaultValue()
  {
    return (cast(hb_ot_var_axis_info_t*)cPtr).defaultValue;
  }

  /**
      Set `defaultValue` field.
      Params:
        propval = The position on the variation axis corresponding to the font's defaults
  */
  @property void defaultValue(float propval)
  {
    (cast(hb_ot_var_axis_info_t*)cPtr).defaultValue = propval;
  }

  /**
      Get `maxValue` field.
      Returns: The maximum value on the variation axis that the font covers
  */
  @property float maxValue()
  {
    return (cast(hb_ot_var_axis_info_t*)cPtr).maxValue;
  }

  /**
      Set `maxValue` field.
      Params:
        propval = The maximum value on the variation axis that the font covers
  */
  @property void maxValue(float propval)
  {
    (cast(hb_ot_var_axis_info_t*)cPtr).maxValue = propval;
  }
}
