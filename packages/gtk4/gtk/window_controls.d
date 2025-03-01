module gtk.window_controls;

import gid.global;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
 * `GtkWindowControls` shows window frame controls.
 * Typical window frame controls are minimize, maximize and close buttons,
 * and the window icon.
 * ![An example GtkWindowControls](windowcontrols.png)
 * `GtkWindowControls` only displays start or end side of the controls $(LPAREN)see
 * [gtk.window_controls.WindowControls.PackType]$(RPAREN), so it's intended to be always used
 * in pair with another `GtkWindowControls` for the opposite side, for example:
 * ```xml
 * <object class\="GtkBox">
 * <child>
 * <object class\="GtkWindowControls">
 * <property name\="side">start</property>
 * </object>
 * </child>
 * ...
 * <child>
 * <object class\="GtkWindowControls">
 * <property name\="side">end</property>
 * </object>
 * </child>
 * </object>
 * ```
 * # CSS nodes
 * ```
 * windowcontrols
 * ├── [image.icon]
 * ├── [button.minimize]
 * ├── [button.maximize]
 * ╰── [button.close]
 * ```
 * A `GtkWindowControls`' CSS node is called windowcontrols. It contains
 * subnodes corresponding to each title button. Which of the title buttons
 * exist and where they are placed exactly depends on the desktop environment
 * and property@Gtk.WindowControls:decoration-layout value.
 * When [gtk.window_controls.WindowControls.gboolean] is %TRUE, it gets the .empty
 * style class.
 * # Accessibility
 * `GtkWindowControls` uses the %GTK_ACCESSIBLE_ROLE_GROUP role.
 */
class WindowControls : Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_window_controls_get_type != &gidSymbolNotFound ? gtk_window_controls_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkWindowControls`.
   * Params:
   *   side = the side
   * Returns: a new `GtkWindowControls`.
   */
  this(PackType side)
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_controls_new(side);
    this(_cretval, No.Take);
  }

  /**
   * Gets the decoration layout of this `GtkWindowControls`.
   * Returns: the decoration layout or %NULL if it is unset
   */
  string getDecorationLayout()
  {
    const(char)* _cretval;
    _cretval = gtk_window_controls_get_decoration_layout(cast(GtkWindowControls*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets whether the widget has any window buttons.
   * Returns: %TRUE if the widget has window buttons, otherwise %FALSE
   */
  bool getEmpty()
  {
    bool _retval;
    _retval = gtk_window_controls_get_empty(cast(GtkWindowControls*)cPtr);
    return _retval;
  }

  /**
   * Gets the side to which this `GtkWindowControls` instance belongs.
   * Returns: the side
   */
  PackType getSide()
  {
    GtkPackType _cretval;
    _cretval = gtk_window_controls_get_side(cast(GtkWindowControls*)cPtr);
    PackType _retval = cast(PackType)_cretval;
    return _retval;
  }

  /**
   * Sets the decoration layout for the title buttons.
   * This overrides the propertyGtk.Settings:gtk-decoration-layout
   * setting.
   * The format of the string is button names, separated by commas.
   * A colon separates the buttons that should appear on the left
   * from those on the right. Recognized button names are minimize,
   * maximize, close and icon $(LPAREN)the window icon$(RPAREN).
   * For example, “icon:minimize,maximize,close” specifies a icon
   * on the left, and minimize, maximize and close buttons on the right.
   * If [gtk.window_controls.WindowControls.PackType] value is GTK_PACK_START, self
   * will display the part before the colon, otherwise after that.
   * Params:
   *   layout = a decoration layout, or %NULL to unset the layout
   */
  void setDecorationLayout(string layout)
  {
    const(char)* _layout = layout.toCString(No.Alloc);
    gtk_window_controls_set_decoration_layout(cast(GtkWindowControls*)cPtr, _layout);
  }

  /**
   * Determines which part of decoration layout the `GtkWindowControls` uses.
   * See propertyGtk.WindowControls:decoration-layout.
   * Params:
   *   side = a side
   */
  void setSide(PackType side)
  {
    gtk_window_controls_set_side(cast(GtkWindowControls*)cPtr, side);
  }
}
