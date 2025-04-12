/// Module for [NotificationPermissionRequest] class
module webkit.notification_permission_request;

import gid.gid;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.permission_request;
import webkit.permission_request_mixin;
import webkit.types;

/**
    A permission request for displaying web notifications.
    
    WebKitNotificationPermissionRequest represents a request for
    permission to decide whether WebKit should provide the user with
    notifications through the Web Notification API.
    
    When a WebKitNotificationPermissionRequest is not handled by the user,
    it is denied by default.
*/
class NotificationPermissionRequest : gobject.object.ObjectG, webkit.permission_request.PermissionRequest
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
    return cast(void function())webkit_notification_permission_request_get_type != &gidSymbolNotFound ? webkit_notification_permission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NotificationPermissionRequest self()
  {
    return this;
  }

  mixin PermissionRequestT!();
}
