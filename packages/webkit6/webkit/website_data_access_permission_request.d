/// Module for [WebsiteDataAccessPermissionRequest] class
module webkit.website_data_access_permission_request;

import gid.gid;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.permission_request;
import webkit.permission_request_mixin;
import webkit.types;

/**
    A permission request for accessing website data from third-party domains.
    
    WebKitWebsiteDataAccessPermissionRequest represents a request for
    permission to allow a third-party domain access its cookies.
    
    When a WebKitWebsiteDataAccessPermissionRequest is not handled by the user,
    it is denied by default.
*/
class WebsiteDataAccessPermissionRequest : gobject.object.ObjectWrap, webkit.permission_request.PermissionRequest
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
    return cast(void function())webkit_website_data_access_permission_request_get_type != &gidSymbolNotFound ? webkit_website_data_access_permission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebsiteDataAccessPermissionRequest self()
  {
    return this;
  }

  mixin PermissionRequestT!();

  /**
      Get the current domain being browsed.
      Returns: the current domain name
  */
  string getCurrentDomain()
  {
    const(char)* _cretval;
    _cretval = webkit_website_data_access_permission_request_get_current_domain(cast(WebKitWebsiteDataAccessPermissionRequest*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the domain requesting permission to access its cookies while browsing the current domain.
      Returns: the requesting domain name
  */
  string getRequestingDomain()
  {
    const(char)* _cretval;
    _cretval = webkit_website_data_access_permission_request_get_requesting_domain(cast(WebKitWebsiteDataAccessPermissionRequest*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
