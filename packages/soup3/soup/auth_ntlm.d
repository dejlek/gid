module soup.auth_ntlm;

import gid.gid;
import soup.auth;
import soup.c.functions;
import soup.c.types;
import soup.types;

/**
    HTTP-based NTLM authentication.
  
  `class@Session`s do not support this type by default; if you want to
  enable support for it, call [soup.session.Session.addFeatureByType],
  passing `SOUP_TYPE_AUTH_NTLM`.
*/
class AuthNTLM : soup.auth.Auth
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_auth_ntlm_get_type != &gidSymbolNotFound ? soup_auth_ntlm_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
