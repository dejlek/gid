/// Module for [PointerLockPermissionRequest] class
module webkit.pointer_lock_permission_request;

import gid.gid;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.permission_request;
import webkit.permission_request_mixin;
import webkit.types;

/**
    A permission request for locking the pointer.
    
    WebKitPointerLockPermissionRequest represents a request for
    permission to decide whether WebKit can lock the pointer device when
    requested by web content.
    
    When a WebKitPointerLockPermissionRequest is not handled by the user,
    it is allowed by default.
*/
class PointerLockPermissionRequest : gobject.object.ObjectWrap, webkit.permission_request.PermissionRequest
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
    return cast(void function())webkit_pointer_lock_permission_request_get_type != &gidSymbolNotFound ? webkit_pointer_lock_permission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PointerLockPermissionRequest self()
  {
    return this;
  }

  mixin PermissionRequestT!();
}
