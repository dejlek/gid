module gio.simple_permission;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.permission;
import gio.types;

/**
 * `GSimplePermission` is a trivial implementation of [gio.permission.Permission]
 * that represents a permission that is either always or never allowed.  The
 * value is given at construction and doesn’t change.
 * Calling [gio.permission.Permission.acquire] or [gio.permission.Permission.release]
 * on a `GSimplePermission` will result in errors.
 */
class SimplePermission : gio.permission.Permission
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_simple_permission_get_type != &gidSymbolNotFound ? g_simple_permission_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new #GPermission instance that represents an action that is
   * either always or never allowed.
   * Params:
   *   allowed = %TRUE if the action is allowed
   * Returns: the #GSimplePermission, as a #GPermission
   */
  this(bool allowed)
  {
    GPermission* _cretval;
    _cretval = g_simple_permission_new(allowed);
    this(_cretval, Yes.Take);
  }
}
