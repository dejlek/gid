module gtk.menu_button;

import gid.gid;
import gio.menu_model;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.popover;
import gtk.types;
import gtk.widget;

/**
    The [gtk.menu_button.MenuButton] widget is used to display a popup when clicked.
  
  ![An example GtkMenuButton](menu-button.png)
  
  This popup can be provided either as a [gtk.popover.Popover] or as an abstract
  [gio.menu_model.MenuModel].
  
  The [gtk.menu_button.MenuButton] widget can show either an icon (set with the
  `property@Gtk.MenuButton:icon-name` property) or a label (set with the
  [gtk.menu_button.MenuButton.utf8] property). If neither is explicitly set,
  a [gtk.image.Image] is automatically created, using an arrow image oriented
  according to [gtk.menu_button.MenuButton.ArrowType] or the generic
  “open-menu-symbolic” icon if the direction is not set.
  
  The positioning of the popup is determined by the
  [gtk.menu_button.MenuButton.ArrowType] property of the menu button.
  
  For menus, the [gtk.widget.Widget.Align] and [gtk.widget.Widget.Align]
  properties of the menu are also taken into account. For example, when the
  direction is [gtk.types.ArrowType.Down] and the horizontal alignment is [gtk.types.Align.Start],
  the menu will be positioned below the button, with the starting edge
  (depending on the text direction) of the menu aligned with the starting
  edge of the button. If there is not enough space below the button, the
  menu is popped up above the button instead. If the alignment would move
  part of the menu offscreen, it is “pushed in”.
  
  |           | start                | center                | end                |
  | -         | ---                  | ---                   | ---                |
  | **down**  | ![](down-start.png)  | ![](down-center.png)  | ![](down-end.png)  |
  | **up**    | ![](up-start.png)    | ![](up-center.png)    | ![](up-end.png)    |
  | **left**  | ![](left-start.png)  | ![](left-center.png)  | ![](left-end.png)  |
  | **right** | ![](right-start.png) | ![](right-center.png) | ![](right-end.png) |
  
  # CSS nodes
  
  ```
  menubutton
  ╰── button.toggle
      ╰── <content>
           ╰── [arrow]
  ```
  
  [gtk.menu_button.MenuButton] has a single CSS node with name `menubutton`
  which contains a `button` node with a `.toggle` style class.
  
  If the button contains an icon, it will have the `.image-button` style class,
  if it contains text, it will have `.text-button` style class. If an arrow is
  visible in addition to an icon, text or a custom child, it will also have
  `.arrow-button` style class.
  
  Inside the toggle button content, there is an `arrow` node for
  the indicator, which will carry one of the `.none`, `.up`, `.down`,
  `.left` or `.right` style classes to indicate the direction that
  the menu will appear in. The CSS is expected to provide a suitable
  image for each of these cases using the `-gtk-icon-source` property.
  
  Optionally, the `menubutton` node can carry the `.circular` style class
  to request a round appearance.
  
  # Accessibility
  
  [gtk.menu_button.MenuButton] uses the [gtk.types.AccessibleRole.Button] role.
*/
class MenuButton : gtk.widget.Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_menu_button_get_type != &gidSymbolNotFound ? gtk_menu_button_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override MenuButton self()
  {
    return this;
  }

  /**
      Creates a new [gtk.menu_button.MenuButton] widget with downwards-pointing
    arrow as the only child.
    
    You can replace the child widget with another [gtk.widget.Widget]
    should you wish to.
    Returns:     The newly created [gtk.menu_button.MenuButton]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_button_new();
    this(_cretval, No.Take);
  }

  /**
      Returns whether the menu button is active.
    Returns:     TRUE if the button is active
  */
  bool getActive()
  {
    bool _retval;
    _retval = gtk_menu_button_get_active(cast(GtkMenuButton*)cPtr);
    return _retval;
  }

  /**
      Gets whether to show a dropdown arrow even when using an icon or a custom
    child.
    Returns:     whether to show a dropdown arrow even when using an icon or a custom
      child.
  */
  bool getAlwaysShowArrow()
  {
    bool _retval;
    _retval = gtk_menu_button_get_always_show_arrow(cast(GtkMenuButton*)cPtr);
    return _retval;
  }

  /**
      Retrieves whether the button can be smaller than the natural
    size of its contents.
    Returns:     true if the button can shrink, and false otherwise
  */
  bool getCanShrink()
  {
    bool _retval;
    _retval = gtk_menu_button_get_can_shrink(cast(GtkMenuButton*)cPtr);
    return _retval;
  }

  /**
      Gets the child widget of menu_button.
    Returns:     the child widget of menu_button
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_button_get_child(cast(GtkMenuButton*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  alias getDirection = gtk.widget.Widget.getDirection;

  /**
      Returns the direction the popup will be pointing at when popped up.
    Returns:     a [gtk.types.ArrowType] value
  */
  gtk.types.ArrowType getDirection()
  {
    GtkArrowType _cretval;
    _cretval = gtk_menu_button_get_direction(cast(GtkMenuButton*)cPtr);
    gtk.types.ArrowType _retval = cast(gtk.types.ArrowType)_cretval;
    return _retval;
  }

  /**
      Returns whether the button has a frame.
    Returns:     true if the button has a frame
  */
  bool getHasFrame()
  {
    bool _retval;
    _retval = gtk_menu_button_get_has_frame(cast(GtkMenuButton*)cPtr);
    return _retval;
  }

  /**
      Gets the name of the icon shown in the button.
    Returns:     the name of the icon shown in the button
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_menu_button_get_icon_name(cast(GtkMenuButton*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the label shown in the button
    Returns:     the label shown in the button
  */
  string getLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_menu_button_get_label(cast(GtkMenuButton*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the [gio.menu_model.MenuModel] used to generate the popup.
    Returns:     a [gio.menu_model.MenuModel]
  */
  gio.menu_model.MenuModel getMenuModel()
  {
    GMenuModel* _cretval;
    _cretval = gtk_menu_button_get_menu_model(cast(GtkMenuButton*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the [gtk.popover.Popover] that pops out of the button.
    
    If the button is not using a [gtk.popover.Popover], this function
    returns null.
    Returns:     a [gtk.popover.Popover] or null
  */
  gtk.popover.Popover getPopover()
  {
    GtkPopover* _cretval;
    _cretval = gtk_menu_button_get_popover(cast(GtkMenuButton*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.popover.Popover)(cast(GtkPopover*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the menu button acts as a primary menu.
    Returns:     true if the button is a primary menu
  */
  bool getPrimary()
  {
    bool _retval;
    _retval = gtk_menu_button_get_primary(cast(GtkMenuButton*)cPtr);
    return _retval;
  }

  /**
      Returns whether an embedded underline in the text indicates a
    mnemonic.
    Returns:     true whether an embedded underline in the text indicates
        the mnemonic accelerator keys.
  */
  bool getUseUnderline()
  {
    bool _retval;
    _retval = gtk_menu_button_get_use_underline(cast(GtkMenuButton*)cPtr);
    return _retval;
  }

  /**
      Dismiss the menu.
  */
  void popdown()
  {
    gtk_menu_button_popdown(cast(GtkMenuButton*)cPtr);
  }

  /**
      Pop up the menu.
  */
  void popup()
  {
    gtk_menu_button_popup(cast(GtkMenuButton*)cPtr);
  }

  /**
      Sets whether the menu button is active.
    Params:
      active =       whether the menu button is active
  */
  void setActive(bool active)
  {
    gtk_menu_button_set_active(cast(GtkMenuButton*)cPtr, active);
  }

  /**
      Sets whether to show a dropdown arrow even when using an icon or a custom
    child.
    Params:
      alwaysShowArrow =       whether to show a dropdown arrow even when using an icon
        or a custom child
  */
  void setAlwaysShowArrow(bool alwaysShowArrow)
  {
    gtk_menu_button_set_always_show_arrow(cast(GtkMenuButton*)cPtr, alwaysShowArrow);
  }

  /**
      Sets whether the button size can be smaller than the natural size of
    its contents.
    
    For text buttons, setting can_shrink to true will ellipsize the label.
    
    For icon buttons, this function has no effect.
    Params:
      canShrink =       whether the button can shrink
  */
  void setCanShrink(bool canShrink)
  {
    gtk_menu_button_set_can_shrink(cast(GtkMenuButton*)cPtr, canShrink);
  }

  /**
      Sets the child widget of menu_button.
    
    Setting a child resets [gtk.menu_button.MenuButton.utf8] and
    `propertyGtk.MenuButton:icon-name`.
    
    If `propertyGtk.MenuButton:always-show-arrow` is set to `TRUE` and
    [gtk.menu_button.MenuButton.ArrowType] is not [gtk.types.ArrowType.None], a dropdown arrow
    will be shown next to the child.
    Params:
      child =       the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    gtk_menu_button_set_child(cast(GtkMenuButton*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
      Sets func to be called when a popup is about to be shown.
    
    func should use one of
    
     $(LIST
        * [gtk.menu_button.MenuButton.setPopover]
        * [gtk.menu_button.MenuButton.setMenuModel]
     )
       
    to set a popup for menu_button.
    If func is non-null, menu_button will always be sensitive.
    
    Using this function will not reset the menu widget attached to
    menu_button. Instead, this can be done manually in func.
    Params:
      func =       function to call when a popup is about to
          be shown, but none has been provided via other means, or null
          to reset to default behavior.
  */
  void setCreatePopupFunc(gtk.types.MenuButtonCreatePopupFunc func = null)
  {
    extern(C) void _funcCallback(GtkMenuButton* menuButton, void* userData)
    {
      auto _dlg = cast(gtk.types.MenuButtonCreatePopupFunc*)userData;

      (*_dlg)(ObjectG.getDObject!(gtk.menu_button.MenuButton)(cast(void*)menuButton, No.Take));
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_menu_button_set_create_popup_func(cast(GtkMenuButton*)cPtr, _funcCB, _func, _funcDestroyCB);
  }

  alias setDirection = gtk.widget.Widget.setDirection;

  /**
      Sets the direction in which the popup will be popped up.
    
    If the button is automatically populated with an arrow icon,
    its direction will be changed to match.
    
    If the does not fit in the available space in the given direction,
    GTK will its best to keep it inside the screen and fully visible.
    
    If you pass [gtk.types.ArrowType.None] for a direction, the popup will behave
    as if you passed [gtk.types.ArrowType.Down] (although you won’t see any arrows).
    Params:
      direction =       a [gtk.types.ArrowType]
  */
  void setDirection(gtk.types.ArrowType direction)
  {
    gtk_menu_button_set_direction(cast(GtkMenuButton*)cPtr, direction);
  }

  /**
      Sets the style of the button.
    Params:
      hasFrame =       whether the button should have a visible frame
  */
  void setHasFrame(bool hasFrame)
  {
    gtk_menu_button_set_has_frame(cast(GtkMenuButton*)cPtr, hasFrame);
  }

  /**
      Sets the name of an icon to show inside the menu button.
    
    Setting icon name resets [gtk.menu_button.MenuButton.utf8] and
    [gtk.menu_button.MenuButton.Widget].
    
    If `propertyGtk.MenuButton:always-show-arrow` is set to `TRUE` and
    [gtk.menu_button.MenuButton.ArrowType] is not [gtk.types.ArrowType.None], a dropdown arrow
    will be shown next to the icon.
    Params:
      iconName =       the icon name
  */
  void setIconName(string iconName)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_menu_button_set_icon_name(cast(GtkMenuButton*)cPtr, _iconName);
  }

  /**
      Sets the label to show inside the menu button.
    
    Setting a label resets `propertyGtk.MenuButton:icon-name` and
    [gtk.menu_button.MenuButton.Widget].
    
    If [gtk.menu_button.MenuButton.ArrowType] is not [gtk.types.ArrowType.None], a dropdown
    arrow will be shown next to the label.
    Params:
      label =       the label
  */
  void setLabel(string label)
  {
    const(char)* _label = label.toCString(No.Alloc);
    gtk_menu_button_set_label(cast(GtkMenuButton*)cPtr, _label);
  }

  /**
      Sets the [gio.menu_model.MenuModel] from which the popup will be constructed.
    
    If menu_model is null, the button is disabled.
    
    A [gtk.popover.Popover] will be created from the menu model with
    [gtk.popover_menu.PopoverMenu.newFromModel]. Actions will be connected
    as documented for this function.
    
    If [gtk.menu_button.MenuButton.Popover] is already set, it will be
    dissociated from the menu_button, and the property is set to null.
    Params:
      menuModel =       a [gio.menu_model.MenuModel], or null to unset and disable the
          button
  */
  void setMenuModel(gio.menu_model.MenuModel menuModel = null)
  {
    gtk_menu_button_set_menu_model(cast(GtkMenuButton*)cPtr, menuModel ? cast(GMenuModel*)menuModel.cPtr(No.Dup) : null);
  }

  /**
      Sets the [gtk.popover.Popover] that will be popped up when the menu_button is clicked.
    
    If popover is null, the button is disabled.
    
    If `propertyGtk.MenuButton:menu-model` is set, the menu model is dissociated
    from the menu_button, and the property is set to null.
    Params:
      popover =       a [gtk.popover.Popover], or null to unset and disable the button
  */
  void setPopover(gtk.widget.Widget popover = null)
  {
    gtk_menu_button_set_popover(cast(GtkMenuButton*)cPtr, popover ? cast(GtkWidget*)popover.cPtr(No.Dup) : null);
  }

  /**
      Sets whether menu button acts as a primary menu.
    
    Primary menus can be opened with the <kbd>F10</kbd> key.
    Params:
      primary =       whether the menubutton should act as a primary menu
  */
  void setPrimary(bool primary)
  {
    gtk_menu_button_set_primary(cast(GtkMenuButton*)cPtr, primary);
  }

  /**
      If true, an underline in the text indicates a mnemonic.
    Params:
      useUnderline =       true if underlines in the text indicate mnemonics
  */
  void setUseUnderline(bool useUnderline)
  {
    gtk_menu_button_set_use_underline(cast(GtkMenuButton*)cPtr, useUnderline);
  }

  /**
      Emitted to when the menu button is activated.
    
    The `::activate` signal on [gtk.menu_button.MenuButton] is an action signal and
    emitting it causes the button to pop up its menu.
  
    ## Parameters
    $(LIST
      * $(B menuButton) the instance the signal is connected to
    )
  */
  alias ActivateCallbackDlg = void delegate(gtk.menu_button.MenuButton menuButton);

  /** ditto */
  alias ActivateCallbackFunc = void function(gtk.menu_button.MenuButton menuButton);

  /**
    Connect to Activate signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateCallbackDlg) || is(T : ActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto menuButton = getVal!(gtk.menu_button.MenuButton)(_paramVals);
      _dClosure.dlg(menuButton);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }
}
