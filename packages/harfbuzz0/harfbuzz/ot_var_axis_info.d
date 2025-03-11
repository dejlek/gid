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

  this()
  {
    super(gMalloc(hb_ot_var_axis_info_t.sizeof), Yes.Take);
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
    return cast(void function())hb_gobject_ot_var_axis_info_get_type != &gidSymbolNotFound ? hb_gobject_ot_var_axis_info_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property uint axisIndex()
  {
    return (cast(hb_ot_var_axis_info_t*)cPtr).axisIndex;
  }

  @property void axisIndex(uint propval)
  {
    (cast(hb_ot_var_axis_info_t*)cPtr).axisIndex = propval;
  }

  @property harfbuzz.types.Tag tag()
  {
    return (cast(hb_ot_var_axis_info_t*)cPtr).tag;
  }

  @property void tag(harfbuzz.types.Tag propval)
  {
    (cast(hb_ot_var_axis_info_t*)cPtr).tag = propval;
  }

  @property harfbuzz.types.OtNameId nameId()
  {
    return (cast(hb_ot_var_axis_info_t*)cPtr).nameId;
  }

  @property void nameId(harfbuzz.types.OtNameId propval)
  {
    (cast(hb_ot_var_axis_info_t*)cPtr).nameId = propval;
  }

  @property harfbuzz.types.OtVarAxisFlags flags()
  {
    return cast(harfbuzz.types.OtVarAxisFlags)(cast(hb_ot_var_axis_info_t*)cPtr).flags;
  }

  @property void flags(harfbuzz.types.OtVarAxisFlags propval)
  {
    (cast(hb_ot_var_axis_info_t*)cPtr).flags = cast(hb_ot_var_axis_flags_t)propval;
  }

  @property float minValue()
  {
    return (cast(hb_ot_var_axis_info_t*)cPtr).minValue;
  }

  @property void minValue(float propval)
  {
    (cast(hb_ot_var_axis_info_t*)cPtr).minValue = propval;
  }

  @property float defaultValue()
  {
    return (cast(hb_ot_var_axis_info_t*)cPtr).defaultValue;
  }

  @property void defaultValue(float propval)
  {
    (cast(hb_ot_var_axis_info_t*)cPtr).defaultValue = propval;
  }

  @property float maxValue()
  {
    return (cast(hb_ot_var_axis_info_t*)cPtr).maxValue;
  }

  @property void maxValue(float propval)
  {
    (cast(hb_ot_var_axis_info_t*)cPtr).maxValue = propval;
  }
}
