//!class DClosure pre
//!kind DClosure Opaque
//!inhibit init funcs

import gobject.closure;
public import gobject.value;

/**
 * Closure used for D delegates.
 */
class DClosure : Closure
{
  void* contextPtr; // Used to keep a reference to delegate context so it doesn't get GC'd

  /** */
  this(T)(T cb, GClosureMarshal cMarshal)
  {
    static if (is(T == delegate))
      contextPtr = cast(void*)cb.ptr;

    auto closure = g_closure_new_simple(DGClosure!T.sizeof, null);
    g_closure_ref(closure);
    g_closure_sink(closure);

    auto dgClosure = cast(DGClosure!T*)closure;
    dgClosure.cb = cb;
    g_closure_set_marshal(closure, cMarshal);
    super(closure, Yes.Take);
  }
}

/**
 * New GClosure type with a delegate pointer
 */
struct DGClosure(T)
{
  GClosure closure;
  T cb;
}
