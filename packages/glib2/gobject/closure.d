module gobject.closure;

import gid.gid;
import gobject.boxed;
import gobject.c.functions;
import gobject.c.types;
import gobject.object;
import gobject.types;
import gobject.value;

/**
 * A `GClosure` represents a callback supplied by the programmer.
 * It will generally comprise a function of some kind and a marshaller
 * used to call it. It is the responsibility of the marshaller to
 * convert the arguments for the invocation from #GValues into
 * a suitable form, perform the callback on the converted arguments,
 * and transform the return value back into a #GValue.
 * In the case of C programs, a closure usually just holds a pointer
 * to a function and maybe a data argument, and the marshaller
 * converts between #GValue and native C types. The GObject
 * library provides the #GCClosure type for this purpose. Bindings for
 * other languages need marshallers which convert between #GValues
 * and suitable representations in the runtime of the language in
 * order to use functions written in that language as callbacks. Use
 * [gobject.closure.Closure.setMarshal] to set the marshaller on such a custom
 * closure implementation.
 * Within GObject, closures play an important role in the
 * implementation of signals. When a signal is registered, the
 * @c_marshaller argument to [gobject.global.signalNew] specifies the default C
 * marshaller for any closure which is connected to this
 * signal. GObject provides a number of C marshallers for this
 * purpose, see the g_cclosure_marshal_*$(LPAREN)$(RPAREN) functions. Additional C
 * marshallers can be generated with the [glib-genmarshal][glib-genmarshal]
 * utility.  Closures can be explicitly connected to signals with
 * [gobject.global.signalConnectClosure], but it usually more convenient to let
 * GObject create a closure automatically by using one of the
 * g_signal_connect_*$(LPAREN)$(RPAREN) functions which take a callback function/user
 * data pair.
 * Using closures has a number of important advantages over a simple
 * callback function/data pointer combination:
 * - Closures allow the callee to get the types of the callback parameters,
 * which means that language bindings don't have to write individual glue
 * for each callback type.
 * - The reference counting of #GClosure makes it easy to handle reentrancy
 * right; if a callback is removed while it is being invoked, the closure
 * and its parameters won't be freed until the invocation finishes.
 * - [gobject.closure.Closure.invalidate] and invalidation notifiers allow callbacks to be
 * automatically removed when the objects they point to go away.
 */
class Closure : gobject.boxed.Boxed
{

  this()
  {
    super(safeMalloc(GClosure.sizeof), Yes.Take);
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_closure_get_type != &gidSymbolNotFound ? g_closure_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  @property uint inMarshal()
  {
    return (cast(GClosure*)cPtr).inMarshal;
  }

  @property void inMarshal(uint propval)
  {
    (cast(GClosure*)cPtr).inMarshal = propval;
  }

  @property uint isInvalid()
  {
    return (cast(GClosure*)cPtr).isInvalid;
  }

  @property void isInvalid(uint propval)
  {
    (cast(GClosure*)cPtr).isInvalid = propval;
  }

  alias MarshalFuncType = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData);

  @property MarshalFuncType marshal()
  {
    return (cast(GClosure*)cPtr).marshal;
  }

  /**
   * A variant of [gobject.closure.Closure.newSimple] which stores object in the
   * data field of the closure and calls [gobject.object.ObjectG.watchClosure] on
   * object and the created closure. This function is mainly useful
   * when implementing new types of closures.
   * Params:
   *   sizeofClosure = the size of the structure to allocate, must be at least
   *     `sizeof $(LPAREN)GClosure$(RPAREN)`
   *   object = a #GObject pointer to store in the data field of the newly
   *     allocated #GClosure
   * Returns: a newly allocated #GClosure
   */
  static gobject.closure.Closure newObject(uint sizeofClosure, gobject.object.ObjectG object)
  {
    GClosure* _cretval;
    _cretval = g_closure_new_object(sizeofClosure, object ? cast(ObjectC*)object.cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gobject.closure.Closure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Allocates a struct of the given size and initializes the initial
   * part as a #GClosure.
   * This function is mainly useful when implementing new types of closures:
   * |[<!-- language\="C" -->
   * typedef struct _MyClosure MyClosure;
   * struct _MyClosure
   * {
   * GClosure closure;
   * // extra data goes here
   * };
   * static void
   * my_closure_finalize $(LPAREN)gpointer  notify_data,
   * GClosure *closure$(RPAREN)
   * {
   * MyClosure *my_closure \= $(LPAREN)MyClosure *$(RPAREN)closure;
   * // free extra data here
   * }
   * MyClosure *my_closure_new $(LPAREN)gpointer data$(RPAREN)
   * {
   * GClosure *closure;
   * MyClosure *my_closure;
   * closure \= g_closure_new_simple $(LPAREN)sizeof $(LPAREN)MyClosure$(RPAREN), data$(RPAREN);
   * my_closure \= $(LPAREN)MyClosure *$(RPAREN) closure;
   * // initialize extra data here
   * g_closure_add_finalize_notifier $(LPAREN)closure, notify_data,
   * my_closure_finalize$(RPAREN);
   * return my_closure;
   * }
   * ]|
   * Params:
   *   sizeofClosure = the size of the structure to allocate, must be at least
   *     `sizeof $(LPAREN)GClosure$(RPAREN)`
   *   data = data to store in the data field of the newly allocated #GClosure
   * Returns: a floating reference to a new #GClosure
   */
  static gobject.closure.Closure newSimple(uint sizeofClosure, void* data = null)
  {
    GClosure* _cretval;
    _cretval = g_closure_new_simple(sizeofClosure, data);
    auto _retval = _cretval ? new gobject.closure.Closure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Sets a flag on the closure to indicate that its calling
   * environment has become invalid, and thus causes any future
   * invocations of [gobject.closure.Closure.invoke] on this closure to be
   * ignored.
   * Also, invalidation notifiers installed on the closure will
   * be called at this point. Note that unless you are holding a
   * reference to the closure yourself, the invalidation notifiers may
   * unref the closure and cause it to be destroyed, so if you need to
   * access the closure after calling [gobject.closure.Closure.invalidate], make sure
   * that you've previously called [gobject.closure.Closure.ref_].
   * Note that [gobject.closure.Closure.invalidate] will also be called when the
   * reference count of a closure drops to zero $(LPAREN)unless it has already
   * been invalidated before$(RPAREN).
   */
  void invalidate()
  {
    g_closure_invalidate(cast(GClosure*)cPtr);
  }

  /**
   * Invokes the closure, i.e. executes the callback represented by the closure.
   * Params:
   *   returnValue = a #GValue to store the return
   *     value. May be %NULL if the callback of closure
   *     doesn't return a value.
   *   paramValues = an array of
   *     #GValues holding the arguments on which to
   *     invoke the callback of closure
   *   invocationHint = a context-dependent invocation hint
   */
  void invoke(out gobject.value.Value returnValue, gobject.value.Value[] paramValues, void* invocationHint = null)
  {
    GValue _returnValue;
    uint _nParamValues;
    if (paramValues)
      _nParamValues = cast(uint)paramValues.length;

    GValue[] _tmpparamValues;
    foreach (obj; paramValues)
      _tmpparamValues ~= *cast(GValue*)obj.cPtr;
    const(GValue)* _paramValues = _tmpparamValues.ptr;
    g_closure_invoke(cast(GClosure*)cPtr, &_returnValue, _nParamValues, _paramValues, invocationHint);
    returnValue = new gobject.value.Value(cast(void*)&_returnValue, No.Take);
  }

  /**
   * Takes over the initial ownership of a closure.
   * Each closure is initially created in a "floating" state, which means
   * that the initial reference count is not owned by any caller.
   * This function checks to see if the object is still floating, and if so,
   * unsets the floating state and decreases the reference count. If the
   * closure is not floating, [gobject.closure.Closure.sink] does nothing.
   * The reason for the existence of the floating state is to prevent
   * cumbersome code sequences like:
   * |[<!-- language\="C" -->
   * closure \= g_cclosure_new $(LPAREN)cb_func, cb_data$(RPAREN);
   * g_source_set_closure $(LPAREN)source, closure$(RPAREN);
   * g_closure_unref $(LPAREN)closure$(RPAREN); // GObject doesn't really need this
   * ]|
   * Because [gobject.global.sourceSetClosure] (and similar functions) take ownership of the
   * initial reference count, if it is unowned, we instead can write:
   * |[<!-- language\="C" -->
   * g_source_set_closure $(LPAREN)source, g_cclosure_new $(LPAREN)cb_func, cb_data$(RPAREN)$(RPAREN);
   * ]|
   * Generally, this function is used together with [gobject.closure.Closure.ref_]. An example
   * of storing a closure for later notification looks like:
   * |[<!-- language\="C" -->
   * static GClosure *notify_closure \= NULL;
   * void
   * foo_notify_set_closure $(LPAREN)GClosure *closure$(RPAREN)
   * {
   * if $(LPAREN)notify_closure$(RPAREN)
   * g_closure_unref $(LPAREN)notify_closure$(RPAREN);
   * notify_closure \= closure;
   * if $(LPAREN)notify_closure$(RPAREN)
   * {
   * g_closure_ref $(LPAREN)notify_closure$(RPAREN);
   * g_closure_sink $(LPAREN)notify_closure$(RPAREN);
   * }
   * }
   * ]|
   * Because [gobject.closure.Closure.sink] may decrement the reference count of a closure
   * $(LPAREN)if it hasn't been called on closure yet$(RPAREN) just like [gobject.closure.Closure.unref],
   * [gobject.closure.Closure.ref_] should be called prior to this function.
   */
  void sink()
  {
    g_closure_sink(cast(GClosure*)cPtr);
  }
}
