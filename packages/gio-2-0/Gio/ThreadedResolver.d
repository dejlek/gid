module Gio.ThreadedResolver;

import Gid.gid;
import Gio.Resolver;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * #GThreadedResolver is an implementation of #GResolver which calls the libc
 * lookup functions in threads to allow them to run asynchronously.
 */
class ThreadedResolver : Resolver
{

  this()
  {
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return g_threaded_resolver_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }
}
