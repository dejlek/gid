/// Module for [AuthDomainBasic] class
module soup.auth_domain_basic;

import gid.gid;
import gobject.object;
import soup.auth_domain;
import soup.c.functions;
import soup.c.types;
import soup.server_message;
import soup.types;

/**
    Server-side "Basic" authentication.
    
    #SoupAuthDomainBasic handles the server side of HTTP "Basic" (ie,
    cleartext password) authentication.
*/
class AuthDomainBasic : soup.auth_domain.AuthDomain
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
    return cast(void function())soup_auth_domain_basic_get_type != &gidSymbolNotFound ? soup_auth_domain_basic_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override AuthDomainBasic self()
  {
    return this;
  }

  /**
      Sets the callback that domain will use to authenticate incoming
      requests.
      
      For each request containing authorization, domain will invoke the callback,
      and then either accept or reject the request based on callback's return
      value.
      
      You can also set the auth callback by setting the
      `propertyAuthDomainBasic:auth-callback` and
      `propertyAuthDomainBasic:auth-data` properties, which can also be used to
      set the callback at construct time.
  
      Params:
        callback = the callback
  */
  void setAuthCallback(soup.types.AuthDomainBasicAuthCallback callback)
  {
    extern(C) bool _callbackCallback(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, const(char)* password, void* userData)
    {
      auto _dlg = cast(soup.types.AuthDomainBasicAuthCallback*)userData;
      string _username = username.fromCString(No.Free);
      string _password = password.fromCString(No.Free);

      bool _retval = (*_dlg)(ObjectG.getDObject!(soup.auth_domain_basic.AuthDomainBasic)(cast(void*)domain, No.Take), ObjectG.getDObject!(soup.server_message.ServerMessage)(cast(void*)msg, No.Take), _username, _password);
      return _retval;
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    soup_auth_domain_basic_set_auth_callback(cast(SoupAuthDomain*)cPtr, _callbackCB, _callback, _callbackDestroyCB);
  }
}
