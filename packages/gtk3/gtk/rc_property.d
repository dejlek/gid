/// Module for [RcProperty] class
module gtk.rc_property;

import gid.gid;
import glib.string_;
import glib.types;
import gobject.param_spec;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    Deprecated
*/
class RcProperty
{
  GtkRcProperty cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.RcProperty");

    cInstance = *cast(GtkRcProperty*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property glib.types.Quark typeName()
  {
    return (cast(GtkRcProperty*)cPtr).typeName;
  }

  @property void typeName(glib.types.Quark propval)
  {
    (cast(GtkRcProperty*)cPtr).typeName = propval;
  }

  @property glib.types.Quark propertyName()
  {
    return (cast(GtkRcProperty*)cPtr).propertyName;
  }

  @property void propertyName(glib.types.Quark propval)
  {
    (cast(GtkRcProperty*)cPtr).propertyName = propval;
  }

  @property string origin()
  {
    return cToD!(string)(cast(void*)(cast(GtkRcProperty*)cPtr).origin);
  }

  @property void origin(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRcProperty*)cPtr).origin);
    dToC(propval, cast(void*)&(cast(GtkRcProperty*)cPtr).origin);
  }

  @property gobject.value.Value value()
  {
    return cToD!(gobject.value.Value)(cast(void*)&(cast(GtkRcProperty*)cPtr).value);
  }

  /**
      A #GtkRcPropertyParser for use with [gtk.settings.Settings.installPropertyParser]
      or [gtk.widget_class.WidgetClass.installStylePropertyParser] which parses
      borders in the form
      `"{ left, right, top, bottom }"` for integers
      left, right, top and bottom.
  
      Params:
        pspec = a #GParamSpec
        gstring = the #GString to be parsed
        propertyValue = a #GValue which must hold boxed values.
      Returns: true if gstring could be parsed and property_value
        has been set to the resulting #GtkBorder.
  */
  static bool parseBorder(gobject.param_spec.ParamSpec pspec, glib.string_.String gstring, gobject.value.Value propertyValue)
  {
    bool _retval;
    _retval = gtk_rc_property_parse_border(pspec ? cast(const(GParamSpec)*)pspec.cPtr(No.Dup) : null, gstring ? cast(const(GString)*)gstring.cPtr(No.Dup) : null, propertyValue ? cast(GValue*)propertyValue.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      A #GtkRcPropertyParser for use with [gtk.settings.Settings.installPropertyParser]
      or [gtk.widget_class.WidgetClass.installStylePropertyParser] which parses a
      color given either by its name or in the form
      `{ red, green, blue }` where red, green and
      blue are integers between 0 and 65535 or floating-point numbers
      between 0 and 1.
  
      Params:
        pspec = a #GParamSpec
        gstring = the #GString to be parsed
        propertyValue = a #GValue which must hold #GdkColor values.
      Returns: true if gstring could be parsed and property_value
        has been set to the resulting #GdkColor.
  */
  static bool parseColor(gobject.param_spec.ParamSpec pspec, glib.string_.String gstring, gobject.value.Value propertyValue)
  {
    bool _retval;
    _retval = gtk_rc_property_parse_color(pspec ? cast(const(GParamSpec)*)pspec.cPtr(No.Dup) : null, gstring ? cast(const(GString)*)gstring.cPtr(No.Dup) : null, propertyValue ? cast(GValue*)propertyValue.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      A #GtkRcPropertyParser for use with [gtk.settings.Settings.installPropertyParser]
      or [gtk.widget_class.WidgetClass.installStylePropertyParser] which parses a single
      enumeration value.
      
      The enumeration value can be specified by its name, its nickname or
      its numeric value. For consistency with flags parsing, the value
      may be surrounded by parentheses.
  
      Params:
        pspec = a #GParamSpec
        gstring = the #GString to be parsed
        propertyValue = a #GValue which must hold enum values.
      Returns: true if gstring could be parsed and property_value
        has been set to the resulting #GEnumValue.
  */
  static bool parseEnum(gobject.param_spec.ParamSpec pspec, glib.string_.String gstring, gobject.value.Value propertyValue)
  {
    bool _retval;
    _retval = gtk_rc_property_parse_enum(pspec ? cast(const(GParamSpec)*)pspec.cPtr(No.Dup) : null, gstring ? cast(const(GString)*)gstring.cPtr(No.Dup) : null, propertyValue ? cast(GValue*)propertyValue.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      A #GtkRcPropertyParser for use with [gtk.settings.Settings.installPropertyParser]
      or [gtk.widget_class.WidgetClass.installStylePropertyParser] which parses flags.
      
      Flags can be specified by their name, their nickname or
      numerically. Multiple flags can be specified in the form
      `"( flag1 | flag2 | ... )"`.
  
      Params:
        pspec = a #GParamSpec
        gstring = the #GString to be parsed
        propertyValue = a #GValue which must hold flags values.
      Returns: true if gstring could be parsed and property_value
        has been set to the resulting flags value.
  */
  static bool parseFlags(gobject.param_spec.ParamSpec pspec, glib.string_.String gstring, gobject.value.Value propertyValue)
  {
    bool _retval;
    _retval = gtk_rc_property_parse_flags(pspec ? cast(const(GParamSpec)*)pspec.cPtr(No.Dup) : null, gstring ? cast(const(GString)*)gstring.cPtr(No.Dup) : null, propertyValue ? cast(GValue*)propertyValue.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      A #GtkRcPropertyParser for use with [gtk.settings.Settings.installPropertyParser]
      or [gtk.widget_class.WidgetClass.installStylePropertyParser] which parses a
      requisition in the form
      `"{ width, height }"` for integers `width` and `height`.
  
      Params:
        pspec = a #GParamSpec
        gstring = the #GString to be parsed
        propertyValue = a #GValue which must hold boxed values.
      Returns: true if gstring could be parsed and property_value
        has been set to the resulting #GtkRequisition.
  */
  static bool parseRequisition(gobject.param_spec.ParamSpec pspec, glib.string_.String gstring, gobject.value.Value propertyValue)
  {
    bool _retval;
    _retval = gtk_rc_property_parse_requisition(pspec ? cast(const(GParamSpec)*)pspec.cPtr(No.Dup) : null, gstring ? cast(const(GString)*)gstring.cPtr(No.Dup) : null, propertyValue ? cast(GValue*)propertyValue.cPtr(No.Dup) : null);
    return _retval;
  }
}
