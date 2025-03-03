module soup.auth_negotiate;

import gid.gid;
import soup.auth;
import soup.c.functions;
import soup.c.types;
import soup.types;

/**
 * HTTP-based GSS-Negotiate authentication, as defined by
 * [RFC 4559](https://datatracker.ietf.org/doc/html/rfc4559).
 * class@Sessions do not support this type by default; if you want to
 * enable support for it, call [soup.session.Session.addFeatureByType],
 * passing %SOUP_TYPE_AUTH_NEGOTIATE.
 * This auth type will only work if libsoup was compiled with GSSAPI
 * support; you can check [soup.auth_negotiate.AuthNegotiate.supported] to see if it
 * was.
 */
class AuthNegotiate : soup.auth.Auth
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_auth_negotiate_get_type != &gidSymbolNotFound ? soup_auth_negotiate_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Indicates whether libsoup was built with GSSAPI support.
   * If this is %FALSE, %SOUP_TYPE_AUTH_NEGOTIATE will still be defined and can
   * still be added to a classSession, but libsoup will never attempt to
   * actually use this auth type.
   * Returns: %TRUE if supported otherwise %FALSE
   */
  static bool supported()
  {
    bool _retval;
    _retval = soup_auth_negotiate_supported();
    return _retval;
  }
}
