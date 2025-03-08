module soup.auth_basic;

import gid.gid;
import soup.auth;
import soup.c.functions;
import soup.c.types;
import soup.types;

/**
    HTTP "Basic" authentication.
  
  `class@Session`s support this by default; if you want to disable
  support for it, call [soup.session.Session.removeFeatureByType],
  passing `SOUP_TYPE_AUTH_BASIC`.
*/
class AuthBasic : soup.auth.Auth
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_auth_basic_get_type != &gidSymbolNotFound ? soup_auth_basic_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }
}
