module soup.cookie_jar;

import gid.gid;
import glib.uri;
import gobject.dclosure;
import gobject.object;
import soup.c.functions;
import soup.c.types;
import soup.cookie;
import soup.session_feature;
import soup.session_feature_mixin;
import soup.types;

/**
 * Automatic cookie handling for SoupSession.
 * A #SoupCookieJar stores struct@Cookies and arrange for them to be sent with
 * the appropriate class@Messages. #SoupCookieJar implements
 * iface@SessionFeature, so you can add a cookie jar to a session with
 * [soup.session.Session.addFeature] or [soup.session.Session.addFeatureByType].
 * Note that the base #SoupCookieJar class does not support any form
 * of long-term cookie persistence.
 */
class CookieJar : gobject.object.ObjectG, soup.session_feature.SessionFeature
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_cookie_jar_get_type != &gidSymbolNotFound ? soup_cookie_jar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin SessionFeatureT!();

  /**
   * Creates a new #SoupCookieJar.
   * The base #SoupCookieJar class does not support persistent storage of cookies;
   * use a subclass for that.
   * Returns: a new #SoupCookieJar
   */
  this()
  {
    SoupCookieJar* _cretval;
    _cretval = soup_cookie_jar_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Adds cookie to jar.
   * Emits the signalCookieJar::changed signal if we are modifying
   * an existing cookie or adding a valid new cookie $(LPAREN)'valid' means
   * that the cookie's expire date is not in the past$(RPAREN).
   * cookie will be 'stolen' by the jar, so don't free it afterwards.
   * Params:
   *   cookie = a #SoupCookie
   */
  void addCookie(soup.cookie.Cookie cookie)
  {
    soup_cookie_jar_add_cookie(cast(SoupCookieJar*)cPtr, cookie ? cast(SoupCookie*)cookie.cPtr(Yes.Dup) : null);
  }

  /**
   * Adds cookie to jar.
   * Emits the signalCookieJar::changed signal if we are modifying an existing
   * cookie or adding a valid new cookie $(LPAREN)'valid' means that the cookie's expire
   * date is not in the past$(RPAREN).
   * first_party will be used to reject cookies coming from third party
   * resources in case such a security policy is set in the jar.
   * uri will be used to reject setting or overwriting secure cookies
   * from insecure origins. %NULL is treated as secure.
   * cookie will be 'stolen' by the jar, so don't free it afterwards.
   * Params:
   *   cookie = a #SoupCookie
   *   uri = the URI setting the cookie
   *   firstParty = the URI for the main document
   */
  void addCookieFull(soup.cookie.Cookie cookie, glib.uri.Uri uri = null, glib.uri.Uri firstParty = null)
  {
    soup_cookie_jar_add_cookie_full(cast(SoupCookieJar*)cPtr, cookie ? cast(SoupCookie*)cookie.cPtr(Yes.Dup) : null, uri ? cast(GUri*)uri.cPtr(No.Dup) : null, firstParty ? cast(GUri*)firstParty.cPtr(No.Dup) : null);
  }

  /**
   * Adds cookie to jar.
   * Emits the signalCookieJar::changed signal if we are modifying
   * an existing cookie or adding a valid new cookie $(LPAREN)'valid' means
   * that the cookie's expire date is not in the past$(RPAREN).
   * first_party will be used to reject cookies coming from third party
   * resources in case such a security policy is set in the jar.
   * cookie will be 'stolen' by the jar, so don't free it afterwards.
   * For secure cookies to work properly you may want to use
   * [soup.cookie_jar.CookieJar.addCookieFull].
   * Params:
   *   firstParty = the URI for the main document
   *   cookie = a #SoupCookie
   */
  void addCookieWithFirstParty(glib.uri.Uri firstParty, soup.cookie.Cookie cookie)
  {
    soup_cookie_jar_add_cookie_with_first_party(cast(SoupCookieJar*)cPtr, firstParty ? cast(GUri*)firstParty.cPtr(No.Dup) : null, cookie ? cast(SoupCookie*)cookie.cPtr(Yes.Dup) : null);
  }

  /**
   * Constructs a [glib.list.List] with every cookie inside the jar.
   * The cookies in the list are a copy of the original, so
   * you have to free them when you are done with them.
   * Returns: a #GSList
   *   with all the cookies in the jar.
   */
  soup.cookie.Cookie[] allCookies()
  {
    GSList* _cretval;
    _cretval = soup_cookie_jar_all_cookies(cast(SoupCookieJar*)cPtr);
    auto _retval = gSListToD!(soup.cookie.Cookie, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
   * Deletes cookie from jar.
   * Emits the signalCookieJar::changed signal.
   * Params:
   *   cookie = a #SoupCookie
   */
  void deleteCookie(soup.cookie.Cookie cookie)
  {
    soup_cookie_jar_delete_cookie(cast(SoupCookieJar*)cPtr, cookie ? cast(SoupCookie*)cookie.cPtr(No.Dup) : null);
  }

  /**
   * Gets jar's enumCookieJarAcceptPolicy.
   * Returns: the #SoupCookieJarAcceptPolicy set in the jar
   */
  soup.types.CookieJarAcceptPolicy getAcceptPolicy()
  {
    SoupCookieJarAcceptPolicy _cretval;
    _cretval = soup_cookie_jar_get_accept_policy(cast(SoupCookieJar*)cPtr);
    soup.types.CookieJarAcceptPolicy _retval = cast(soup.types.CookieJarAcceptPolicy)_cretval;
    return _retval;
  }

  /**
   * Retrieves the list of cookies that would be sent with a request to uri
   * as a [glib.list.List] of #SoupCookie objects.
   * If for_http is %TRUE, the return value will include cookies marked
   * "HttpOnly" $(LPAREN)that is, cookies that the server wishes to keep hidden
   * from client-side scripting operations such as the JavaScript
   * document.cookies property$(RPAREN). Since #SoupCookieJar sets the Cookie
   * header itself when making the actual HTTP request, you should
   * almost certainly be setting for_http to %FALSE if you are calling
   * this.
   * Params:
   *   uri = a #GUri
   *   forHttp = whether or not the return value is being passed directly
   *     to an HTTP operation
   * Returns: a #GSList
   *   with the cookies in the jar that would be sent with a request to uri.
   */
  soup.cookie.Cookie[] getCookieList(glib.uri.Uri uri, bool forHttp)
  {
    GSList* _cretval;
    _cretval = soup_cookie_jar_get_cookie_list(cast(SoupCookieJar*)cPtr, uri ? cast(GUri*)uri.cPtr(No.Dup) : null, forHttp);
    auto _retval = gSListToD!(soup.cookie.Cookie, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
   * This is an extended version of [soup.cookie_jar.CookieJar.getCookieList] that
   * provides more information required to use SameSite cookies.
   * See the [SameSite cookies
   * spec]$(LPAREN)https://tools.ietf.org/html/draft-ietf-httpbis-cookie-same-site-00$(RPAREN) for
   * more detailed information.
   * Params:
   *   uri = a #GUri
   *   topLevel = a #GUri for the top level document
   *   siteForCookies = a #GUri indicating the origin to get cookies for
   *   forHttp = whether or not the return value is being passed directly
   *     to an HTTP operation
   *   isSafeMethod = if the HTTP method is safe, as defined by RFC 7231, ignored when for_http is %FALSE
   *   isTopLevelNavigation = whether or not the HTTP request is part of
   *     top level navigation
   * Returns: a #GSList
   *   with the cookies in the jar that would be sent with a request to uri.
   */
  soup.cookie.Cookie[] getCookieListWithSameSiteInfo(glib.uri.Uri uri, glib.uri.Uri topLevel, glib.uri.Uri siteForCookies, bool forHttp, bool isSafeMethod, bool isTopLevelNavigation)
  {
    GSList* _cretval;
    _cretval = soup_cookie_jar_get_cookie_list_with_same_site_info(cast(SoupCookieJar*)cPtr, uri ? cast(GUri*)uri.cPtr(No.Dup) : null, topLevel ? cast(GUri*)topLevel.cPtr(No.Dup) : null, siteForCookies ? cast(GUri*)siteForCookies.cPtr(No.Dup) : null, forHttp, isSafeMethod, isTopLevelNavigation);
    auto _retval = gSListToD!(soup.cookie.Cookie, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
   * Retrieves $(LPAREN)in Cookie-header form$(RPAREN) the list of cookies that would
   * be sent with a request to uri.
   * If for_http is %TRUE, the return value will include cookies marked
   * "HttpOnly" $(LPAREN)that is, cookies that the server wishes to keep hidden
   * from client-side scripting operations such as the JavaScript
   * document.cookies property$(RPAREN). Since #SoupCookieJar sets the Cookie
   * header itself when making the actual HTTP request, you should
   * almost certainly be setting for_http to %FALSE if you are calling
   * this.
   * Params:
   *   uri = a #GUri
   *   forHttp = whether or not the return value is being passed directly
   *     to an HTTP operation
   * Returns: the cookies, in string form, or %NULL if
   *   there are no cookies for uri.
   */
  string getCookies(glib.uri.Uri uri, bool forHttp)
  {
    char* _cretval;
    _cretval = soup_cookie_jar_get_cookies(cast(SoupCookieJar*)cPtr, uri ? cast(GUri*)uri.cPtr(No.Dup) : null, forHttp);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Gets whether jar stores cookies persistenly.
   * Returns: %TRUE if jar storage is persistent or %FALSE otherwise.
   */
  bool isPersistent()
  {
    bool _retval;
    _retval = soup_cookie_jar_is_persistent(cast(SoupCookieJar*)cPtr);
    return _retval;
  }

  /**
   * Sets policy as the cookie acceptance policy for jar.
   * Params:
   *   policy = a #SoupCookieJarAcceptPolicy
   */
  void setAcceptPolicy(soup.types.CookieJarAcceptPolicy policy)
  {
    soup_cookie_jar_set_accept_policy(cast(SoupCookieJar*)cPtr, policy);
  }

  /**
   * Adds cookie to jar, exactly as though it had appeared in a
   * Set-Cookie header returned from a request to uri.
   * Keep in mind that if the enumCookieJarAcceptPolicy set is either
   * %SOUP_COOKIE_JAR_ACCEPT_NO_THIRD_PARTY or
   * %SOUP_COOKIE_JAR_ACCEPT_GRANDFATHERED_THIRD_PARTY you'll need to use
   * [soup.cookie_jar.CookieJar.setCookieWithFirstParty], otherwise the jar
   * will have no way of knowing if the cookie is being set by a third
   * party or not.
   * Params:
   *   uri = the URI setting the cookie
   *   cookie = the stringified cookie to set
   */
  void setCookie(glib.uri.Uri uri, string cookie)
  {
    const(char)* _cookie = cookie.toCString(No.Alloc);
    soup_cookie_jar_set_cookie(cast(SoupCookieJar*)cPtr, uri ? cast(GUri*)uri.cPtr(No.Dup) : null, _cookie);
  }

  /**
   * Adds cookie to jar, exactly as though it had appeared in a
   * Set-Cookie header returned from a request to uri.
   * first_party will be used to reject cookies coming from third party resources
   * in case such a security policy is set in the jar.
   * Params:
   *   uri = the URI setting the cookie
   *   firstParty = the URI for the main document
   *   cookie = the stringified cookie to set
   */
  void setCookieWithFirstParty(glib.uri.Uri uri, glib.uri.Uri firstParty, string cookie)
  {
    const(char)* _cookie = cookie.toCString(No.Alloc);
    soup_cookie_jar_set_cookie_with_first_party(cast(SoupCookieJar*)cPtr, uri ? cast(GUri*)uri.cPtr(No.Dup) : null, firstParty ? cast(GUri*)firstParty.cPtr(No.Dup) : null, _cookie);
  }

  /**
   * Emitted when jar changes.
   * If a cookie has been added,
   * new_cookie will contain the newly-added cookie and
   * old_cookie will be %NULL. If a cookie has been deleted,
   * old_cookie will contain the to-be-deleted cookie and
   * new_cookie will be %NULL. If a cookie has been changed,
   * old_cookie will contain its old value, and new_cookie its
   * new value.
   * Params
   *   oldCookie = the old #SoupCookie value
   *   newCookie = the new #SoupCookie value
   *   cookieJar = the instance the signal is connected to
   */
  alias ChangedCallbackDlg = void delegate(soup.cookie.Cookie oldCookie, soup.cookie.Cookie newCookie, soup.cookie_jar.CookieJar cookieJar);
  alias ChangedCallbackFunc = void function(soup.cookie.Cookie oldCookie, soup.cookie.Cookie newCookie, soup.cookie_jar.CookieJar cookieJar);

  /**
   * Connect to Changed signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChangedCallbackDlg) || is(T : ChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto cookieJar = getVal!(soup.cookie_jar.CookieJar)(_paramVals);
      auto oldCookie = getVal!(soup.cookie.Cookie)(&_paramVals[1]);
      auto newCookie = getVal!(soup.cookie.Cookie)(&_paramVals[2]);
      _dClosure.dlg(oldCookie, newCookie, cookieJar);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }
}
