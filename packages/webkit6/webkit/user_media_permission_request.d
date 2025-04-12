/// Module for [UserMediaPermissionRequest] class
module webkit.user_media_permission_request;

import gid.gid;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.permission_request;
import webkit.permission_request_mixin;
import webkit.types;

/**
    A permission request for accessing user's audio/video devices.
    
    WebKitUserMediaPermissionRequest represents a request for
    permission to decide whether WebKit should be allowed to access the user's
    audio and video source devices when requested through the getUserMedia API.
    
    When a WebKitUserMediaPermissionRequest is not handled by the user,
    it is denied by default.
*/
class UserMediaPermissionRequest : gobject.object.ObjectG, webkit.permission_request.PermissionRequest
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_user_media_permission_request_get_type != &gidSymbolNotFound ? webkit_user_media_permission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UserMediaPermissionRequest self()
  {
    return this;
  }

  mixin PermissionRequestT!();
}
