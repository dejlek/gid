module gtk.settings;

import gdk.display;
import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.style_provider;
import gtk.style_provider_mixin;
import gtk.types;

/**
    [gtk.settings.Settings] provides a mechanism to share global settings between
  applications.
  
  On the X window system, this sharing is realized by an
  [XSettings](http://www.freedesktop.org/wiki/Specifications/xsettings-spec)
  manager that is usually part of the desktop environment, along with
  utilities that let the user change these settings.
  
  On Wayland, the settings are obtained either via a settings portal,
  or by reading desktop settings from DConf.
  
  On macOS, the settings are obtained from `NSUserDefaults`.
  
  In the absence of these sharing mechanisms, GTK reads default values for
  settings from `settings.ini` files in `/etc/gtk-4.0`, `$XDG_CONFIG_DIRS/gtk-4.0`
  and `$XDG_CONFIG_HOME/gtk-4.0`. These files must be valid key files (see
  [glib.key_file.KeyFile]), and have a section called Settings. Themes can also provide
  default values for settings by installing a `settings.ini` file
  next to their `gtk.css` file.
  
  Applications can override system-wide settings by setting the property
  of the [gtk.settings.Settings] object with [gobject.object.ObjectG.set]. This should be restricted
  to special cases though; [gtk.settings.Settings] are not meant as an application
  configuration facility.
  
  There is one [gtk.settings.Settings] instance per display. It can be obtained with
  [gtk.settings.Settings.getForDisplay], but in many cases, it is more
  convenient to use [gtk.widget.Widget.getSettings].
*/
class Settings : gobject.object.ObjectG, gtk.style_provider.StyleProvider
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_settings_get_type != &gidSymbolNotFound ? gtk_settings_get_type() : cast(GType)0;
  }

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
      Gets the [gtk.settings.Settings] object for the default display, creating
    it if necessary.
    
    See [gtk.settings.Settings.getForDisplay].
    Returns:     a [gtk.settings.Settings] object. If there is
        no default display, then returns null.
  */
  static gtk.settings.Settings getDefault()
  {
    GtkSettings* _cretval;
    _cretval = gtk_settings_get_default();
    auto _retval = ObjectG.getDObject!(gtk.settings.Settings)(cast(GtkSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the [gtk.settings.Settings] object for display, creating it if necessary.
    Params:
      display =       a [gdk.display.Display]
    Returns:     a [gtk.settings.Settings] object
  */
  static gtk.settings.Settings getForDisplay(gdk.display.Display display)
  {
    GtkSettings* _cretval;
    _cretval = gtk_settings_get_for_display(display ? cast(GdkDisplay*)display.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.settings.Settings)(cast(GtkSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
      Undoes the effect of calling [gobject.object.ObjectG.set] to install an
    application-specific value for a setting.
    
    After this call, the setting will again follow the session-wide
    value for this setting.
    Params:
      name =       the name of the setting to reset
  */
  void resetProperty(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_settings_reset_property(cast(GtkSettings*)cPtr, _name);
  }
}
