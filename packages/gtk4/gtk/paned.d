module gtk.paned;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.accessible_range;
import gtk.accessible_range_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/**
 * A widget with two panes, arranged either horizontally or vertically.
 * ![An example GtkPaned](panes.png)
 * The division between the two panes is adjustable by the user
 * by dragging a handle.
 * Child widgets are added to the panes of the widget with
 * [gtk.paned.Paned.setStartChild] and [gtk.paned.Paned.setEndChild].
 * The division between the two children is set by default from the size
 * requests of the children, but it can be adjusted by the user.
 * A paned widget draws a separator between the two child widgets and a
 * small handle that the user can drag to adjust the division. It does not
 * draw any relief around the children or around the separator. $(LPAREN)The space
 * in which the separator is called the gutter.$(RPAREN) Often, it is useful to put
 * each child inside a [gtk.frame.Frame] so that the gutter appears as a
 * ridge. No separator is drawn if one of the children is missing.
 * Each child has two options that can be set, "resize" and "shrink". If
 * "resize" is true then, when the `GtkPaned` is resized, that child will
 * expand or shrink along with the paned widget. If "shrink" is true, then
 * that child can be made smaller than its requisition by the user.
 * Setting "shrink" to false allows the application to set a minimum size.
 * If "resize" is false for both children, then this is treated as if
 * "resize" is true for both children.
 * The application can set the position of the slider as if it were set
 * by the user, by calling [gtk.paned.Paned.setPosition].
 * # CSS nodes
 * ```
 * paned
 * ├── <child>
 * ├── separator[.wide]
 * ╰── <child>
 * ```
 * `GtkPaned` has a main CSS node with name paned, and a subnode for
 * the separator with name separator. The subnode gets a .wide style
 * class when the paned is supposed to be wide.
 * In horizontal orientation, the nodes are arranged based on the text
 * direction, so in left-to-right mode, :first-child will select the
 * leftmost child, while it will select the rightmost child in
 * RTL layouts.
 * ## Creating a paned widget with minimum sizes.
 * ```c
 * GtkWidget *hpaned \= gtk_paned_new $(LPAREN)GTK_ORIENTATION_HORIZONTAL$(RPAREN);
 * GtkWidget *frame1 \= gtk_frame_new $(LPAREN)NULL$(RPAREN);
 * GtkWidget *frame2 \= gtk_frame_new $(LPAREN)NULL$(RPAREN);
 * gtk_widget_set_size_request $(LPAREN)hpaned, 200, -1$(RPAREN);
 * gtk_paned_set_start_child $(LPAREN)GTK_PANED $(LPAREN)hpaned$(RPAREN), frame1$(RPAREN);
 * gtk_paned_set_resize_start_child $(LPAREN)GTK_PANED $(LPAREN)hpaned$(RPAREN), TRUE$(RPAREN);
 * gtk_paned_set_shrink_start_child $(LPAREN)GTK_PANED $(LPAREN)hpaned$(RPAREN), FALSE$(RPAREN);
 * gtk_widget_set_size_request $(LPAREN)frame1, 50, -1$(RPAREN);
 * gtk_paned_set_end_child $(LPAREN)GTK_PANED $(LPAREN)hpaned$(RPAREN), frame2$(RPAREN);
 * gtk_paned_set_resize_end_child $(LPAREN)GTK_PANED $(LPAREN)hpaned$(RPAREN), FALSE$(RPAREN);
 * gtk_paned_set_shrink_end_child $(LPAREN)GTK_PANED $(LPAREN)hpaned$(RPAREN), FALSE$(RPAREN);
 * gtk_widget_set_size_request $(LPAREN)frame2, 50, -1$(RPAREN);
 * ```
 */
class Paned : gtk.widget.Widget, gtk.accessible_range.AccessibleRange, gtk.orientable.Orientable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_paned_get_type != &gidSymbolNotFound ? gtk_paned_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin AccessibleRangeT!();
  mixin OrientableT!();

  /**
   * Creates a new `GtkPaned` widget.
   * Params:
   *   orientation = the paned’s orientation.
   * Returns: the newly created paned widget
   */
  this(gtk.types.Orientation orientation)
  {
    GtkWidget* _cretval;
    _cretval = gtk_paned_new(orientation);
    this(_cretval, No.Take);
  }

  /**
   * Retrieves the end child of the given `GtkPaned`.
   * Returns: the end child widget
   */
  gtk.widget.Widget getEndChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_paned_get_end_child(cast(GtkPaned*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Obtains the position of the divider between the two panes.
   * Returns: the position of the divider, in pixels
   */
  int getPosition()
  {
    int _retval;
    _retval = gtk_paned_get_position(cast(GtkPaned*)cPtr);
    return _retval;
  }

  /**
   * Returns whether the propertyGtk.Paned:end-child can be resized.
   * Returns: true if the end child is resizable
   */
  bool getResizeEndChild()
  {
    bool _retval;
    _retval = gtk_paned_get_resize_end_child(cast(GtkPaned*)cPtr);
    return _retval;
  }

  /**
   * Returns whether the propertyGtk.Paned:start-child can be resized.
   * Returns: true if the start child is resizable
   */
  bool getResizeStartChild()
  {
    bool _retval;
    _retval = gtk_paned_get_resize_start_child(cast(GtkPaned*)cPtr);
    return _retval;
  }

  /**
   * Returns whether the propertyGtk.Paned:end-child can shrink.
   * Returns: true if the end child is shrinkable
   */
  bool getShrinkEndChild()
  {
    bool _retval;
    _retval = gtk_paned_get_shrink_end_child(cast(GtkPaned*)cPtr);
    return _retval;
  }

  /**
   * Returns whether the propertyGtk.Paned:start-child can shrink.
   * Returns: true if the start child is shrinkable
   */
  bool getShrinkStartChild()
  {
    bool _retval;
    _retval = gtk_paned_get_shrink_start_child(cast(GtkPaned*)cPtr);
    return _retval;
  }

  /**
   * Retrieves the start child of the given `GtkPaned`.
   * Returns: the start child widget
   */
  gtk.widget.Widget getStartChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_paned_get_start_child(cast(GtkPaned*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets whether the separator should be wide.
   * Returns: %TRUE if the paned should have a wide handle
   */
  bool getWideHandle()
  {
    bool _retval;
    _retval = gtk_paned_get_wide_handle(cast(GtkPaned*)cPtr);
    return _retval;
  }

  /**
   * Sets the end child of paned to child.
   * If child is `NULL`, the existing child will be removed.
   * Params:
   *   child = the widget to add
   */
  void setEndChild(gtk.widget.Widget child = null)
  {
    gtk_paned_set_end_child(cast(GtkPaned*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
   * Sets the position of the divider between the two panes.
   * Params:
   *   position = pixel position of divider, a negative value means that the position
   *     is unset
   */
  void setPosition(int position)
  {
    gtk_paned_set_position(cast(GtkPaned*)cPtr, position);
  }

  /**
   * Sets whether the propertyGtk.Paned:end-child can be resized.
   * Params:
   *   resize = true to let the end child be resized
   */
  void setResizeEndChild(bool resize)
  {
    gtk_paned_set_resize_end_child(cast(GtkPaned*)cPtr, resize);
  }

  /**
   * Sets whether the propertyGtk.Paned:start-child can be resized.
   * Params:
   *   resize = true to let the start child be resized
   */
  void setResizeStartChild(bool resize)
  {
    gtk_paned_set_resize_start_child(cast(GtkPaned*)cPtr, resize);
  }

  /**
   * Sets whether the propertyGtk.Paned:end-child can shrink.
   * Params:
   *   resize = true to let the end child be shrunk
   */
  void setShrinkEndChild(bool resize)
  {
    gtk_paned_set_shrink_end_child(cast(GtkPaned*)cPtr, resize);
  }

  /**
   * Sets whether the propertyGtk.Paned:start-child can shrink.
   * Params:
   *   resize = true to let the start child be shrunk
   */
  void setShrinkStartChild(bool resize)
  {
    gtk_paned_set_shrink_start_child(cast(GtkPaned*)cPtr, resize);
  }

  /**
   * Sets the start child of paned to child.
   * If child is `NULL`, the existing child will be removed.
   * Params:
   *   child = the widget to add
   */
  void setStartChild(gtk.widget.Widget child = null)
  {
    gtk_paned_set_start_child(cast(GtkPaned*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
   * Sets whether the separator should be wide.
   * Params:
   *   wide = the new value for the propertyGtk.Paned:wide-handle property
   */
  void setWideHandle(bool wide)
  {
    gtk_paned_set_wide_handle(cast(GtkPaned*)cPtr, wide);
  }

  /**
   * Emitted to accept the current position of the handle when
   * moving it using key bindings.
   * This is a [keybinding signal](class.SignalAction.html).
   * The default binding for this signal is <kbd>Return</kbd> or
   * <kbd>Space</kbd>.
   *   paned = the instance the signal is connected to
   * Returns:
   */
  alias AcceptPositionCallbackDlg = bool delegate(gtk.paned.Paned paned);
  alias AcceptPositionCallbackFunc = bool function(gtk.paned.Paned paned);

  /**
   * Connect to AcceptPosition signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectAcceptPosition(T)(T callback, Flag!"After" after = No.After)
  if (is(T : AcceptPositionCallbackDlg) || is(T : AcceptPositionCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto paned = getVal!(gtk.paned.Paned)(_paramVals);
      _retval = _dClosure.dlg(paned);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("accept-position", closure, after);
  }

  /**
   * Emitted to cancel moving the position of the handle using key
   * bindings.
   * The position of the handle will be reset to the value prior to
   * moving it.
   * This is a [keybinding signal](class.SignalAction.html).
   * The default binding for this signal is <kbd>Escape</kbd>.
   *   paned = the instance the signal is connected to
   * Returns:
   */
  alias CancelPositionCallbackDlg = bool delegate(gtk.paned.Paned paned);
  alias CancelPositionCallbackFunc = bool function(gtk.paned.Paned paned);

  /**
   * Connect to CancelPosition signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectCancelPosition(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CancelPositionCallbackDlg) || is(T : CancelPositionCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto paned = getVal!(gtk.paned.Paned)(_paramVals);
      _retval = _dClosure.dlg(paned);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cancel-position", closure, after);
  }

  /**
   * Emitted to cycle the focus between the children of the paned.
   * This is a [keybinding signal](class.SignalAction.html).
   * The default binding is <kbd>F6</kbd>.
   * Params
   *   reversed = whether cycling backward or forward
   *   paned = the instance the signal is connected to
   * Returns:
   */
  alias CycleChildFocusCallbackDlg = bool delegate(bool reversed, gtk.paned.Paned paned);
  alias CycleChildFocusCallbackFunc = bool function(bool reversed, gtk.paned.Paned paned);

  /**
   * Connect to CycleChildFocus signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectCycleChildFocus(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CycleChildFocusCallbackDlg) || is(T : CycleChildFocusCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto paned = getVal!(gtk.paned.Paned)(_paramVals);
      auto reversed = getVal!(bool)(&_paramVals[1]);
      _retval = _dClosure.dlg(reversed, paned);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cycle-child-focus", closure, after);
  }

  /**
   * Emitted to cycle whether the paned should grab focus to allow
   * the user to change position of the handle by using key bindings.
   * This is a [keybinding signal](class.SignalAction.html).
   * The default binding for this signal is <kbd>F8</kbd>.
   * Params
   *   reversed = whether cycling backward or forward
   *   paned = the instance the signal is connected to
   * Returns:
   */
  alias CycleHandleFocusCallbackDlg = bool delegate(bool reversed, gtk.paned.Paned paned);
  alias CycleHandleFocusCallbackFunc = bool function(bool reversed, gtk.paned.Paned paned);

  /**
   * Connect to CycleHandleFocus signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectCycleHandleFocus(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CycleHandleFocusCallbackDlg) || is(T : CycleHandleFocusCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto paned = getVal!(gtk.paned.Paned)(_paramVals);
      auto reversed = getVal!(bool)(&_paramVals[1]);
      _retval = _dClosure.dlg(reversed, paned);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cycle-handle-focus", closure, after);
  }

  /**
   * Emitted to move the handle with key bindings.
   * This is a [keybinding signal](class.SignalAction.html).
   * Params
   *   scrollType = a `GtkScrollType`
   *   paned = the instance the signal is connected to
   * Returns:
   */
  alias MoveHandleCallbackDlg = bool delegate(gtk.types.ScrollType scrollType, gtk.paned.Paned paned);
  alias MoveHandleCallbackFunc = bool function(gtk.types.ScrollType scrollType, gtk.paned.Paned paned);

  /**
   * Connect to MoveHandle signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectMoveHandle(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MoveHandleCallbackDlg) || is(T : MoveHandleCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto paned = getVal!(gtk.paned.Paned)(_paramVals);
      auto scrollType = getVal!(gtk.types.ScrollType)(&_paramVals[1]);
      _retval = _dClosure.dlg(scrollType, paned);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-handle", closure, after);
  }

  /**
   * Emitted to accept the current position of the handle and then
   * move focus to the next widget in the focus chain.
   * This is a [keybinding signal](class.SignalAction.html).
   * The default binding is <kbd>Tab</kbd>.
   *   paned = the instance the signal is connected to
   * Returns:
   */
  alias ToggleHandleFocusCallbackDlg = bool delegate(gtk.paned.Paned paned);
  alias ToggleHandleFocusCallbackFunc = bool function(gtk.paned.Paned paned);

  /**
   * Connect to ToggleHandleFocus signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectToggleHandleFocus(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ToggleHandleFocusCallbackDlg) || is(T : ToggleHandleFocusCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto paned = getVal!(gtk.paned.Paned)(_paramVals);
      _retval = _dClosure.dlg(paned);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-handle-focus", closure, after);
  }
}
