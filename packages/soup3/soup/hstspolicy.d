module soup.hstspolicy;

import gid.global;
import glib.date_time;
import gobject.boxed;
import soup.c.functions;
import soup.c.types;
import soup.message;
import soup.types;

/**
 * #SoupHSTSPolicy implements HTTP policies, as described by
 * [RFC 6797](http://tools.ietf.org/html/rfc6797).
 * @domain represents the host that this policy applies to. The domain
 * must be IDNA-canonicalized. [soup.hstspolicy.HSTSPolicy.new_] and related methods
 * will do this for you.
 * @max_age contains the 'max-age' value from the Strict Transport
 * Security header and indicates the time to live of this policy,
 * in seconds.
 * @expires will be non-%NULL if the policy has been set by the host and
 * hence has an expiry time. If @expires is %NULL, it indicates that the
 * policy is a permanent session policy set by the user agent.
 * If @include_subdomains is %TRUE, the Strict Transport Security policy
 * must also be enforced on subdomains of @domain.
 */
class HSTSPolicy : Boxed
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
    return cast(void function())soup_hsts_policy_get_type != &gidSymbolNotFound ? soup_hsts_policy_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new #SoupHSTSPolicy with the given attributes.
   * domain is a domain on which the strict transport security policy
   * represented by this object must be enforced.
   * max_age is used to set the "expires" attribute on the policy; pass
   * %SOUP_HSTS_POLICY_MAX_AGE_PAST for an already-expired policy, or a
   * lifetime in seconds.
   * If include_subdomains is %TRUE, the strict transport security policy
   * must also be enforced on all subdomains of domain.
   * Params:
   *   domain = policy domain or hostname
   *   maxAge = max age of the policy
   *   includeSubdomains = %TRUE if the policy applies on subdomains
   * Returns: a new #SoupHSTSPolicy.
   */
  this(string domain, gulong maxAge, bool includeSubdomains)
  {
    SoupHSTSPolicy* _cretval;
    const(char)* _domain = domain.toCString(No.Alloc);
    _cretval = soup_hsts_policy_new(_domain, maxAge, includeSubdomains);
    this(_cretval, Yes.Take);
  }

  /**
   * Parses msg's first "Strict-Transport-Security" response header and
   * returns a #SoupHSTSPolicy.
   * Params:
   *   msg = a #SoupMessage
   * Returns: a new #SoupHSTSPolicy, or %NULL if no valid
   *   "Strict-Transport-Security" response header was found.
   */
  static HSTSPolicy newFromResponse(Message msg)
  {
    SoupHSTSPolicy* _cretval;
    _cretval = soup_hsts_policy_new_from_response(msg ? cast(SoupMessage*)msg.cPtr(No.Dup) : null);
    auto _retval = _cretval ? new HSTSPolicy(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Full version of [soup.hstspolicy.HSTSPolicy.new_], to use with an existing
   * expiration date.
   * See [soup.hstspolicy.HSTSPolicy.new_] for details.
   * Params:
   *   domain = policy domain or hostname
   *   maxAge = max age of the policy
   *   expires = the date of expiration of the policy or %NULL for a permanent policy
   *   includeSubdomains = %TRUE if the policy applies on subdomains
   * Returns: a new #SoupHSTSPolicy.
   */
  static HSTSPolicy newFull(string domain, gulong maxAge, DateTime expires, bool includeSubdomains)
  {
    SoupHSTSPolicy* _cretval;
    const(char)* _domain = domain.toCString(No.Alloc);
    _cretval = soup_hsts_policy_new_full(_domain, maxAge, expires ? cast(GDateTime*)expires.cPtr(No.Dup) : null, includeSubdomains);
    auto _retval = _cretval ? new HSTSPolicy(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Creates a new session #SoupHSTSPolicy with the given attributes.
   * A session policy is a policy that is valid during the lifetime of
   * the classHSTSEnforcer it is added to. Contrary to regular policies,
   * it has no expiration date and is not stored in persistent
   * enforcers. These policies are useful for user-agent to load their
   * own or user-defined rules.
   * domain is a domain on which the strict transport security policy
   * represented by this object must be enforced.
   * If include_subdomains is %TRUE, the strict transport security policy
   * must also be enforced on all subdomains of domain.
   * Params:
   *   domain = policy domain or hostname
   *   includeSubdomains = %TRUE if the policy applies on sub domains
   * Returns: a new #SoupHSTSPolicy.
   */
  static HSTSPolicy newSessionPolicy(string domain, bool includeSubdomains)
  {
    SoupHSTSPolicy* _cretval;
    const(char)* _domain = domain.toCString(No.Alloc);
    _cretval = soup_hsts_policy_new_session_policy(_domain, includeSubdomains);
    auto _retval = _cretval ? new HSTSPolicy(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Copies policy.
   * Returns: a copy of policy
   */
  HSTSPolicy copy()
  {
    SoupHSTSPolicy* _cretval;
    _cretval = soup_hsts_policy_copy(cast(SoupHSTSPolicy*)cPtr);
    auto _retval = _cretval ? new HSTSPolicy(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Tests if policy1 and policy2 are equal.
   * Params:
   *   policy2 = a #SoupHSTSPolicy
   * Returns: whether the policies are equal.
   */
  bool equal(HSTSPolicy policy2)
  {
    bool _retval;
    _retval = soup_hsts_policy_equal(cast(SoupHSTSPolicy*)cPtr, policy2 ? cast(SoupHSTSPolicy*)policy2.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Gets policy's domain.
   * Returns: policy's domain.
   */
  string getDomain()
  {
    const(char)* _cretval;
    _cretval = soup_hsts_policy_get_domain(cast(SoupHSTSPolicy*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Returns the expiration date for policy.
   * Returns: A #GDateTime or %NULL if unset
   */
  DateTime getExpires()
  {
    GDateTime* _cretval;
    _cretval = soup_hsts_policy_get_expires(cast(SoupHSTSPolicy*)cPtr);
    auto _retval = _cretval ? new DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Returns the max age for policy.
   * Returns: Max age in seconds
   */
  gulong getMaxAge()
  {
    gulong _retval;
    _retval = soup_hsts_policy_get_max_age(cast(SoupHSTSPolicy*)cPtr);
    return _retval;
  }

  /**
   * Gets whether policy include its subdomains.
   * Returns: %TRUE if policy includes subdomains, %FALSE otherwise.
   */
  bool includesSubdomains()
  {
    bool _retval;
    _retval = soup_hsts_policy_includes_subdomains(cast(SoupHSTSPolicy*)cPtr);
    return _retval;
  }

  /**
   * Gets whether policy is expired.
   * Permanent policies never expire.
   * Returns: %TRUE if policy is expired, %FALSE otherwise.
   */
  bool isExpired()
  {
    bool _retval;
    _retval = soup_hsts_policy_is_expired(cast(SoupHSTSPolicy*)cPtr);
    return _retval;
  }

  /**
   * Gets whether policy is a non-permanent, non-expirable session policy.
   * See [soup.hstspolicy.HSTSPolicy.newSessionPolicy] for details.
   * Returns: %TRUE if policy is permanent, %FALSE otherwise
   */
  bool isSessionPolicy()
  {
    bool _retval;
    _retval = soup_hsts_policy_is_session_policy(cast(SoupHSTSPolicy*)cPtr);
    return _retval;
  }
}
