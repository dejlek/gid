/// Module for [AuthDigest] class
module soup.auth_digest;

import gid.gid;
import soup.auth;
import soup.c.functions;
import soup.c.types;
import soup.types;

/**
    HTTP "Digest" authentication.
    
    `class@Session`s support this by default; if you want to disable
    support for it, call [soup.session.Session.removeFeatureByType]
    passing `SOUP_TYPE_AUTH_DIGEST`.
*/
class AuthDigest : soup.auth.Auth
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_auth_digest_get_type != &gidSymbolNotFound ? soup_auth_digest_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AuthDigest self()
  {
    return this;
  }
}
