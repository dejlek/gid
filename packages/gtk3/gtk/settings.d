/// Module for [Settings] class
module gtk.settings;

import gdk.screen;
import gid.gid;
import glib.string_;
import gobject.object;
import gobject.param_spec;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.settings_value;
import gtk.style_provider;
import gtk.style_provider_mixin;
import gtk.types;

/**
    GtkSettings provide a mechanism to share global settings between
    applications.
    
    On the X window system, this sharing is realized by an
    [XSettings](http://www.freedesktop.org/wiki/Specifications/xsettings-spec)
    manager that is usually part of the desktop environment, along with
    utilities that let the user change these settings. In the absence of
    an Xsettings manager, GTK+ reads default values for settings from
    `settings.ini` files in
    `/etc/gtk-3.0`, `$XDG_CONFIG_DIRS/gtk-3.0`
    and `$XDG_CONFIG_HOME/gtk-3.0`.
    These files must be valid key files (see #GKeyFile), and have
    a section called Settings. Themes can also provide default values
    for settings by installing a `settings.ini` file
    next to their `gtk.css` file.
    
    Applications can override system-wide settings by setting the property
    of the GtkSettings object with [gobject.object.ObjectG.set]. This should be restricted
    to special cases though; GtkSettings are not meant as an application
    configuration facility. When doing so, you need to be aware that settings
    that are specific to individual widgets may not be available before the
    widget type has been realized at least once. The following example
    demonstrates a way to do this:
    ```c
      gtk_init (&argc, &argv);
    
      // make sure the type is realized
      g_type_class_unref (g_type_class_ref (GTK_TYPE_IMAGE_MENU_ITEM));
    
      g_object_set (gtk_settings_get_default (), "gtk-enable-animations", FALSE, NULL);
    ```
    
    There is one GtkSettings instance per screen. It can be obtained with
    [gtk.settings.Settings.getForScreen], but in many cases, it is more convenient
    to use [gtk.widget.Widget.getSettings]. [gtk.settings.Settings.getDefault] returns the
    GtkSettings instance for the default screen.
*/
class Settings : gobject.object.ObjectG, gtk.style_provider.StyleProvider
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
    return cast(void function())gtk_settings_get_type != &gidSymbolNotFound ? gtk_settings_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override Settings self()
  {
    return this;
  }

  mixin StyleProviderT!();

  /**
      Gets the #GtkSettings object for the default GDK screen, creating
      it if necessary. See [gtk.settings.Settings.getForScreen].
      Returns: a #GtkSettings object. If there is
        no default screen, then returns null.
  */
  static gtk.settings.Settings getDefault()
  {
    GtkSettings* _cretval;
    _cretval = gtk_settings_get_default();
    auto _retval = ObjectG.getDObject!(gtk.settings.Settings)(cast(GtkSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GtkSettings object for screen, creating it if necessary.
  
      Params:
        screen = a #GdkScreen.
      Returns: a #GtkSettings object.
  */
  static gtk.settings.Settings getForScreen(gdk.screen.Screen screen)
  {
    GtkSettings* _cretval;
    _cretval = gtk_settings_get_for_screen(screen ? cast(GdkScreen*)screen.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.settings.Settings)(cast(GtkSettings*)_cretval, No.Take);
    return _retval;
  }

  /** */
  static void installProperty(gobject.param_spec.ParamSpec pspec)
  {
    gtk_settings_install_property(pspec ? cast(GParamSpec*)pspec.cPtr(No.Dup) : null);
  }

  /** */
  static void installPropertyParser(gobject.param_spec.ParamSpec pspec, gtk.types.RcPropertyParser parser)
  {
    static gtk.types.RcPropertyParser _static_parser;

    extern(C) bool _parserCallback(const(GParamSpec)* pspec, const(GString)* rcString, GValue* propertyValue)
    {
      bool _retval = _static_parser(pspec ? new gobject.param_spec.ParamSpec(cast(void*)pspec, No.Take) : null, rcString ? new glib.string_.String(cast(void*)rcString, No.Take) : null, propertyValue ? new gobject.value.Value(cast(void*)propertyValue, No.Take) : null);
      return _retval;
    }
    auto _parserCB = parser ? &_parserCallback : null;

    _static_parser = parser;
    gtk_settings_install_property_parser(pspec ? cast(GParamSpec*)pspec.cPtr(No.Dup) : null, _parserCB);
    _static_parser = null;
  }

  /**
      Undoes the effect of calling [gobject.object.ObjectG.set] to install an
      application-specific value for a setting. After this call,
      the setting will again follow the session-wide value for
      this setting.
  
      Params:
        name = the name of the setting to reset
  */
  void resetProperty(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_settings_reset_property(cast(GtkSettings*)cPtr, _name);
  }

  /** */
  void setDoubleProperty(string name, double vDouble, string origin)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _origin = origin.toCString(No.Alloc);
    gtk_settings_set_double_property(cast(GtkSettings*)cPtr, _name, vDouble, _origin);
  }

  /** */
  void setLongProperty(string name, glong vLong, string origin)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _origin = origin.toCString(No.Alloc);
    gtk_settings_set_long_property(cast(GtkSettings*)cPtr, _name, vLong, _origin);
  }

  /** */
  void setPropertyValue(string name, gtk.settings_value.SettingsValue svalue)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_settings_set_property_value(cast(GtkSettings*)cPtr, _name, svalue ? cast(const(GtkSettingsValue)*)svalue.cPtr : null);
  }

  /** */
  void setStringProperty(string name, string vString, string origin)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _vString = vString.toCString(No.Alloc);
    const(char)* _origin = origin.toCString(No.Alloc);
    gtk_settings_set_string_property(cast(GtkSettings*)cPtr, _name, _vString, _origin);
  }
}
