/// Module for [DeviceInfoPermissionRequest] class
module webkit.device_info_permission_request;

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
    permission to whether WebKit should be allowed to access the user's
    devices information when requested through the enumerateDevices API.
    
    When a WebKitDeviceInfoPermissionRequest is not handled by the user,
    it is denied by default.
*/
class DeviceInfoPermissionRequest : gobject.object.ObjectG, webkit.permission_request.PermissionRequest
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
    return cast(void function())webkit_device_info_permission_request_get_type != &gidSymbolNotFound ? webkit_device_info_permission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DeviceInfoPermissionRequest self()
  {
    return this;
  }

  mixin PermissionRequestT!();
}
