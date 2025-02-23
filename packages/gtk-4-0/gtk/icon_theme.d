module gtk.icon_theme;

import gdk.display;
import gid.gid;
import gio.icon;
import gio.icon_mixin;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.icon_paintable;
import gtk.types;

/**
 * `GtkIconTheme` provides a facility for loading themed icons.
 * The main reason for using a name rather than simply providing a filename
 * is to allow different icons to be used depending on what “icon theme” is
 * selected by the user. The operation of icon themes on Linux and Unix
 * follows the [Icon Theme Specification](http://www.freedesktop.org/Standards/icon-theme-spec)
 * There is a fallback icon theme, named `hicolor`, where applications
 * should install their icons, but additional icon themes can be installed
 * as operating system vendors and users choose.
 * In many cases, named themes are used indirectly, via [Gtk.Image]
 * rather than directly, but looking up icons directly is also simple. The
 * `GtkIconTheme` object acts as a database of all the icons in the current
 * theme. You can create new `GtkIconTheme` objects, but it’s much more
 * efficient to use the standard icon theme of the `GtkWidget` so that the
 * icon information is shared with other people looking up icons.
 * ```c
 * GtkIconTheme *icon_theme;
 * GtkIconPaintable *icon;
 * GdkPaintable *paintable;
 * icon_theme \= gtk_icon_theme_get_for_display $(LPAREN)gtk_widget_get_display $(LPAREN)my_widget$(RPAREN)$(RPAREN);
 * icon \= gtk_icon_theme_lookup_icon $(LPAREN)icon_theme,
 * "my-icon-name", // icon name
 * 48, // icon size
 * 1,  // scale
 * 0,  // flags$(RPAREN);
 * paintable \= GDK_PAINTABLE $(LPAREN)icon$(RPAREN);
 * // Use the paintable
 * g_object_unref $(LPAREN)icon$(RPAREN);
 * ```
 */
class IconTheme : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_icon_theme_get_type != &gidSymbolNotFound ? gtk_icon_theme_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new icon theme object.
   * Icon theme objects are used to lookup up an icon by name
   * in a particular icon theme. Usually, you’ll want to use
   * [Gtk.IconTheme.getForDisplay] rather than creating
   * a new icon theme object for scratch.
   * Returns: the newly created `GtkIconTheme` object.
   */
  this()
  {
    GtkIconTheme* _cretval;
    _cretval = gtk_icon_theme_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the icon theme object associated with display.
   * If this function has not previously been called for the given
   * display, a new icon theme object will be created and associated
   * with the display. Icon theme objects are fairly expensive to create,
   * so using this function is usually a better choice than calling
   * [Gtk.IconTheme.new_] and setting the display yourself; by using
   * this function a single icon theme object will be shared between users.
   * Params:
   *   display = a `GdkDisplay`
   * Returns: A unique `GtkIconTheme` associated with
   *   the given display. This icon theme is associated with the display
   *   and can be used as long as the display is open. Do not ref or unref it.
   */
  static IconTheme getForDisplay(Display display)
  {
    GtkIconTheme* _cretval;
    _cretval = gtk_icon_theme_get_for_display(display ? cast(GdkDisplay*)display.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!IconTheme(cast(GtkIconTheme*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Adds a resource path that will be looked at when looking
   * for icons, similar to search paths.
   * See [Gtk.IconTheme.setResourcePath].
   * This function should be used to make application-specific icons
   * available as part of the icon theme.
   * Params:
   *   path = a resource path
   */
  void addResourcePath(string path)
  {
    const(char)* _path = path.toCString(No.Alloc);
    gtk_icon_theme_add_resource_path(cast(GtkIconTheme*)cPtr, _path);
  }

  /**
   * Appends a directory to the search path.
   * See [Gtk.IconTheme.setSearchPath].
   * Params:
   *   path = directory name to append to the icon path
   */
  void addSearchPath(string path)
  {
    const(char)* _path = path.toCString(No.Alloc);
    gtk_icon_theme_add_search_path(cast(GtkIconTheme*)cPtr, _path);
  }

  /**
   * Returns the display that the `GtkIconTheme` object was
   * created for.
   * Returns: the display of icon_theme
   */
  Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gtk_icon_theme_get_display(cast(GtkIconTheme*)cPtr);
    auto _retval = ObjectG.getDObject!Display(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Lists the names of icons in the current icon theme.
   * Returns: a string array
   *   holding the names of all the icons in the theme. You must
   *   free the array using [GLib.Global.strfreev].
   */
  string[] getIconNames()
  {
    char** _cretval;
    _cretval = gtk_icon_theme_get_icon_names(cast(GtkIconTheme*)cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
    }
    return _retval;
  }

  /**
   * Returns an array of integers describing the sizes at which
   * the icon is available without scaling.
   * A size of -1 means that the icon is available in a scalable
   * format. The array is zero-terminated.
   * Params:
   *   iconName = the name of an icon
   * Returns: A newly
   *   allocated array describing the sizes at which the icon is
   *   available. The array should be freed with [GLib.Global.gfree] when it is no
   *   longer needed.
   */
  int[] getIconSizes(string iconName)
  {
    int* _cretval;
    const(char)* _iconName = iconName.toCString(No.Alloc);
    _cretval = gtk_icon_theme_get_icon_sizes(cast(GtkIconTheme*)cPtr, _iconName);
    int[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] != 0; _cretlength++)
        break;
      _retval = cast(int[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  /**
   * Gets the current resource path.
   * See [Gtk.IconTheme.setResourcePath].
   * Returns: A list of resource paths
   */
  string[] getResourcePath()
  {
    char** _cretval;
    _cretval = gtk_icon_theme_get_resource_path(cast(GtkIconTheme*)cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
    }
    return _retval;
  }

  /**
   * Gets the current search path.
   * See [Gtk.IconTheme.setSearchPath].
   * Returns: a list of icon theme path directories
   */
  string[] getSearchPath()
  {
    char** _cretval;
    _cretval = gtk_icon_theme_get_search_path(cast(GtkIconTheme*)cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
    }
    return _retval;
  }

  /**
   * Gets the current icon theme name.
   * Returns $(LPAREN)transfer full$(RPAREN): the current icon theme name,
   * Returns:
   */
  string getThemeName()
  {
    char* _cretval;
    _cretval = gtk_icon_theme_get_theme_name(cast(GtkIconTheme*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Checks whether an icon theme includes an icon
   * for a particular `GIcon`.
   * Params:
   *   gicon = a `GIcon`
   * Returns: %TRUE if self includes an icon for gicon
   */
  bool hasGicon(Icon gicon)
  {
    bool _retval;
    _retval = gtk_icon_theme_has_gicon(cast(GtkIconTheme*)cPtr, gicon ? cast(GIcon*)(cast(ObjectG)gicon).cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Checks whether an icon theme includes an icon
   * for a particular name.
   * Params:
   *   iconName = the name of an icon
   * Returns: %TRUE if self includes an
   *   icon for icon_name.
   */
  bool hasIcon(string iconName)
  {
    bool _retval;
    const(char)* _iconName = iconName.toCString(No.Alloc);
    _retval = gtk_icon_theme_has_icon(cast(GtkIconTheme*)cPtr, _iconName);
    return _retval;
  }

  /**
   * Looks up a icon for a desired size and window scale.
   * The icon can then be rendered by using it as a `GdkPaintable`,
   * or you can get information such as the filename and size.
   * Params:
   *   icon = the `GIcon` to look up
   *   size = desired icon size
   *   scale = the desired scale
   *   direction = text direction the icon will be displayed in
   *   flags = flags modifying the behavior of the icon lookup
   * Returns: a `GtkIconPaintable` containing
   *   information about the icon. Unref with [GObject.ObjectG.unref]
   */
  IconPaintable lookupByGicon(Icon icon, int size, int scale, TextDirection direction, IconLookupFlags flags)
  {
    GtkIconPaintable* _cretval;
    _cretval = gtk_icon_theme_lookup_by_gicon(cast(GtkIconTheme*)cPtr, icon ? cast(GIcon*)(cast(ObjectG)icon).cPtr(No.Dup) : null, size, scale, direction, flags);
    auto _retval = ObjectG.getDObject!IconPaintable(cast(GtkIconPaintable*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Looks up a named icon for a desired size and window scale,
   * returning a `GtkIconPaintable`.
   * The icon can then be rendered by using it as a `GdkPaintable`,
   * or you can get information such as the filename and size.
   * If the available icon_name is not available and fallbacks are
   * provided, they will be tried in order.
   * If no matching icon is found, then a paintable that renders the
   * "missing icon" icon is returned. If you need to do something else
   * for missing icons you need to use [Gtk.IconTheme.hasIcon].
   * Note that you probably want to listen for icon theme changes and
   * update the icon. This is usually done by overriding the
   * GtkWidgetClass.css-changed$(LPAREN)$(RPAREN) function.
   * Params:
   *   iconName = the name of the icon to lookup
   *   fallbacks =
   *   size = desired icon size.
   *   scale = the window scale this will be displayed on
   *   direction = text direction the icon will be displayed in
   *   flags = flags modifying the behavior of the icon lookup
   * Returns: a `GtkIconPaintable` object
   *   containing the icon.
   */
  IconPaintable lookupIcon(string iconName, string[] fallbacks, int size, int scale, TextDirection direction, IconLookupFlags flags)
  {
    GtkIconPaintable* _cretval;
    const(char)* _iconName = iconName.toCString(No.Alloc);
    char*[] _tmpfallbacks;
    foreach (s; fallbacks)
      _tmpfallbacks ~= s.toCString(No.Alloc);
    _tmpfallbacks ~= null;
    const(char*)* _fallbacks = _tmpfallbacks.ptr;
    _cretval = gtk_icon_theme_lookup_icon(cast(GtkIconTheme*)cPtr, _iconName, _fallbacks, size, scale, direction, flags);
    auto _retval = ObjectG.getDObject!IconPaintable(cast(GtkIconPaintable*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Sets the resource paths that will be looked at when
   * looking for icons, similar to search paths.
   * The resources are considered as part of the hicolor icon theme
   * and must be located in subdirectories that are defined in the
   * hicolor icon theme, such as `path/16x16/actions/run.png`
   * or `path/scalable/actions/run.svg`.
   * Icons that are directly placed in the resource path instead
   * of a subdirectory are also considered as ultimate fallback,
   * but they are treated like unthemed icons.
   * Params:
   *   path = NULL-terminated array of resource paths
   *     that are searched for icons
   */
  void setResourcePath(string[] path)
  {
    const(char)*[] _tmppath;
    foreach (s; path)
      _tmppath ~= s.toCString(No.Alloc);
    _tmppath ~= null;
    const(char*)* _path = _tmppath.ptr;
    gtk_icon_theme_set_resource_path(cast(GtkIconTheme*)cPtr, _path);
  }

  /**
   * Sets the search path for the icon theme object.
   * When looking for an icon theme, GTK will search for a subdirectory
   * of one or more of the directories in path with the same name
   * as the icon theme containing an index.theme file. $(LPAREN)Themes from
   * multiple of the path elements are combined to allow themes to be
   * extended by adding icons in the user’s home directory.$(RPAREN)
   * In addition if an icon found isn’t found either in the current
   * icon theme or the default icon theme, and an image file with
   * the right name is found directly in one of the elements of
   * path, then that image will be used for the icon name.
   * $(LPAREN)This is legacy feature, and new icons should be put
   * into the fallback icon theme, which is called hicolor,
   * rather than directly on the icon path.$(RPAREN)
   * Params:
   *   path = NULL-terminated
   *     array of directories that are searched for icon themes
   */
  void setSearchPath(string[] path)
  {
    const(char)*[] _tmppath;
    foreach (s; path)
      _tmppath ~= s.toCString(No.Alloc);
    _tmppath ~= null;
    const(char*)* _path = _tmppath.ptr;
    gtk_icon_theme_set_search_path(cast(GtkIconTheme*)cPtr, _path);
  }

  /**
   * Sets the name of the icon theme that the `GtkIconTheme` object uses
   * overriding system configuration.
   * This function cannot be called on the icon theme objects returned
   * from [Gtk.IconTheme.getForDisplay].
   * Params:
   *   themeName = name of icon theme to use instead of
   *     configured theme, or %NULL to unset a previously set custom theme
   */
  void setThemeName(string themeName)
  {
    const(char)* _themeName = themeName.toCString(No.Alloc);
    gtk_icon_theme_set_theme_name(cast(GtkIconTheme*)cPtr, _themeName);
  }

  /**
   * Emitted when the icon theme changes.
   * This can happen because current icon theme is switched or
   * because GTK detects that a change has occurred in the
   * contents of the current icon theme.
   *   iconTheme = the instance the signal is connected to
   */
  alias ChangedCallbackDlg = void delegate(IconTheme iconTheme);
  alias ChangedCallbackFunc = void function(IconTheme iconTheme);

  /**
   * Connect to Changed signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChangedCallbackDlg) || is(T : ChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto iconTheme = getVal!IconTheme(_paramVals);
      _dClosure.dlg(iconTheme);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }
}
