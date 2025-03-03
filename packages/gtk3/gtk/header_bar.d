module gtk.header_bar;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.container;
import gtk.types;
import gtk.widget;

/**
 * GtkHeaderBar is similar to a horizontal #GtkBox. It allows children to
 * be placed at the start or the end. In addition, it allows a title and
 * subtitle to be displayed. The title will be centered with respect to
 * the width of the box, even if the children at either side take up
 * different amounts of space. The height of the titlebar will be
 * set to provide sufficient space for the subtitle, even if none is
 * currently set. If a subtitle is not needed, the space reservation
 * can be turned off with [gtk.header_bar.HeaderBar.setHasSubtitle].
 * GtkHeaderBar can add typical window frame controls, such as minimize,
 * maximize and close buttons, or the window icon.
 * For these reasons, GtkHeaderBar is the natural choice for use as the custom
 * titlebar widget of a #GtkWindow $(LPAREN)see [gtk.window.Window.setTitlebar]$(RPAREN), as it gives
 * features typical of titlebars while allowing the addition of child widgets.
 */
class HeaderBar : gtk.container.Container
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_header_bar_get_type != &gidSymbolNotFound ? gtk_header_bar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new #GtkHeaderBar widget.
   * Returns: a new #GtkHeaderBar
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_header_bar_new();
    this(_cretval, No.Take);
  }

  /**
   * Retrieves the custom title widget of the header. See
   * [gtk.header_bar.HeaderBar.setCustomTitle].
   * Returns: the custom title widget
   *   of the header, or %NULL if none has been set explicitly.
   */
  gtk.widget.Widget getCustomTitle()
  {
    GtkWidget* _cretval;
    _cretval = gtk_header_bar_get_custom_title(cast(GtkHeaderBar*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the decoration layout set with
   * [gtk.header_bar.HeaderBar.setDecorationLayout].
   * Returns: the decoration layout
   */
  string getDecorationLayout()
  {
    const(char)* _cretval;
    _cretval = gtk_header_bar_get_decoration_layout(cast(GtkHeaderBar*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Retrieves whether the header bar reserves space for
   * a subtitle, regardless if one is currently set or not.
   * Returns: %TRUE if the header bar reserves space
   *   for a subtitle
   */
  bool getHasSubtitle()
  {
    bool _retval;
    _retval = gtk_header_bar_get_has_subtitle(cast(GtkHeaderBar*)cPtr);
    return _retval;
  }

  /**
   * Returns whether this header bar shows the standard window
   * decorations.
   * Returns: %TRUE if the decorations are shown
   */
  bool getShowCloseButton()
  {
    bool _retval;
    _retval = gtk_header_bar_get_show_close_button(cast(GtkHeaderBar*)cPtr);
    return _retval;
  }

  /**
   * Retrieves the subtitle of the header. See [gtk.header_bar.HeaderBar.setSubtitle].
   * Returns: the subtitle of the header, or %NULL if none has
   *   been set explicitly. The returned string is owned by the widget
   *   and must not be modified or freed.
   */
  string getSubtitle()
  {
    const(char)* _cretval;
    _cretval = gtk_header_bar_get_subtitle(cast(GtkHeaderBar*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Retrieves the title of the header. See [gtk.header_bar.HeaderBar.setTitle].
   * Returns: the title of the header, or %NULL if none has
   *   been set explicitly. The returned string is owned by the widget
   *   and must not be modified or freed.
   */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_header_bar_get_title(cast(GtkHeaderBar*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Adds child to bar, packed with reference to the
   * end of the bar.
   * Params:
   *   child = the #GtkWidget to be added to bar
   */
  void packEnd(gtk.widget.Widget child)
  {
    gtk_header_bar_pack_end(cast(GtkHeaderBar*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
   * Adds child to bar, packed with reference to the
   * start of the bar.
   * Params:
   *   child = the #GtkWidget to be added to bar
   */
  void packStart(gtk.widget.Widget child)
  {
    gtk_header_bar_pack_start(cast(GtkHeaderBar*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
   * Sets a custom title for the #GtkHeaderBar.
   * The title should help a user identify the current view. This
   * supersedes any title set by [gtk.header_bar.HeaderBar.setTitle] or
   * [gtk.header_bar.HeaderBar.setSubtitle]. To achieve the same style as
   * the builtin title and subtitle, use the “title” and “subtitle”
   * style classes.
   * You should set the custom title to %NULL, for the header title
   * label to be visible again.
   * Params:
   *   titleWidget = a custom widget to use for a title
   */
  void setCustomTitle(gtk.widget.Widget titleWidget)
  {
    gtk_header_bar_set_custom_title(cast(GtkHeaderBar*)cPtr, titleWidget ? cast(GtkWidget*)titleWidget.cPtr(No.Dup) : null);
  }

  /**
   * Sets the decoration layout for this header bar, overriding
   * the #GtkSettings:gtk-decoration-layout setting.
   * There can be valid reasons for overriding the setting, such
   * as a header bar design that does not allow for buttons to take
   * room on the right, or only offers room for a single close button.
   * Split header bars are another example for overriding the
   * setting.
   * The format of the string is button names, separated by commas.
   * A colon separates the buttons that should appear on the left
   * from those on the right. Recognized button names are minimize,
   * maximize, close, icon $(LPAREN)the window icon$(RPAREN) and menu $(LPAREN)a menu button
   * for the fallback app menu$(RPAREN).
   * For example, “menu:minimize,maximize,close” specifies a menu
   * on the left, and minimize, maximize and close buttons on the right.
   * Params:
   *   layout = a decoration layout, or %NULL to
   *     unset the layout
   */
  void setDecorationLayout(string layout)
  {
    const(char)* _layout = layout.toCString(No.Alloc);
    gtk_header_bar_set_decoration_layout(cast(GtkHeaderBar*)cPtr, _layout);
  }

  /**
   * Sets whether the header bar should reserve space
   * for a subtitle, even if none is currently set.
   * Params:
   *   setting = %TRUE to reserve space for a subtitle
   */
  void setHasSubtitle(bool setting)
  {
    gtk_header_bar_set_has_subtitle(cast(GtkHeaderBar*)cPtr, setting);
  }

  /**
   * Sets whether this header bar shows the standard window decorations,
   * including close, maximize, and minimize.
   * Params:
   *   setting = %TRUE to show standard window decorations
   */
  void setShowCloseButton(bool setting)
  {
    gtk_header_bar_set_show_close_button(cast(GtkHeaderBar*)cPtr, setting);
  }

  /**
   * Sets the subtitle of the #GtkHeaderBar. The title should give a user
   * an additional detail to help him identify the current view.
   * Note that GtkHeaderBar by default reserves room for the subtitle,
   * even if none is currently set. If this is not desired, set the
   * #GtkHeaderBar:has-subtitle property to %FALSE.
   * Params:
   *   subtitle = a subtitle, or %NULL
   */
  void setSubtitle(string subtitle)
  {
    const(char)* _subtitle = subtitle.toCString(No.Alloc);
    gtk_header_bar_set_subtitle(cast(GtkHeaderBar*)cPtr, _subtitle);
  }

  /**
   * Sets the title of the #GtkHeaderBar. The title should help a user
   * identify the current view. A good title should not include the
   * application name.
   * Params:
   *   title = a title, or %NULL
   */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_header_bar_set_title(cast(GtkHeaderBar*)cPtr, _title);
  }
}
