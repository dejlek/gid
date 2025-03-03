module gtk.scrolled_window;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.adjustment;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
 * GtkScrolledWindow is a container that accepts a single child widget and makes
 * that child scrollable using either internally added scrollbars or externally
 * associated adjustments.
 * Widgets with native scrolling support, i.e. those whose classes implement the
 * #GtkScrollable interface, are added directly. For other types of widget, the
 * class #GtkViewport acts as an adaptor, giving scrollability to other widgets.
 * GtkScrolledWindow’s implementation of [gtk.container.Container.add] intelligently
 * accounts for whether or not the added child is a #GtkScrollable. If it isn’t,
 * #GtkScrolledWindow wraps the child in a #GtkViewport and adds that for you.
 * Therefore, you can just add any child widget and not worry about the details.
 * If [gtk.container.Container.add] has added a #GtkViewport for you, you can remove
 * both your added child widget from the #GtkViewport, and the #GtkViewport
 * from the GtkScrolledWindow, like this:
 * |[<!-- language\="C" -->
 * GtkWidget *scrolled_window \= gtk_scrolled_window_new $(LPAREN)NULL, NULL$(RPAREN);
 * GtkWidget *child_widget \= gtk_button_new $(LPAREN)$(RPAREN);
 * // GtkButton is not a GtkScrollable, so GtkScrolledWindow will automatically
 * // add a GtkViewport.
 * gtk_container_add $(LPAREN)GTK_CONTAINER $(LPAREN)scrolled_window$(RPAREN),
 * child_widget$(RPAREN);
 * // Either of these will result in child_widget being unparented:
 * gtk_container_remove $(LPAREN)GTK_CONTAINER $(LPAREN)scrolled_window$(RPAREN),
 * child_widget$(RPAREN);
 * // or
 * gtk_container_remove $(LPAREN)GTK_CONTAINER $(LPAREN)scrolled_window$(RPAREN),
 * gtk_bin_get_child $(LPAREN)GTK_BIN $(LPAREN)scrolled_window$(RPAREN)$(RPAREN)$(RPAREN);
 * ]|
 * Unless #GtkScrolledWindow:policy is GTK_POLICY_NEVER or GTK_POLICY_EXTERNAL,
 * GtkScrolledWindow adds internal #GtkScrollbar widgets around its child. The
 * scroll position of the child, and if applicable the scrollbars, is controlled
 * by the #GtkScrolledWindow:hadjustment and #GtkScrolledWindow:vadjustment
 * that are associated with the GtkScrolledWindow. See the docs on #GtkScrollbar
 * for the details, but note that the “step_increment” and “page_increment”
 * fields are only effective if the policy causes scrollbars to be present.
 * If a GtkScrolledWindow doesn’t behave quite as you would like, or
 * doesn’t have exactly the right layout, it’s very possible to set up
 * your own scrolling with #GtkScrollbar and for example a #GtkGrid.
 * # Touch support
 * GtkScrolledWindow has built-in support for touch devices. When a
 * touchscreen is used, swiping will move the scrolled window, and will
 * expose 'kinetic' behavior. This can be turned off with the
 * #GtkScrolledWindow:kinetic-scrolling property if it is undesired.
 * GtkScrolledWindow also displays visual 'overshoot' indication when
 * the content is pulled beyond the end, and this situation can be
 * captured with the #GtkScrolledWindow::edge-overshot signal.
 * If no mouse device is present, the scrollbars will overlayed as
 * narrow, auto-hiding indicators over the content. If traditional
 * scrollbars are desired although no mouse is present, this behaviour
 * can be turned off with the #GtkScrolledWindow:overlay-scrolling
 * property.
 * # CSS nodes
 * GtkScrolledWindow has a main CSS node with name scrolledwindow.
 * It uses subnodes with names overshoot and undershoot to
 * draw the overflow and underflow indications. These nodes get
 * the .left, .right, .top or .bottom style class added depending
 * on where the indication is drawn.
 * GtkScrolledWindow also sets the positional style classes $(LPAREN).left,
 * .right, .top, .bottom$(RPAREN) and style classes related to overlay
 * scrolling $(LPAREN).overlay-indicator, .dragging, .hovering$(RPAREN) on its scrollbars.
 * If both scrollbars are visible, the area where they meet is drawn
 * with a subnode named junction.
 */
class ScrolledWindow : gtk.bin.Bin
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_scrolled_window_get_type != &gidSymbolNotFound ? gtk_scrolled_window_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new scrolled window.
   * The two arguments are the scrolled window’s adjustments; these will be
   * shared with the scrollbars and the child widget to keep the bars in sync
   * with the child. Usually you want to pass %NULL for the adjustments, which
   * will cause the scrolled window to create them for you.
   * Params:
   *   hadjustment = horizontal adjustment
   *   vadjustment = vertical adjustment
   * Returns: a new scrolled window
   */
  this(gtk.adjustment.Adjustment hadjustment, gtk.adjustment.Adjustment vadjustment)
  {
    GtkWidget* _cretval;
    _cretval = gtk_scrolled_window_new(hadjustment ? cast(GtkAdjustment*)hadjustment.cPtr(No.Dup) : null, vadjustment ? cast(GtkAdjustment*)vadjustment.cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
   * Used to add children without native scrolling capabilities. This
   * is simply a convenience function; it is equivalent to adding the
   * unscrollable child to a viewport, then adding the viewport to the
   * scrolled window. If a child has native scrolling, use
   * [gtk.container.Container.add] instead of this function.
   * The viewport scrolls the child by moving its #GdkWindow, and takes
   * the size of the child to be the size of its toplevel #GdkWindow.
   * This will be very wrong for most widgets that support native scrolling;
   * for example, if you add a widget such as #GtkTreeView with a viewport,
   * the whole widget will scroll, including the column headings. Thus,
   * widgets with native scrolling support should not be used with the
   * #GtkViewport proxy.
   * A widget supports scrolling natively if it implements the
   * #GtkScrollable interface.
   * Params:
   *   child = the widget you want to scroll

   * Deprecated: [gtk.container.Container.add] will automatically add
   *   a #GtkViewport if the child doesn’t implement #GtkScrollable.
   */
  void addWithViewport(gtk.widget.Widget child)
  {
    gtk_scrolled_window_add_with_viewport(cast(GtkScrolledWindow*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
   * Return whether button presses are captured during kinetic
   * scrolling. See [gtk.scrolled_window.ScrolledWindow.setCaptureButtonPress].
   * Returns: %TRUE if button presses are captured during kinetic scrolling
   */
  bool getCaptureButtonPress()
  {
    bool _retval;
    _retval = gtk_scrolled_window_get_capture_button_press(cast(GtkScrolledWindow*)cPtr);
    return _retval;
  }

  /**
   * Returns the horizontal scrollbar’s adjustment, used to connect the
   * horizontal scrollbar to the child widget’s horizontal scroll
   * functionality.
   * Returns: the horizontal #GtkAdjustment
   */
  gtk.adjustment.Adjustment getHadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_scrolled_window_get_hadjustment(cast(GtkScrolledWindow*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns the horizontal scrollbar of scrolled_window.
   * Returns: the horizontal scrollbar of the scrolled window.
   */
  gtk.widget.Widget getHscrollbar()
  {
    GtkWidget* _cretval;
    _cretval = gtk_scrolled_window_get_hscrollbar(cast(GtkScrolledWindow*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns the specified kinetic scrolling behavior.
   * Returns: the scrolling behavior flags.
   */
  bool getKineticScrolling()
  {
    bool _retval;
    _retval = gtk_scrolled_window_get_kinetic_scrolling(cast(GtkScrolledWindow*)cPtr);
    return _retval;
  }

  /**
   * Returns the maximum content height set.
   * Returns: the maximum content height, or -1
   */
  int getMaxContentHeight()
  {
    int _retval;
    _retval = gtk_scrolled_window_get_max_content_height(cast(GtkScrolledWindow*)cPtr);
    return _retval;
  }

  /**
   * Returns the maximum content width set.
   * Returns: the maximum content width, or -1
   */
  int getMaxContentWidth()
  {
    int _retval;
    _retval = gtk_scrolled_window_get_max_content_width(cast(GtkScrolledWindow*)cPtr);
    return _retval;
  }

  /**
   * Gets the minimal content height of scrolled_window, or -1 if not set.
   * Returns: the minimal content height
   */
  int getMinContentHeight()
  {
    int _retval;
    _retval = gtk_scrolled_window_get_min_content_height(cast(GtkScrolledWindow*)cPtr);
    return _retval;
  }

  /**
   * Gets the minimum content width of scrolled_window, or -1 if not set.
   * Returns: the minimum content width
   */
  int getMinContentWidth()
  {
    int _retval;
    _retval = gtk_scrolled_window_get_min_content_width(cast(GtkScrolledWindow*)cPtr);
    return _retval;
  }

  /**
   * Returns whether overlay scrolling is enabled for this scrolled window.
   * Returns: %TRUE if overlay scrolling is enabled
   */
  bool getOverlayScrolling()
  {
    bool _retval;
    _retval = gtk_scrolled_window_get_overlay_scrolling(cast(GtkScrolledWindow*)cPtr);
    return _retval;
  }

  /**
   * Gets the placement of the contents with respect to the scrollbars
   * for the scrolled window. See [gtk.scrolled_window.ScrolledWindow.setPlacement].
   * Returns: the current placement value.
   *   See also [gtk.scrolled_window.ScrolledWindow.setPlacement] and
   *   [gtk.scrolled_window.ScrolledWindow.unsetPlacement].
   */
  gtk.types.CornerType getPlacement()
  {
    GtkCornerType _cretval;
    _cretval = gtk_scrolled_window_get_placement(cast(GtkScrolledWindow*)cPtr);
    gtk.types.CornerType _retval = cast(gtk.types.CornerType)_cretval;
    return _retval;
  }

  /**
   * Retrieves the current policy values for the horizontal and vertical
   * scrollbars. See [gtk.scrolled_window.ScrolledWindow.setPolicy].
   * Params:
   *   hscrollbarPolicy = location to store the policy
   *     for the horizontal scrollbar, or %NULL
   *   vscrollbarPolicy = location to store the policy
   *     for the vertical scrollbar, or %NULL
   */
  void getPolicy(out gtk.types.PolicyType hscrollbarPolicy, out gtk.types.PolicyType vscrollbarPolicy)
  {
    gtk_scrolled_window_get_policy(cast(GtkScrolledWindow*)cPtr, &hscrollbarPolicy, &vscrollbarPolicy);
  }

  /**
   * Reports whether the natural height of the child will be calculated and propagated
   * through the scrolled window’s requested natural height.
   * Returns: whether natural height propagation is enabled.
   */
  bool getPropagateNaturalHeight()
  {
    bool _retval;
    _retval = gtk_scrolled_window_get_propagate_natural_height(cast(GtkScrolledWindow*)cPtr);
    return _retval;
  }

  /**
   * Reports whether the natural width of the child will be calculated and propagated
   * through the scrolled window’s requested natural width.
   * Returns: whether natural width propagation is enabled.
   */
  bool getPropagateNaturalWidth()
  {
    bool _retval;
    _retval = gtk_scrolled_window_get_propagate_natural_width(cast(GtkScrolledWindow*)cPtr);
    return _retval;
  }

  /**
   * Gets the shadow type of the scrolled window. See
   * [gtk.scrolled_window.ScrolledWindow.setShadowType].
   * Returns: the current shadow type
   */
  gtk.types.ShadowType getShadowType()
  {
    GtkShadowType _cretval;
    _cretval = gtk_scrolled_window_get_shadow_type(cast(GtkScrolledWindow*)cPtr);
    gtk.types.ShadowType _retval = cast(gtk.types.ShadowType)_cretval;
    return _retval;
  }

  /**
   * Returns the vertical scrollbar’s adjustment, used to connect the
   * vertical scrollbar to the child widget’s vertical scroll functionality.
   * Returns: the vertical #GtkAdjustment
   */
  gtk.adjustment.Adjustment getVadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_scrolled_window_get_vadjustment(cast(GtkScrolledWindow*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns the vertical scrollbar of scrolled_window.
   * Returns: the vertical scrollbar of the scrolled window.
   */
  gtk.widget.Widget getVscrollbar()
  {
    GtkWidget* _cretval;
    _cretval = gtk_scrolled_window_get_vscrollbar(cast(GtkScrolledWindow*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Changes the behaviour of scrolled_window with regard to the initial
   * event that possibly starts kinetic scrolling. When capture_button_press
   * is set to %TRUE, the event is captured by the scrolled window, and
   * then later replayed if it is meant to go to the child widget.
   * This should be enabled if any child widgets perform non-reversible
   * actions on #GtkWidget::button-press-event. If they don't, and handle
   * additionally handle #GtkWidget::grab-broken-event, it might be better
   * to set capture_button_press to %FALSE.
   * This setting only has an effect if kinetic scrolling is enabled.
   * Params:
   *   captureButtonPress = %TRUE to capture button presses
   */
  void setCaptureButtonPress(bool captureButtonPress)
  {
    gtk_scrolled_window_set_capture_button_press(cast(GtkScrolledWindow*)cPtr, captureButtonPress);
  }

  /**
   * Sets the #GtkAdjustment for the horizontal scrollbar.
   * Params:
   *   hadjustment = the #GtkAdjustment to use, or %NULL to create a new one
   */
  void setHadjustment(gtk.adjustment.Adjustment hadjustment)
  {
    gtk_scrolled_window_set_hadjustment(cast(GtkScrolledWindow*)cPtr, hadjustment ? cast(GtkAdjustment*)hadjustment.cPtr(No.Dup) : null);
  }

  /**
   * Turns kinetic scrolling on or off.
   * Kinetic scrolling only applies to devices with source
   * %GDK_SOURCE_TOUCHSCREEN.
   * Params:
   *   kineticScrolling = %TRUE to enable kinetic scrolling
   */
  void setKineticScrolling(bool kineticScrolling)
  {
    gtk_scrolled_window_set_kinetic_scrolling(cast(GtkScrolledWindow*)cPtr, kineticScrolling);
  }

  /**
   * Sets the maximum height that scrolled_window should keep visible. The
   * scrolled_window will grow up to this height before it starts scrolling
   * the content.
   * It is a programming error to set the maximum content height to a value
   * smaller than #GtkScrolledWindow:min-content-height.
   * Params:
   *   height = the maximum content height
   */
  void setMaxContentHeight(int height)
  {
    gtk_scrolled_window_set_max_content_height(cast(GtkScrolledWindow*)cPtr, height);
  }

  /**
   * Sets the maximum width that scrolled_window should keep visible. The
   * scrolled_window will grow up to this width before it starts scrolling
   * the content.
   * It is a programming error to set the maximum content width to a value
   * smaller than #GtkScrolledWindow:min-content-width.
   * Params:
   *   width = the maximum content width
   */
  void setMaxContentWidth(int width)
  {
    gtk_scrolled_window_set_max_content_width(cast(GtkScrolledWindow*)cPtr, width);
  }

  /**
   * Sets the minimum height that scrolled_window should keep visible.
   * Note that this can and $(LPAREN)usually will$(RPAREN) be smaller than the minimum
   * size of the content.
   * It is a programming error to set the minimum content height to a
   * value greater than #GtkScrolledWindow:max-content-height.
   * Params:
   *   height = the minimal content height
   */
  void setMinContentHeight(int height)
  {
    gtk_scrolled_window_set_min_content_height(cast(GtkScrolledWindow*)cPtr, height);
  }

  /**
   * Sets the minimum width that scrolled_window should keep visible.
   * Note that this can and $(LPAREN)usually will$(RPAREN) be smaller than the minimum
   * size of the content.
   * It is a programming error to set the minimum content width to a
   * value greater than #GtkScrolledWindow:max-content-width.
   * Params:
   *   width = the minimal content width
   */
  void setMinContentWidth(int width)
  {
    gtk_scrolled_window_set_min_content_width(cast(GtkScrolledWindow*)cPtr, width);
  }

  /**
   * Enables or disables overlay scrolling for this scrolled window.
   * Params:
   *   overlayScrolling = whether to enable overlay scrolling
   */
  void setOverlayScrolling(bool overlayScrolling)
  {
    gtk_scrolled_window_set_overlay_scrolling(cast(GtkScrolledWindow*)cPtr, overlayScrolling);
  }

  /**
   * Sets the placement of the contents with respect to the scrollbars
   * for the scrolled window.
   * The default is %GTK_CORNER_TOP_LEFT, meaning the child is
   * in the top left, with the scrollbars underneath and to the right.
   * Other values in #GtkCornerType are %GTK_CORNER_TOP_RIGHT,
   * %GTK_CORNER_BOTTOM_LEFT, and %GTK_CORNER_BOTTOM_RIGHT.
   * See also [gtk.scrolled_window.ScrolledWindow.getPlacement] and
   * [gtk.scrolled_window.ScrolledWindow.unsetPlacement].
   * Params:
   *   windowPlacement = position of the child window
   */
  void setPlacement(gtk.types.CornerType windowPlacement)
  {
    gtk_scrolled_window_set_placement(cast(GtkScrolledWindow*)cPtr, windowPlacement);
  }

  /**
   * Sets the scrollbar policy for the horizontal and vertical scrollbars.
   * The policy determines when the scrollbar should appear; it is a value
   * from the #GtkPolicyType enumeration. If %GTK_POLICY_ALWAYS, the
   * scrollbar is always present; if %GTK_POLICY_NEVER, the scrollbar is
   * never present; if %GTK_POLICY_AUTOMATIC, the scrollbar is present only
   * if needed $(LPAREN)that is, if the slider part of the bar would be smaller
   * than the trough — the display is larger than the page size$(RPAREN).
   * Params:
   *   hscrollbarPolicy = policy for horizontal bar
   *   vscrollbarPolicy = policy for vertical bar
   */
  void setPolicy(gtk.types.PolicyType hscrollbarPolicy, gtk.types.PolicyType vscrollbarPolicy)
  {
    gtk_scrolled_window_set_policy(cast(GtkScrolledWindow*)cPtr, hscrollbarPolicy, vscrollbarPolicy);
  }

  /**
   * Sets whether the natural height of the child should be calculated and propagated
   * through the scrolled window’s requested natural height.
   * Params:
   *   propagate = whether to propagate natural height
   */
  void setPropagateNaturalHeight(bool propagate)
  {
    gtk_scrolled_window_set_propagate_natural_height(cast(GtkScrolledWindow*)cPtr, propagate);
  }

  /**
   * Sets whether the natural width of the child should be calculated and propagated
   * through the scrolled window’s requested natural width.
   * Params:
   *   propagate = whether to propagate natural width
   */
  void setPropagateNaturalWidth(bool propagate)
  {
    gtk_scrolled_window_set_propagate_natural_width(cast(GtkScrolledWindow*)cPtr, propagate);
  }

  /**
   * Changes the type of shadow drawn around the contents of
   * scrolled_window.
   * Params:
   *   type = kind of shadow to draw around scrolled window contents
   */
  void setShadowType(gtk.types.ShadowType type)
  {
    gtk_scrolled_window_set_shadow_type(cast(GtkScrolledWindow*)cPtr, type);
  }

  /**
   * Sets the #GtkAdjustment for the vertical scrollbar.
   * Params:
   *   vadjustment = the #GtkAdjustment to use, or %NULL to create a new one
   */
  void setVadjustment(gtk.adjustment.Adjustment vadjustment)
  {
    gtk_scrolled_window_set_vadjustment(cast(GtkScrolledWindow*)cPtr, vadjustment ? cast(GtkAdjustment*)vadjustment.cPtr(No.Dup) : null);
  }

  /**
   * Unsets the placement of the contents with respect to the scrollbars
   * for the scrolled window. If no window placement is set for a scrolled
   * window, it defaults to %GTK_CORNER_TOP_LEFT.
   * See also [gtk.scrolled_window.ScrolledWindow.setPlacement] and
   * [gtk.scrolled_window.ScrolledWindow.getPlacement].
   */
  void unsetPlacement()
  {
    gtk_scrolled_window_unset_placement(cast(GtkScrolledWindow*)cPtr);
  }

  /**
   * The ::edge-overshot signal is emitted whenever user initiated scrolling
   * makes the scrolled window firmly surpass $(LPAREN)i.e. with some edge resistance$(RPAREN)
   * the lower or upper limits defined by the adjustment in that orientation.
   * A similar behavior without edge resistance is provided by the
   * #GtkScrolledWindow::edge-reached signal.
   * Note: The pos argument is LTR/RTL aware, so callers should be aware too
   * if intending to provide behavior on horizontal edges.
   * Params
   *   pos = edge side that was hit
   *   scrolledWindow = the instance the signal is connected to
   */
  alias EdgeOvershotCallbackDlg = void delegate(gtk.types.PositionType pos, gtk.scrolled_window.ScrolledWindow scrolledWindow);
  alias EdgeOvershotCallbackFunc = void function(gtk.types.PositionType pos, gtk.scrolled_window.ScrolledWindow scrolledWindow);

  /**
   * Connect to EdgeOvershot signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectEdgeOvershot(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EdgeOvershotCallbackDlg) || is(T : EdgeOvershotCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto scrolledWindow = getVal!(gtk.scrolled_window.ScrolledWindow)(_paramVals);
      auto pos = getVal!(gtk.types.PositionType)(&_paramVals[1]);
      _dClosure.dlg(pos, scrolledWindow);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("edge-overshot", closure, after);
  }

  /**
   * The ::edge-reached signal is emitted whenever user-initiated scrolling
   * makes the scrolled window exactly reach the lower or upper limits
   * defined by the adjustment in that orientation.
   * A similar behavior with edge resistance is provided by the
   * #GtkScrolledWindow::edge-overshot signal.
   * Note: The pos argument is LTR/RTL aware, so callers should be aware too
   * if intending to provide behavior on horizontal edges.
   * Params
   *   pos = edge side that was reached
   *   scrolledWindow = the instance the signal is connected to
   */
  alias EdgeReachedCallbackDlg = void delegate(gtk.types.PositionType pos, gtk.scrolled_window.ScrolledWindow scrolledWindow);
  alias EdgeReachedCallbackFunc = void function(gtk.types.PositionType pos, gtk.scrolled_window.ScrolledWindow scrolledWindow);

  /**
   * Connect to EdgeReached signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectEdgeReached(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EdgeReachedCallbackDlg) || is(T : EdgeReachedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto scrolledWindow = getVal!(gtk.scrolled_window.ScrolledWindow)(_paramVals);
      auto pos = getVal!(gtk.types.PositionType)(&_paramVals[1]);
      _dClosure.dlg(pos, scrolledWindow);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("edge-reached", closure, after);
  }

  /**
   * The ::move-focus-out signal is a
   * [keybinding signal][GtkBindingSignal] which gets
   * emitted when focus is moved away from the scrolled window by a
   * keybinding. The #GtkWidget::move-focus signal is emitted with
   * direction_type on this scrolled window’s toplevel parent in the
   * container hierarchy. The default bindings for this signal are
   * `Ctrl + Tab` to move forward and `Ctrl + Shift + Tab` to move backward.
   * Params
   *   directionType = either %GTK_DIR_TAB_FORWARD or
   *     %GTK_DIR_TAB_BACKWARD
   *   scrolledWindow = the instance the signal is connected to
   */
  alias MoveFocusOutCallbackDlg = void delegate(gtk.types.DirectionType directionType, gtk.scrolled_window.ScrolledWindow scrolledWindow);
  alias MoveFocusOutCallbackFunc = void function(gtk.types.DirectionType directionType, gtk.scrolled_window.ScrolledWindow scrolledWindow);

  /**
   * Connect to MoveFocusOut signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectMoveFocusOut(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MoveFocusOutCallbackDlg) || is(T : MoveFocusOutCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto scrolledWindow = getVal!(gtk.scrolled_window.ScrolledWindow)(_paramVals);
      auto directionType = getVal!(gtk.types.DirectionType)(&_paramVals[1]);
      _dClosure.dlg(directionType, scrolledWindow);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-focus-out", closure, after);
  }

  /**
   * The ::scroll-child signal is a
   * [keybinding signal][GtkBindingSignal]
   * which gets emitted when a keybinding that scrolls is pressed.
   * The horizontal or vertical adjustment is updated which triggers a
   * signal that the scrolled window’s child may listen to and scroll itself.
   * Params
   *   scroll = a #GtkScrollType describing how much to scroll
   *   horizontal = whether the keybinding scrolls the child
   *     horizontally or not
   *   scrolledWindow = the instance the signal is connected to
   * Returns:
   */
  alias ScrollChildCallbackDlg = bool delegate(gtk.types.ScrollType scroll, bool horizontal, gtk.scrolled_window.ScrolledWindow scrolledWindow);
  alias ScrollChildCallbackFunc = bool function(gtk.types.ScrollType scroll, bool horizontal, gtk.scrolled_window.ScrolledWindow scrolledWindow);

  /**
   * Connect to ScrollChild signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectScrollChild(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ScrollChildCallbackDlg) || is(T : ScrollChildCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto scrolledWindow = getVal!(gtk.scrolled_window.ScrolledWindow)(_paramVals);
      auto scroll = getVal!(gtk.types.ScrollType)(&_paramVals[1]);
      auto horizontal = getVal!(bool)(&_paramVals[2]);
      _retval = _dClosure.dlg(scroll, horizontal, scrolledWindow);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("scroll-child", closure, after);
  }
}
