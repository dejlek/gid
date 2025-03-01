module soup.auth_domain_digest;

import gid.global;
import gobject.object;
import soup.auth_domain;
import soup.c.functions;
import soup.c.types;
import soup.server_message;
import soup.types;

/**
 * Server-side "Digest" authentication.
 * #SoupAuthDomainDigest handles the server side of HTTP "Digest"
 * authentication.
 */
class AuthDomainDigest : AuthDomain
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_auth_domain_digest_get_type != &gidSymbolNotFound ? soup_auth_domain_digest_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Encodes the username/realm/password triplet for Digest
   * authentication.
   * That is, it returns a stringified MD5 hash of
   * username, realm, and password concatenated together. This is
   * the form that is needed as the return value of
   * #SoupAuthDomainDigest's auth handler.
   * For security reasons, you should store the encoded hash, rather
   * than storing the cleartext password itself and calling this method
   * only when you need to verify it. This way, if your server is
   * compromised, the attackers will not gain access to cleartext
   * passwords which might also be usable at other sites. $(LPAREN)Note also
   * that the encoded password returned by this method is identical to
   * the encoded password stored in an Apache .htdigest file.$(RPAREN)
   * Params:
   *   username = a username
   *   realm = an auth realm name
   *   password = the password for username in realm
   * Returns: the encoded password
   */
  static string encodePassword(string username, string realm, string password)
  {
    char* _cretval;
    const(char)* _username = username.toCString(No.Alloc);
    const(char)* _realm = realm.toCString(No.Alloc);
    const(char)* _password = password.toCString(No.Alloc);
    _cretval = soup_auth_domain_digest_encode_password(_username, _realm, _password);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Sets the callback that domain will use to authenticate incoming
   * requests.
   * For each request containing authorization, domain will
   * invoke the callback, and then either accept or reject the request
   * based on callback's return value.
   * You can also set the auth callback by setting the
   * propertyAuthDomainDigest:auth-callback and
   * propertyAuthDomainDigest:auth-data properties, which can also be used to
   * set the callback at construct time.
   * Params:
   *   callback = the callback
   */
  void setAuthCallback(AuthDomainDigestAuthCallback callback)
  {
    extern(C) char* _callbackCallback(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, void* userData)
    {
      string _dretval;
      auto _dlg = cast(AuthDomainDigestAuthCallback*)userData;
      string _username = username.fromCString(No.Free);

      _dretval = (*_dlg)(ObjectG.getDObject!AuthDomainDigest(cast(void*)domain, No.Take), ObjectG.getDObject!ServerMessage(cast(void*)msg, No.Take), _username);
      char* _retval = _dretval.toCString(Yes.Alloc);

      return _retval;
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    soup_auth_domain_digest_set_auth_callback(cast(SoupAuthDomain*)cPtr, _callbackCB, _callback, _callbackDestroyCB);
  }
}
