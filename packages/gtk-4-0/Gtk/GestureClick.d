module Gtk.GestureClick;

import GObject.DClosure;
import Gdk.EventSequence;
import Gid.gid;
import Gtk.GestureSingle;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkGestureClick` is a `GtkGesture` implementation for clicks.
 * It is able to recognize multiple clicks on a nearby zone, which
 * can be listened for through the [Gtk.GestureClick.pressed]
 * signal. Whenever time or distance between clicks exceed the GTK
 * defaults, [Gtk.GestureClick.stopped] is emitted, and the
 * click counter is reset.
 */
class GestureClick : GestureSingle
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_gesture_click_get_type != &gidSymbolNotFound ? gtk_gesture_click_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Returns a newly created `GtkGesture` that recognizes
   * single and multiple presses.
   * Returns: a newly created `GtkGestureClick`
   */
  this()
  {
    GtkGesture* _cretval;
    _cretval = gtk_gesture_click_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Emitted whenever a button or touch press happens.
   * Params
   *   nPress = how many touch/button presses happened with this one
   *   x = The X coordinate, in widget allocation coordinates
   *   y = The Y coordinate, in widget allocation coordinates
   *   gestureClick = the instance the signal is connected to
   */
  alias PressedCallbackDlg = void delegate(int nPress, double x, double y, GestureClick gestureClick);
  alias PressedCallbackFunc = void function(int nPress, double x, double y, GestureClick gestureClick);

  /**
   * Connect to Pressed signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectPressed(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PressedCallbackDlg) || is(T : PressedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gestureClick = getVal!GestureClick(_paramVals);
      auto nPress = getVal!int(&_paramVals[1]);
      auto x = getVal!double(&_paramVals[2]);
      auto y = getVal!double(&_paramVals[3]);
      _dClosure.dlg(nPress, x, y, gestureClick);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("pressed", closure, after);
  }

  /**
   * Emitted when a button or touch is released.
   * n_press will report the number of press that is paired to
   * this event, note that [Gtk.GestureClick.stopped] may
   * have been emitted between the press and its release, n_press
   * will only start over at the next press.
   * Params
   *   nPress = number of press that is paired with this release
   *   x = The X coordinate, in widget allocation coordinates
   *   y = The Y coordinate, in widget allocation coordinates
   *   gestureClick = the instance the signal is connected to
   */
  alias ReleasedCallbackDlg = void delegate(int nPress, double x, double y, GestureClick gestureClick);
  alias ReleasedCallbackFunc = void function(int nPress, double x, double y, GestureClick gestureClick);

  /**
   * Connect to Released signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectReleased(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ReleasedCallbackDlg) || is(T : ReleasedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gestureClick = getVal!GestureClick(_paramVals);
      auto nPress = getVal!int(&_paramVals[1]);
      auto x = getVal!double(&_paramVals[2]);
      auto y = getVal!double(&_paramVals[3]);
      _dClosure.dlg(nPress, x, y, gestureClick);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("released", closure, after);
  }

  /**
   * Emitted whenever any time/distance threshold has been exceeded.
   *   gestureClick = the instance the signal is connected to
   */
  alias StoppedCallbackDlg = void delegate(GestureClick gestureClick);
  alias StoppedCallbackFunc = void function(GestureClick gestureClick);

  /**
   * Connect to Stopped signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectStopped(T)(T callback, Flag!"After" after = No.After)
  if (is(T : StoppedCallbackDlg) || is(T : StoppedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gestureClick = getVal!GestureClick(_paramVals);
      _dClosure.dlg(gestureClick);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("stopped", closure, after);
  }

  /**
   * Emitted whenever the gesture receives a release
   * event that had no previous corresponding press.
   * Due to implicit grabs, this can only happen on situations
   * where input is grabbed elsewhere mid-press or the pressed
   * widget voluntarily relinquishes its implicit grab.
   * Params
   *   x = X coordinate of the event
   *   y = Y coordinate of the event
   *   button = Button being released
   *   sequence = Sequence being released
   *   gestureClick = the instance the signal is connected to
   */
  alias UnpairedReleaseCallbackDlg = void delegate(double x, double y, uint button, EventSequence sequence, GestureClick gestureClick);
  alias UnpairedReleaseCallbackFunc = void function(double x, double y, uint button, EventSequence sequence, GestureClick gestureClick);

  /**
   * Connect to UnpairedRelease signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectUnpairedRelease(T)(T callback, Flag!"After" after = No.After)
  if (is(T : UnpairedReleaseCallbackDlg) || is(T : UnpairedReleaseCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gestureClick = getVal!GestureClick(_paramVals);
      auto x = getVal!double(&_paramVals[1]);
      auto y = getVal!double(&_paramVals[2]);
      auto button = getVal!uint(&_paramVals[3]);
      auto sequence = getVal!EventSequence(&_paramVals[4]);
      _dClosure.dlg(x, y, button, sequence, gestureClick);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unpaired-release", closure, after);
  }
}
