module gtk.handle_box;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
 * The #GtkHandleBox widget allows a portion of a window to be "torn
 * off". It is a bin widget which displays its child and a handle that
 * the user can drag to tear off a separate window $(LPAREN)the “float
 * window”$(RPAREN) containing the child widget. A thin
 * “ghost” is drawn in the original location of the
 * handlebox. By dragging the separate window back to its original
 * location, it can be reattached.
 * When reattaching, the ghost and float window, must be aligned
 * along one of the edges, the “snap edge”.
 * This either can be specified by the application programmer
 * explicitly, or GTK+ will pick a reasonable default based
 * on the handle position.
 * To make detaching and reattaching the handlebox as minimally confusing
 * as possible to the user, it is important to set the snap edge so that
 * the snap edge does not move when the handlebox is deattached. For
 * instance, if the handlebox is packed at the bottom of a VBox, then
 * when the handlebox is detached, the bottom edge of the handlebox's
 * allocation will remain fixed as the height of the handlebox shrinks,
 * so the snap edge should be set to %GTK_POS_BOTTOM.
 * > #GtkHandleBox has been deprecated. It is very specialized, lacks features
 * > to make it useful and most importantly does not fit well into modern
 * > application design. Do not use it. There is no replacement.
 */
class HandleBox : gtk.bin.Bin
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_handle_box_get_type != &gidSymbolNotFound ? gtk_handle_box_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Create a new handle box.
   * Returns: a new #GtkHandleBox.

   * Deprecated: #GtkHandleBox has been deprecated.
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_handle_box_new();
    this(_cretval, No.Take);
  }

  /**
   * Whether the handlebox’s child is currently detached.
   * Returns: %TRUE if the child is currently detached, otherwise %FALSE

   * Deprecated: #GtkHandleBox has been deprecated.
   */
  bool getChildDetached()
  {
    bool _retval;
    _retval = gtk_handle_box_get_child_detached(cast(GtkHandleBox*)cPtr);
    return _retval;
  }

  /**
   * Gets the handle position of the handle box. See
   * [gtk.handle_box.HandleBox.setHandlePosition].
   * Returns: the current handle position.

   * Deprecated: #GtkHandleBox has been deprecated.
   */
  gtk.types.PositionType getHandlePosition()
  {
    GtkPositionType _cretval;
    _cretval = gtk_handle_box_get_handle_position(cast(GtkHandleBox*)cPtr);
    gtk.types.PositionType _retval = cast(gtk.types.PositionType)_cretval;
    return _retval;
  }

  /**
   * Gets the type of shadow drawn around the handle box. See
   * [gtk.handle_box.HandleBox.setShadowType].
   * Returns: the type of shadow currently drawn around the handle box.

   * Deprecated: #GtkHandleBox has been deprecated.
   */
  gtk.types.ShadowType getShadowType()
  {
    GtkShadowType _cretval;
    _cretval = gtk_handle_box_get_shadow_type(cast(GtkHandleBox*)cPtr);
    gtk.types.ShadowType _retval = cast(gtk.types.ShadowType)_cretval;
    return _retval;
  }

  /**
   * Gets the edge used for determining reattachment of the handle box.
   * See [gtk.handle_box.HandleBox.setSnapEdge].
   * Returns: the edge used for determining reattachment, or
   *   $(LPAREN)GtkPositionType$(RPAREN)-1 if this is determined $(LPAREN)as per default$(RPAREN)
   *   from the handle position.

   * Deprecated: #GtkHandleBox has been deprecated.
   */
  gtk.types.PositionType getSnapEdge()
  {
    GtkPositionType _cretval;
    _cretval = gtk_handle_box_get_snap_edge(cast(GtkHandleBox*)cPtr);
    gtk.types.PositionType _retval = cast(gtk.types.PositionType)_cretval;
    return _retval;
  }

  /**
   * Sets the side of the handlebox where the handle is drawn.
   * Params:
   *   position = the side of the handlebox where the handle should be drawn.

   * Deprecated: #GtkHandleBox has been deprecated.
   */
  void setHandlePosition(gtk.types.PositionType position)
  {
    gtk_handle_box_set_handle_position(cast(GtkHandleBox*)cPtr, position);
  }

  /**
   * Sets the type of shadow to be drawn around the border
   * of the handle box.
   * Params:
   *   type = the shadow type.

   * Deprecated: #GtkHandleBox has been deprecated.
   */
  void setShadowType(gtk.types.ShadowType type)
  {
    gtk_handle_box_set_shadow_type(cast(GtkHandleBox*)cPtr, type);
  }

  /**
   * Sets the snap edge of a handlebox. The snap edge is
   * the edge of the detached child that must be aligned
   * with the corresponding edge of the “ghost” left
   * behind when the child was detached to reattach
   * the torn-off window. Usually, the snap edge should
   * be chosen so that it stays in the same place on
   * the screen when the handlebox is torn off.
   * If the snap edge is not set, then an appropriate value
   * will be guessed from the handle position. If the
   * handle position is %GTK_POS_RIGHT or %GTK_POS_LEFT,
   * then the snap edge will be %GTK_POS_TOP, otherwise
   * it will be %GTK_POS_LEFT.
   * Params:
   *   edge = the snap edge, or -1 to unset the value; in which
   *     case GTK+ will try to guess an appropriate value
   *     in the future.

   * Deprecated: #GtkHandleBox has been deprecated.
   */
  void setSnapEdge(gtk.types.PositionType edge)
  {
    gtk_handle_box_set_snap_edge(cast(GtkHandleBox*)cPtr, edge);
  }

  /**
   * This signal is emitted when the contents of the
   * handlebox are reattached to the main window.
   * Params
   *   widget = the child widget of the handlebox.
   *     $(LPAREN)this argument provides no extra information
   *     and is here only for backwards-compatibility$(RPAREN)
   *   handleBox = the instance the signal is connected to

   * Deprecated: #GtkHandleBox has been deprecated.
   */
  alias ChildAttachedCallbackDlg = void delegate(gtk.widget.Widget widget, gtk.handle_box.HandleBox handleBox);
  alias ChildAttachedCallbackFunc = void function(gtk.widget.Widget widget, gtk.handle_box.HandleBox handleBox);

  /**
   * Connect to ChildAttached signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectChildAttached(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChildAttachedCallbackDlg) || is(T : ChildAttachedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto handleBox = getVal!(gtk.handle_box.HandleBox)(_paramVals);
      auto widget = getVal!(gtk.widget.Widget)(&_paramVals[1]);
      _dClosure.dlg(widget, handleBox);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("child-attached", closure, after);
  }

  /**
   * This signal is emitted when the contents of the
   * handlebox are detached from the main window.
   * Params
   *   widget = the child widget of the handlebox.
   *     $(LPAREN)this argument provides no extra information
   *     and is here only for backwards-compatibility$(RPAREN)
   *   handleBox = the instance the signal is connected to

   * Deprecated: #GtkHandleBox has been deprecated.
   */
  alias ChildDetachedCallbackDlg = void delegate(gtk.widget.Widget widget, gtk.handle_box.HandleBox handleBox);
  alias ChildDetachedCallbackFunc = void function(gtk.widget.Widget widget, gtk.handle_box.HandleBox handleBox);

  /**
   * Connect to ChildDetached signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectChildDetached(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChildDetachedCallbackDlg) || is(T : ChildDetachedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto handleBox = getVal!(gtk.handle_box.HandleBox)(_paramVals);
      auto widget = getVal!(gtk.widget.Widget)(&_paramVals[1]);
      _dClosure.dlg(widget, handleBox);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("child-detached", closure, after);
  }
}
