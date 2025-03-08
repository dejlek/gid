module glib.static_rec_mutex;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    A #GStaticRecMutex works like a #GStaticMutex, but it can be locked
  multiple times by one thread. If you enter it n times, you have to
  unlock it n times again to let other threads lock it. An exception
  is the function [glib.static_rec_mutex.StaticRecMutex.unlockFull]: that allows you to
  unlock a #GStaticRecMutex completely returning the depth, (i.e. the
  number of times this mutex was locked). The depth can later be used
  to restore the state of the #GStaticRecMutex by calling
  [glib.static_rec_mutex.StaticRecMutex.lockFull]. In GLib 2.32, #GStaticRecMutex has
  been deprecated in favor of #GRecMutex.
  
  Even though #GStaticRecMutex is not opaque, it should only be used
  with the following functions.
  
  All of the g_static_rec_mutex_* functions can be used even if
  [glib.thread.Thread.init_] has not been called. Then they do nothing, apart
  from [glib.static_rec_mutex.StaticRecMutex.trylock], which does nothing but returning
  true.
*/
class StaticRecMutex
{
  GStaticRecMutex cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GLib.StaticRecMutex");

    cInstance = *cast(GStaticRecMutex*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }
}
