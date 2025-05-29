/// Module for [ResolverError] enum namespace
module gio.resolver_error;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import glib.error;
import glib.types;

/// Namespace for [ResolverError] enum
struct ResolverError
{
  alias Enum = gio.types.ResolverError; ///

  /**
      Gets the #GResolver Error Quark.
      Returns: a #GQuark.
  */
  static glib.types.Quark quark()
  {
    glib.types.Quark _retval;
    _retval = g_resolver_error_quark();
    return _retval;
  }
}

class ResolveException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gio.resolver_error.ResolverError.quark, cast(int)code, msg);
  }

  alias Code = gio.types.ResolverError;
}
