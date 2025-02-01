module GObject.SignalGroup;

import GObject.Closure;
import GObject.DClosure;
import GObject.ObjectG;
import GObject.Types;
import GObject.c.functions;
import GObject.c.types;
import Gid.gid;

/**
 * `GSignalGroup` manages a collection of signals on a `GObject`.
 * `GSignalGroup` simplifies the process of connecting  many signals to a `GObject`
 * as a group. As such there is no API to disconnect a signal from the group.
 * In particular, this allows you to:
 * - Change the target instance, which automatically causes disconnection
 * of the signals from the old instance and connecting to the new instance.
 * - Block and unblock signals as a group
 * - Ensuring that blocked state transfers across target instances.
 * One place you might want to use such a structure is with `GtkTextView` and
 * `GtkTextBuffer`. Often times, you'll need to connect to many signals on
 * `GtkTextBuffer` from a `GtkTextView` subclass. This allows you to create a
 * signal group during instance construction, simply bind the
 * `GtkTextView:buffer` property to `GSignalGroup:target` and connect
 * all the signals you need. When the `GtkTextView:buffer` property changes
 * all of the signals will be transitioned correctly.
 */
class SignalGroup : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return g_signal_group_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new #GSignalGroup for target instances of target_type.
   * Params:
   *   targetType = the #GType of the target instance.
   * Returns: a new #GSignalGroup
   */
  this(GType targetType)
  {
    GSignalGroup* _cretval;
    _cretval = g_signal_group_new(targetType);
    this(_cretval, Yes.Take);
  }

  /**
   * Blocks all signal handlers managed by self so they will not
   * be called during any signal emissions. Must be unblocked exactly
   * the same number of times it has been blocked to become active again.
   * This blocked state will be kept across changes of the target instance.
   */
  void block()
  {
    g_signal_group_block(cast(GSignalGroup*)cPtr);
  }

  /**
   * Connects closure to the signal detailed_signal on #GSignalGroup:target.
   * You cannot connect a signal handler after #GSignalGroup:target has been set.
   * Params:
   *   detailedSignal = a string of the form `signal-name` with optional `::signal-detail`
   *   closure = the closure to connect.
   *   after = whether the handler should be called before or after the
   *     default handler of the signal.
   */
  void connectClosure(string detailedSignal, Closure closure, bool after)
  {
    const(char)* _detailedSignal = detailedSignal.toCString(No.Alloc);
    g_signal_group_connect_closure(cast(GSignalGroup*)cPtr, _detailedSignal, closure ? cast(GClosure*)closure.cPtr(No.Dup) : null, after);
  }

  /**
   * Gets the target instance used when connecting signals.
   * Returns: The target instance
   */
  ObjectG dupTarget()
  {
    ObjectC* _cretval;
    _cretval = g_signal_group_dup_target(cast(GSignalGroup*)cPtr);
    auto _retval = ObjectG.getDObject!ObjectG(cast(ObjectC*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Sets the target instance used when connecting signals. Any signal
   * that has been registered with [GObject.SignalGroup.connectObject] or
   * similar functions will be connected to this object.
   * If the target instance was previously set, signals will be
   * disconnected from that object prior to connecting to target.
   * Params:
   *   target = The target instance used
   *     when connecting signals.
   */
  void setTarget(ObjectG target)
  {
    g_signal_group_set_target(cast(GSignalGroup*)cPtr, target ? cast(ObjectC*)target.cPtr(No.Dup) : null);
  }

  /**
   * Unblocks all signal handlers managed by self so they will be
   * called again during any signal emissions unless it is blocked
   * again. Must be unblocked exactly the same number of times it
   * has been blocked to become active again.
   */
  void unblock()
  {
    g_signal_group_unblock(cast(GSignalGroup*)cPtr);
  }

  /**
   * This signal is emitted when #GSignalGroup:target is set to a new value
   * other than %NULL. It is similar to #GObject::notify on `target` except it
   * will not emit when #GSignalGroup:target is %NULL and also allows for
   * receiving the #GObject without a data-race.
   * Params
   *   instance = a #GObject containing the new value for #GSignalGroup:target
   *   signalGroup = the instance the signal is connected to
   */
  alias BindCallbackDlg = void delegate(ObjectG instance, SignalGroup signalGroup);
  alias BindCallbackFunc = void function(ObjectG instance, SignalGroup signalGroup);

  /**
   * Connect to Bind signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectBind(T)(T callback, Flag!"After" after = No.After)
  if (is(T == BindCallbackDlg) || is(T == BindCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto signalGroup = getVal!SignalGroup(_paramVals);
      auto instance = getVal!ObjectG(&_paramVals[1]);
      _dClosure.dlg(instance, signalGroup);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("bind", closure, after);
  }

  /**
   * This signal is emitted when the target instance of self is set to a
   * new #GObject.
   * This signal will only be emitted if the previous target of self is
   * non-%NULL.
   *   signalGroup = the instance the signal is connected to
   */
  alias UnbindCallbackDlg = void delegate(SignalGroup signalGroup);
  alias UnbindCallbackFunc = void function(SignalGroup signalGroup);

  /**
   * Connect to Unbind signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectUnbind(T)(T callback, Flag!"After" after = No.After)
  if (is(T == UnbindCallbackDlg) || is(T == UnbindCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto signalGroup = getVal!SignalGroup(_paramVals);
      _dClosure.dlg(signalGroup);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unbind", closure, after);
  }
}
