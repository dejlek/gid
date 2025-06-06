/// Module for [StaticMutex] class
module glib.static_mutex;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.mutex;
import glib.types;

/**
    A #GStaticMutex works like a #GMutex.
    
    Prior to GLib 2.32, GStaticMutex had the significant advantage
    that it doesn't need to be created at run-time, but can be defined
    at compile-time. Since 2.32, #GMutex can be statically allocated
    as well, and GStaticMutex has been deprecated.
    
    Here is a version of our give_me_next_number() example using
    a GStaticMutex:
    ```
      int
      give_me_next_number (void)
      {
        static int current_number = 0;
        int ret_val;
        static GStaticMutex mutex = G_STATIC_MUTEX_INIT;
    
        g_static_mutex_lock (&mutex);
        ret_val = current_number = calc_next_number (current_number);
        g_static_mutex_unlock (&mutex);
    
        return ret_val;
      }
    ```
    
    Sometimes you would like to dynamically create a mutex. If you don't
    want to require prior calling to [glib.thread.Thread.init_], because your code
    should also be usable in non-threaded programs, you are not able to
    use [glib.mutex.Mutex.new_] and thus #GMutex, as that requires a prior call to
    [glib.thread.Thread.init_]. In these cases you can also use a #GStaticMutex.
    It must be initialized with [glib.static_mutex.StaticMutex.init_] before using it
    and freed with with [glib.static_mutex.StaticMutex.free] when not needed anymore to
    free up any allocated resources.
    
    Even though #GStaticMutex is not opaque, it should only be used with
    the following functions, as it is defined differently on different
    platforms.
    
    All of the g_static_mutex_* functions apart from
    g_static_mutex_get_mutex() can also be used even if [glib.thread.Thread.init_]
    has not yet been called. Then they do nothing, apart from
    g_static_mutex_trylock() which does nothing but returning true.
    
    All of the g_static_mutex_* functions are actually macros. Apart from
    taking their addresses, you can however use them as if they were
    functions.
*/
class StaticMutex
{
  GStaticMutex cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.static_mutex.StaticMutex");

    cInstance = *cast(GStaticMutex*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /** */
  @property glib.mutex.Mutex mutex()
  {
    return new glib.mutex.Mutex(cast(GMutex*)(cast(GStaticMutex*)this._cPtr).mutex, No.Take);
  }

  /** */
  glib.mutex.Mutex getMutexImpl()
  {
    GMutex* _cretval;
    _cretval = g_static_mutex_get_mutex_impl(cast(GStaticMutex*)this._cPtr);
    auto _retval = _cretval ? new glib.mutex.Mutex(cast(GMutex*)_cretval, No.Take) : null;
    return _retval;
  }
}
