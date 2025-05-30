/// Module for [ThreadedResolver] class
module gio.threaded_resolver;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.resolver;
import gio.types;

/**
    #GThreadedResolver is an implementation of #GResolver which calls the libc
    lookup functions in threads to allow them to run asynchronously.
*/
class ThreadedResolver : gio.resolver.Resolver
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_threaded_resolver_get_type != &gidSymbolNotFound ? g_threaded_resolver_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ThreadedResolver self()
  {
    return this;
  }
}
