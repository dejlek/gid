module gtk.drag_source;

import gdk.content_provider;
import gdk.drag;
import gdk.paintable;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.gesture_single;
import gtk.types;

/**
 * `GtkDragSource` is an event controller to initiate Drag-And-Drop operations.
 * `GtkDragSource` can be set up with the necessary
 * ingredients for a DND operation ahead of time. This includes
 * the source for the data that is being transferred, in the form
 * of a [gdk.content_provider.ContentProvider], the desired action, and the icon to
 * use during the drag operation. After setting it up, the drag
 * source must be added to a widget as an event controller, using
 * [gtk.widget.Widget.addController].
 * ```c
 * static void
 * my_widget_init $(LPAREN)MyWidget *self$(RPAREN)
 * {
 * GtkDragSource *drag_source \= gtk_drag_source_new $(LPAREN)$(RPAREN);
 * g_signal_connect $(LPAREN)drag_source, "prepare", G_CALLBACK $(LPAREN)on_drag_prepare$(RPAREN), self$(RPAREN);
 * g_signal_connect $(LPAREN)drag_source, "drag-begin", G_CALLBACK $(LPAREN)on_drag_begin$(RPAREN), self$(RPAREN);
 * gtk_widget_add_controller $(LPAREN)GTK_WIDGET $(LPAREN)self$(RPAREN), GTK_EVENT_CONTROLLER $(LPAREN)drag_source$(RPAREN)$(RPAREN);
 * }
 * ```
 * Setting up the content provider and icon ahead of time only makes
 * sense when the data does not change. More commonly, you will want
 * to set them up just in time. To do so, `GtkDragSource` has
 * [gtk.drag_source.DragSource.prepare] and signal@Gtk.DragSource::drag-begin
 * signals.
 * The ::prepare signal is emitted before a drag is started, and
 * can be used to set the content provider and actions that the
 * drag should be started with.
 * ```c
 * static GdkContentProvider *
 * on_drag_prepare $(LPAREN)GtkDragSource *source,
 * double         x,
 * double         y,
 * MyWidget      *self$(RPAREN)
 * {
 * // This widget supports two types of content: GFile objects
 * // and GdkPixbuf objects; GTK will handle the serialization
 * // of these types automatically
 * GFile *file \= my_widget_get_file $(LPAREN)self$(RPAREN);
 * GdkPixbuf *pixbuf \= my_widget_get_pixbuf $(LPAREN)self$(RPAREN);
 * return gdk_content_provider_new_union $(LPAREN)$(LPAREN)GdkContentProvider *[2]$(RPAREN) {
 * gdk_content_provider_new_typed $(LPAREN)G_TYPE_FILE, file$(RPAREN),
 * gdk_content_provider_new_typed $(LPAREN)GDK_TYPE_PIXBUF, pixbuf$(RPAREN),
 * }, 2$(RPAREN);
 * }
 * ```
 * The ::drag-begin signal is emitted after the `GdkDrag` object has
 * been created, and can be used to set up the drag icon.
 * ```c
 * static void
 * on_drag_begin $(LPAREN)GtkDragSource *source,
 * GdkDrag       *drag,
 * MyWidget      *self$(RPAREN)
 * {
 * // Set the widget as the drag icon
 * GdkPaintable *paintable \= gtk_widget_paintable_new $(LPAREN)GTK_WIDGET $(LPAREN)self$(RPAREN)$(RPAREN);
 * gtk_drag_source_set_icon $(LPAREN)source, paintable, 0, 0$(RPAREN);
 * g_object_unref $(LPAREN)paintable$(RPAREN);
 * }
 * ```
 * During the DND operation, `GtkDragSource` emits signals that
 * can be used to obtain updates about the status of the operation,
 * but it is not normally necessary to connect to any signals,
 * except for one case: when the supported actions include
 * %GDK_ACTION_MOVE, you need to listen for the
 * signal@Gtk.DragSource::drag-end signal and delete the
 * data after it has been transferred.
 */
class DragSource : gtk.gesture_single.GestureSingle
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_drag_source_get_type != &gidSymbolNotFound ? gtk_drag_source_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkDragSource` object.
   * Returns: the new `GtkDragSource`
   */
  this()
  {
    GtkDragSource* _cretval;
    _cretval = gtk_drag_source_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Cancels a currently ongoing drag operation.
   */
  void dragCancel()
  {
    gtk_drag_source_drag_cancel(cast(GtkDragSource*)cPtr);
  }

  /**
   * Gets the actions that are currently set on the `GtkDragSource`.
   * Returns: the actions set on source
   */
  gdk.types.DragAction getActions()
  {
    GdkDragAction _cretval;
    _cretval = gtk_drag_source_get_actions(cast(GtkDragSource*)cPtr);
    gdk.types.DragAction _retval = cast(gdk.types.DragAction)_cretval;
    return _retval;
  }

  /**
   * Gets the current content provider of a `GtkDragSource`.
   * Returns: the `GdkContentProvider` of source
   */
  gdk.content_provider.ContentProvider getContent()
  {
    GdkContentProvider* _cretval;
    _cretval = gtk_drag_source_get_content(cast(GtkDragSource*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.content_provider.ContentProvider)(cast(GdkContentProvider*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns the underlying `GdkDrag` object for an ongoing drag.
   * Returns: the `GdkDrag` of the current
   *   drag operation
   */
  gdk.drag.Drag getDrag()
  {
    GdkDrag* _cretval;
    _cretval = gtk_drag_source_get_drag(cast(GtkDragSource*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.drag.Drag)(cast(GdkDrag*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Sets the actions on the `GtkDragSource`.
   * During a DND operation, the actions are offered to potential
   * drop targets. If actions include %GDK_ACTION_MOVE, you need
   * to listen to the signalGtk.DragSource::drag-end signal and
   * handle delete_data being %TRUE.
   * This function can be called before a drag is started,
   * or in a handler for the [gtk.drag_source.DragSource.prepare] signal.
   * Params:
   *   actions = the actions to offer
   */
  void setActions(gdk.types.DragAction actions)
  {
    gtk_drag_source_set_actions(cast(GtkDragSource*)cPtr, actions);
  }

  /**
   * Sets a content provider on a `GtkDragSource`.
   * When the data is requested in the cause of a DND operation,
   * it will be obtained from the content provider.
   * This function can be called before a drag is started,
   * or in a handler for the [gtk.drag_source.DragSource.prepare] signal.
   * You may consider setting the content provider back to
   * %NULL in a signalGtk.DragSource::drag-end signal handler.
   * Params:
   *   content = a `GdkContentProvider`
   */
  void setContent(gdk.content_provider.ContentProvider content = null)
  {
    gtk_drag_source_set_content(cast(GtkDragSource*)cPtr, content ? cast(GdkContentProvider*)content.cPtr(No.Dup) : null);
  }

  /**
   * Sets a paintable to use as icon during DND operations.
   * The hotspot coordinates determine the point on the icon
   * that gets aligned with the hotspot of the cursor.
   * If paintable is %NULL, a default icon is used.
   * This function can be called before a drag is started, or in
   * a [gtk.drag_source.DragSource.prepare] or
   * signalGtk.DragSource::drag-begin signal handler.
   * Params:
   *   paintable = the `GdkPaintable` to use as icon
   *   hotX = the hotspot X coordinate on the icon
   *   hotY = the hotspot Y coordinate on the icon
   */
  void setIcon(gdk.paintable.Paintable paintable, int hotX, int hotY)
  {
    gtk_drag_source_set_icon(cast(GtkDragSource*)cPtr, paintable ? cast(GdkPaintable*)(cast(ObjectG)paintable).cPtr(No.Dup) : null, hotX, hotY);
  }

  /**
   * Emitted on the drag source when a drag is started.
   * It can be used to e.g. set a custom drag icon with
   * [gtk.drag_source.DragSource.setIcon].
   * Params
   *   drag = the `GdkDrag` object
   *   dragSource = the instance the signal is connected to
   */
  alias DragBeginCallbackDlg = void delegate(gdk.drag.Drag drag, gtk.drag_source.DragSource dragSource);
  alias DragBeginCallbackFunc = void function(gdk.drag.Drag drag, gtk.drag_source.DragSource dragSource);

  /**
   * Connect to DragBegin signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectDragBegin(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DragBeginCallbackDlg) || is(T : DragBeginCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dragSource = getVal!(gtk.drag_source.DragSource)(_paramVals);
      auto drag = getVal!(gdk.drag.Drag)(&_paramVals[1]);
      _dClosure.dlg(drag, dragSource);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-begin", closure, after);
  }

  /**
   * Emitted on the drag source when a drag has failed.
   * The signal handler may handle a failed drag operation based on
   * the type of error. It should return %TRUE if the failure has been handled
   * and the default "drag operation failed" animation should not be shown.
   * Params
   *   drag = the `GdkDrag` object
   *   reason = information on why the drag failed
   *   dragSource = the instance the signal is connected to
   * Returns: %TRUE if the failed drag operation has been already handled
   */
  alias DragCancelCallbackDlg = bool delegate(gdk.drag.Drag drag, gdk.types.DragCancelReason reason, gtk.drag_source.DragSource dragSource);
  alias DragCancelCallbackFunc = bool function(gdk.drag.Drag drag, gdk.types.DragCancelReason reason, gtk.drag_source.DragSource dragSource);

  /**
   * Connect to DragCancel signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectDragCancel(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DragCancelCallbackDlg) || is(T : DragCancelCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto dragSource = getVal!(gtk.drag_source.DragSource)(_paramVals);
      auto drag = getVal!(gdk.drag.Drag)(&_paramVals[1]);
      auto reason = getVal!(gdk.types.DragCancelReason)(&_paramVals[2]);
      _retval = _dClosure.dlg(drag, reason, dragSource);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-cancel", closure, after);
  }

  /**
   * Emitted on the drag source when a drag is finished.
   * A typical reason to connect to this signal is to undo
   * things done in [gtk.drag_source.DragSource.prepare] or
   * signalGtk.DragSource::drag-begin handlers.
   * Params
   *   drag = the `GdkDrag` object
   *   deleteData = %TRUE if the drag was performing %GDK_ACTION_MOVE,
   *     and the data should be deleted
   *   dragSource = the instance the signal is connected to
   */
  alias DragEndCallbackDlg = void delegate(gdk.drag.Drag drag, bool deleteData, gtk.drag_source.DragSource dragSource);
  alias DragEndCallbackFunc = void function(gdk.drag.Drag drag, bool deleteData, gtk.drag_source.DragSource dragSource);

  /**
   * Connect to DragEnd signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectDragEnd(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DragEndCallbackDlg) || is(T : DragEndCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dragSource = getVal!(gtk.drag_source.DragSource)(_paramVals);
      auto drag = getVal!(gdk.drag.Drag)(&_paramVals[1]);
      auto deleteData = getVal!(bool)(&_paramVals[2]);
      _dClosure.dlg(drag, deleteData, dragSource);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-end", closure, after);
  }

  /**
   * Emitted when a drag is about to be initiated.
   * It returns the `GdkContentProvider` to use for the drag that is about
   * to start. The default handler for this signal returns the value of
   * the [gtk.drag_source.DragSource.Gdk.ContentProvider] property, so if you set up that
   * property ahead of time, you don't need to connect to this signal.
   * Params
   *   x = the X coordinate of the drag starting point
   *   y = the Y coordinate of the drag starting point
   *   dragSource = the instance the signal is connected to
   * Returns: a `GdkContentProvider`
   */
  alias PrepareCallbackDlg = gdk.content_provider.ContentProvider delegate(double x, double y, gtk.drag_source.DragSource dragSource);
  alias PrepareCallbackFunc = gdk.content_provider.ContentProvider function(double x, double y, gtk.drag_source.DragSource dragSource);

  /**
   * Connect to Prepare signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectPrepare(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PrepareCallbackDlg) || is(T : PrepareCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dragSource = getVal!(gtk.drag_source.DragSource)(_paramVals);
      auto x = getVal!(double)(&_paramVals[1]);
      auto y = getVal!(double)(&_paramVals[2]);
      auto _retval = _dClosure.dlg(x, y, dragSource);
      setVal!gdk.content_provider.ContentProvider(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("prepare", closure, after);
  }
}
