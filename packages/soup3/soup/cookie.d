module soup.cookie;

import gid.gid;
import glib.date_time;
import glib.uri;
import gobject.boxed;
import soup.c.functions;
import soup.c.types;
import soup.types;

/**
 * Implements HTTP cookies, as described by
 * [RFC 6265](http://tools.ietf.org/html/rfc6265.txt).
 * To have a class@Session handle cookies for your appliction
 * automatically, use a class@CookieJar.
 * @name and @value will be set for all cookies. If the cookie is
 * generated from a string that appears to have no name, then @name
 * will be the empty string.
 * @domain and @path give the host or domain, and path within that
 * host/domain, to restrict this cookie to. If @domain starts with
 * ".", that indicates a domain $(LPAREN)which matches the string after the
 * ".", or any hostname that has @domain as a suffix$(RPAREN). Otherwise, it
 * is a hostname and must match exactly.
 * @expires will be non-%NULL if the cookie uses either the original
 * "expires" attribute, or the newer "max-age" attribute. If @expires
 * is %NULL, it indicates that neither "expires" nor "max-age" was
 * specified, and the cookie expires at the end of the session.
 * If @http_only is set, the cookie should not be exposed to untrusted
 * code $(LPAREN)eg, javascript$(RPAREN), so as to minimize the danger posed by
 * cross-site scripting attacks.
 */
class Cookie : Boxed
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_cookie_get_type != &gidSymbolNotFound ? soup_cookie_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new #SoupCookie with the given attributes.
   * Use [Soup.Cookie.setSecure] and [Soup.Cookie.setHttpOnly] if you
   * need to set those attributes on the returned cookie.
   * If domain starts with ".", that indicates a domain $(LPAREN)which matches
   * the string after the ".", or any hostname that has domain as a
   * suffix$(RPAREN). Otherwise, it is a hostname and must match exactly.
   * max_age is used to set the "expires" attribute on the cookie; pass
   * -1 to not include the attribute $(LPAREN)indicating that the cookie expires
   * with the current session$(RPAREN), 0 for an already-expired cookie, or a
   * lifetime in seconds. You can use the constants
   * %SOUP_COOKIE_MAX_AGE_ONE_HOUR, %SOUP_COOKIE_MAX_AGE_ONE_DAY,
   * %SOUP_COOKIE_MAX_AGE_ONE_WEEK and %SOUP_COOKIE_MAX_AGE_ONE_YEAR $(LPAREN)or
   * multiples thereof$(RPAREN) to calculate this value. $(LPAREN)If you really care
   * about setting the exact time that the cookie will expire, use
   * [Soup.Cookie.setExpires].$(RPAREN)
   * As of version 3.4.0 the default value of a cookie's same-site-policy
   * is %SOUP_SAME_SITE_POLICY_LAX.
   * Params:
   *   name = cookie name
   *   value = cookie value
   *   domain = cookie domain or hostname
   *   path = cookie path, or %NULL
   *   maxAge = max age of the cookie, or -1 for a session cookie
   * Returns: a new #SoupCookie.
   */
  this(string name, string value, string domain, string path, int maxAge)
  {
    SoupCookie* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    const(char)* _domain = domain.toCString(No.Alloc);
    const(char)* _path = path.toCString(No.Alloc);
    _cretval = soup_cookie_new(_name, _value, _domain, _path, maxAge);
    this(_cretval, Yes.Take);
  }

  /**
   * Tests if cookie should be sent to uri.
   * $(LPAREN)At the moment, this does not check that cookie's domain matches
   * uri, because it assumes that the caller has already done that.
   * But don't rely on that; it may change in the future.$(RPAREN)
   * Params:
   *   uri = a #GUri
   * Returns: %TRUE if cookie should be sent to uri, %FALSE if not
   */
  bool appliesToUri(Uri uri)
  {
    bool _retval;
    _retval = soup_cookie_applies_to_uri(cast(SoupCookie*)cPtr, uri ? cast(GUri*)uri.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Copies cookie.
   * Returns: a copy of cookie
   */
  Cookie copy()
  {
    SoupCookie* _cretval;
    _cretval = soup_cookie_copy(cast(SoupCookie*)cPtr);
    auto _retval = _cretval ? new Cookie(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Checks if the cookie's domain and host match.
   * The domains match if cookie should be sent when making a request to host,
   * or that cookie should be accepted when receiving a response from host.
   * Params:
   *   host = a URI
   * Returns: %TRUE if the domains match, %FALSE otherwise
   */
  bool domainMatches(string host)
  {
    bool _retval;
    const(char)* _host = host.toCString(No.Alloc);
    _retval = soup_cookie_domain_matches(cast(SoupCookie*)cPtr, _host);
    return _retval;
  }

  /**
   * Tests if cookie1 and cookie2 are equal.
   * Note that currently, this does not check that the cookie domains
   * match. This may change in the future.
   * Params:
   *   cookie2 = a #SoupCookie
   * Returns: whether the cookies are equal.
   */
  bool equal(Cookie cookie2)
  {
    bool _retval;
    _retval = soup_cookie_equal(cast(SoupCookie*)cPtr, cookie2 ? cast(SoupCookie*)cookie2.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Gets cookie's domain.
   * Returns: cookie's domain
   */
  string getDomain()
  {
    const(char)* _cretval;
    _cretval = soup_cookie_get_domain(cast(SoupCookie*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets cookie's expiration time.
   * Returns: cookie's expiration time, which is
   *   owned by cookie and should not be modified or freed.
   */
  DateTime getExpires()
  {
    GDateTime* _cretval;
    _cretval = soup_cookie_get_expires(cast(SoupCookie*)cPtr);
    auto _retval = _cretval ? new DateTime(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Gets cookie's HttpOnly attribute.
   * Returns: cookie's HttpOnly attribute
   */
  bool getHttpOnly()
  {
    bool _retval;
    _retval = soup_cookie_get_http_only(cast(SoupCookie*)cPtr);
    return _retval;
  }

  /**
   * Gets cookie's name.
   * Returns: cookie's name
   */
  string getName()
  {
    const(char)* _cretval;
    _cretval = soup_cookie_get_name(cast(SoupCookie*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets cookie's path.
   * Returns: cookie's path
   */
  string getPath()
  {
    const(char)* _cretval;
    _cretval = soup_cookie_get_path(cast(SoupCookie*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Returns the same-site policy for this cookie.
   * Returns: a #SoupSameSitePolicy
   */
  SameSitePolicy getSameSitePolicy()
  {
    SoupSameSitePolicy _cretval;
    _cretval = soup_cookie_get_same_site_policy(cast(SoupCookie*)cPtr);
    SameSitePolicy _retval = cast(SameSitePolicy)_cretval;
    return _retval;
  }

  /**
   * Gets cookie's secure attribute.
   * Returns: cookie's secure attribute
   */
  bool getSecure()
  {
    bool _retval;
    _retval = soup_cookie_get_secure(cast(SoupCookie*)cPtr);
    return _retval;
  }

  /**
   * Gets cookie's value.
   * Returns: cookie's value
   */
  string getValue()
  {
    const(char)* _cretval;
    _cretval = soup_cookie_get_value(cast(SoupCookie*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Sets cookie's domain to domain.
   * Params:
   *   domain = the new domain
   */
  void setDomain(string domain)
  {
    const(char)* _domain = domain.toCString(No.Alloc);
    soup_cookie_set_domain(cast(SoupCookie*)cPtr, _domain);
  }

  /**
   * Sets cookie's expiration time to expires.
   * If expires is %NULL, cookie will be a session cookie and will expire at the
   * end of the client's session.
   * $(LPAREN)This sets the same property as [Soup.Cookie.setMaxAge].$(RPAREN)
   * Params:
   *   expires = the new expiration time, or %NULL
   */
  void setExpires(DateTime expires)
  {
    soup_cookie_set_expires(cast(SoupCookie*)cPtr, expires ? cast(GDateTime*)expires.cPtr(No.Dup) : null);
  }

  /**
   * Sets cookie's HttpOnly attribute to http_only.
   * If %TRUE, cookie will be marked as "http only", meaning it should not be
   * exposed to web page scripts or other untrusted code.
   * Params:
   *   httpOnly = the new value for the HttpOnly attribute
   */
  void setHttpOnly(bool httpOnly)
  {
    soup_cookie_set_http_only(cast(SoupCookie*)cPtr, httpOnly);
  }

  /**
   * Sets cookie's max age to max_age.
   * If max_age is -1, the cookie is a session cookie, and will expire at the end
   * of the client's session. Otherwise, it is the number of seconds until the
   * cookie expires. You can use the constants %SOUP_COOKIE_MAX_AGE_ONE_HOUR,
   * %SOUP_COOKIE_MAX_AGE_ONE_DAY, %SOUP_COOKIE_MAX_AGE_ONE_WEEK and
   * %SOUP_COOKIE_MAX_AGE_ONE_YEAR $(LPAREN)or multiples thereof$(RPAREN) to calculate this value.
   * $(LPAREN)A value of 0 indicates that the cookie should be considered
   * already-expired.$(RPAREN)
   * This sets the same property as [Soup.Cookie.setExpires].
   * Params:
   *   maxAge = the new max age
   */
  void setMaxAge(int maxAge)
  {
    soup_cookie_set_max_age(cast(SoupCookie*)cPtr, maxAge);
  }

  /**
   * Sets cookie's name to name.
   * Params:
   *   name = the new name
   */
  void setName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    soup_cookie_set_name(cast(SoupCookie*)cPtr, _name);
  }

  /**
   * Sets cookie's path to path.
   * Params:
   *   path = the new path
   */
  void setPath(string path)
  {
    const(char)* _path = path.toCString(No.Alloc);
    soup_cookie_set_path(cast(SoupCookie*)cPtr, _path);
  }

  /**
   * When used in conjunction with
   * [Soup.CookieJar.getCookieListWithSameSiteInfo] this sets the policy
   * of when this cookie should be exposed.
   * Params:
   *   policy = a #SoupSameSitePolicy
   */
  void setSameSitePolicy(SameSitePolicy policy)
  {
    soup_cookie_set_same_site_policy(cast(SoupCookie*)cPtr, policy);
  }

  /**
   * Sets cookie's secure attribute to secure.
   * If %TRUE, cookie will only be transmitted from the client to the server over
   * secure $(LPAREN)https$(RPAREN) connections.
   * Params:
   *   secure = the new value for the secure attribute
   */
  void setSecure(bool secure)
  {
    soup_cookie_set_secure(cast(SoupCookie*)cPtr, secure);
  }

  /**
   * Sets cookie's value to value.
   * Params:
   *   value = the new value
   */
  void setValue(string value)
  {
    const(char)* _value = value.toCString(No.Alloc);
    soup_cookie_set_value(cast(SoupCookie*)cPtr, _value);
  }

  /**
   * Serializes cookie in the format used by the Cookie header $(LPAREN)ie, for
   * returning a cookie from a classSession to a server$(RPAREN).
   * Returns: the header
   */
  string toCookieHeader()
  {
    char* _cretval;
    _cretval = soup_cookie_to_cookie_header(cast(SoupCookie*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Serializes cookie in the format used by the Set-Cookie header.
   * i.e. for sending a cookie from a classServer to a client.
   * Returns: the header
   */
  string toSetCookieHeader()
  {
    char* _cretval;
    _cretval = soup_cookie_to_set_cookie_header(cast(SoupCookie*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Parses header and returns a #SoupCookie.
   * If header contains multiple cookies, only the first one will be parsed.
   * If header does not have "path" or "domain" attributes, they will
   * be defaulted from origin. If origin is %NULL, path will default
   * to "/", but domain will be left as %NULL. Note that this is not a
   * valid state for a #SoupCookie, and you will need to fill in some
   * appropriate string for the domain if you want to actually make use
   * of the cookie.
   * As of version 3.4.0 the default value of a cookie's same-site-policy
   * is %SOUP_SAME_SITE_POLICY_LAX.
   * Params:
   *   header = a cookie string $(LPAREN)eg, the value of a Set-Cookie header$(RPAREN)
   *   origin = origin of the cookie
   * Returns: a new #SoupCookie, or %NULL if it could
   *   not be parsed, or contained an illegal "domain" attribute for a
   *   cookie originating from origin.
   */
  static Cookie parse(string header, Uri origin)
  {
    SoupCookie* _cretval;
    const(char)* _header = header.toCString(No.Alloc);
    _cretval = soup_cookie_parse(_header, origin ? cast(GUri*)origin.cPtr(No.Dup) : null);
    auto _retval = _cretval ? new Cookie(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
