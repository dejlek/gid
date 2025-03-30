/// C functions for soup3 library
module soup.c.functions;

public import gid.basictypes;
import gid.loader;
import soup.c.types;
public import gio.c.types;

version(Windows)
  private immutable LIBS = ["libsoup-3.0-0.dll;soup-3.0-0.dll;soup-3.dll"];
else version(OSX)
  private immutable LIBS = ["libsoup-3.0.0.dylib"];
else
  private immutable LIBS = ["libsoup-3.0.so.0"];

__gshared extern(C)
{
  // Auth
  GType function() c_soup_auth_get_type; ///
  SoupAuth* function(GType type, SoupMessage* msg, const(char)* authHeader) c_soup_auth_new; ///
  void function(SoupAuth* auth, const(char)* username, const(char)* password) c_soup_auth_authenticate; ///
  bool function(SoupAuth* auth) c_soup_auth_can_authenticate; ///
  void function(SoupAuth* auth) c_soup_auth_cancel; ///
  void function(SoupAuth* auth, GSList* space) c_soup_auth_free_protection_space; ///
  const(char)* function(SoupAuth* auth) c_soup_auth_get_authority; ///
  char* function(SoupAuth* auth, SoupMessage* msg) c_soup_auth_get_authorization; ///
  char* function(SoupAuth* auth) c_soup_auth_get_info; ///
  GSList* function(SoupAuth* auth, GUri* sourceUri) c_soup_auth_get_protection_space; ///
  const(char)* function(SoupAuth* auth) c_soup_auth_get_realm; ///
  const(char)* function(SoupAuth* auth) c_soup_auth_get_scheme_name; ///
  bool function(SoupAuth* auth) c_soup_auth_is_authenticated; ///
  bool function(SoupAuth* auth) c_soup_auth_is_cancelled; ///
  bool function(SoupAuth* auth) c_soup_auth_is_for_proxy; ///
  bool function(SoupAuth* auth, SoupMessage* msg) c_soup_auth_is_ready; ///
  bool function(SoupAuth* auth, SoupMessage* msg, const(char)* authHeader) c_soup_auth_update; ///

  // AuthBasic
  GType function() c_soup_auth_basic_get_type; ///

  // AuthDigest
  GType function() c_soup_auth_digest_get_type; ///

  // AuthDomain
  GType function() c_soup_auth_domain_get_type; ///
  char* function(SoupAuthDomain* domain, SoupServerMessage* msg) c_soup_auth_domain_accepts; ///
  void function(SoupAuthDomain* domain, const(char)* path) c_soup_auth_domain_add_path; ///
  void function(SoupAuthDomain* domain, SoupServerMessage* msg) c_soup_auth_domain_challenge; ///
  bool function(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, const(char)* password) c_soup_auth_domain_check_password; ///
  bool function(SoupAuthDomain* domain, SoupServerMessage* msg) c_soup_auth_domain_covers; ///
  const(char)* function(SoupAuthDomain* domain) c_soup_auth_domain_get_realm; ///
  void function(SoupAuthDomain* domain, const(char)* path) c_soup_auth_domain_remove_path; ///
  void function(SoupAuthDomain* domain, SoupAuthDomainFilter filter, void* filterData, GDestroyNotify dnotify) c_soup_auth_domain_set_filter; ///
  void function(SoupAuthDomain* domain, SoupAuthDomainGenericAuthCallback authCallback, void* authData, GDestroyNotify dnotify) c_soup_auth_domain_set_generic_auth_callback; ///

  // AuthDomainBasic
  GType function() c_soup_auth_domain_basic_get_type; ///
  SoupAuthDomain* function(const(char)* optname1,  ...) c_soup_auth_domain_basic_new; ///
  void function(SoupAuthDomain* domain, SoupAuthDomainBasicAuthCallback callback, void* userData, GDestroyNotify dnotify) c_soup_auth_domain_basic_set_auth_callback; ///

  // AuthDomainDigest
  GType function() c_soup_auth_domain_digest_get_type; ///
  SoupAuthDomain* function(const(char)* optname1,  ...) c_soup_auth_domain_digest_new; ///
  char* function(const(char)* username, const(char)* realm, const(char)* password) c_soup_auth_domain_digest_encode_password; ///
  void function(SoupAuthDomain* domain, SoupAuthDomainDigestAuthCallback callback, void* userData, GDestroyNotify dnotify) c_soup_auth_domain_digest_set_auth_callback; ///

  // AuthManager
  GType function() c_soup_auth_manager_get_type; ///
  void function(SoupAuthManager* manager) c_soup_auth_manager_clear_cached_credentials; ///
  void function(SoupAuthManager* manager, GUri* uri, SoupAuth* auth) c_soup_auth_manager_use_auth; ///

  // AuthNTLM
  GType function() c_soup_auth_ntlm_get_type; ///

  // AuthNegotiate
  GType function() c_soup_auth_negotiate_get_type; ///
  bool function() c_soup_auth_negotiate_supported; ///

  // Cache
  GType function() c_soup_cache_get_type; ///
  SoupCache* function(const(char)* cacheDir, SoupCacheType cacheType) c_soup_cache_new; ///
  void function(SoupCache* cache) c_soup_cache_clear; ///
  void function(SoupCache* cache) c_soup_cache_dump; ///
  void function(SoupCache* cache) c_soup_cache_flush; ///
  uint function(SoupCache* cache) c_soup_cache_get_max_size; ///
  void function(SoupCache* cache) c_soup_cache_load; ///
  void function(SoupCache* cache, uint maxSize) c_soup_cache_set_max_size; ///

  // ContentDecoder
  GType function() c_soup_content_decoder_get_type; ///

  // ContentSniffer
  GType function() c_soup_content_sniffer_get_type; ///
  SoupContentSniffer* function() c_soup_content_sniffer_new; ///
  char* function(SoupContentSniffer* sniffer, SoupMessage* msg, GBytes* buffer, GHashTable** params) c_soup_content_sniffer_sniff; ///

  // Cookie
  GType function() c_soup_cookie_get_type; ///
  SoupCookie* function(const(char)* name, const(char)* value, const(char)* domain, const(char)* path, int maxAge) c_soup_cookie_new; ///
  bool function(SoupCookie* cookie, GUri* uri) c_soup_cookie_applies_to_uri; ///
  SoupCookie* function(SoupCookie* cookie) c_soup_cookie_copy; ///
  bool function(SoupCookie* cookie, const(char)* host) c_soup_cookie_domain_matches; ///
  bool function(SoupCookie* cookie1, SoupCookie* cookie2) c_soup_cookie_equal; ///
  void function(SoupCookie* cookie) c_soup_cookie_free; ///
  const(char)* function(SoupCookie* cookie) c_soup_cookie_get_domain; ///
  GDateTime* function(SoupCookie* cookie) c_soup_cookie_get_expires; ///
  bool function(SoupCookie* cookie) c_soup_cookie_get_http_only; ///
  const(char)* function(SoupCookie* cookie) c_soup_cookie_get_name; ///
  const(char)* function(SoupCookie* cookie) c_soup_cookie_get_path; ///
  SoupSameSitePolicy function(SoupCookie* cookie) c_soup_cookie_get_same_site_policy; ///
  bool function(SoupCookie* cookie) c_soup_cookie_get_secure; ///
  const(char)* function(SoupCookie* cookie) c_soup_cookie_get_value; ///
  void function(SoupCookie* cookie, const(char)* domain) c_soup_cookie_set_domain; ///
  void function(SoupCookie* cookie, GDateTime* expires) c_soup_cookie_set_expires; ///
  void function(SoupCookie* cookie, bool httpOnly) c_soup_cookie_set_http_only; ///
  void function(SoupCookie* cookie, int maxAge) c_soup_cookie_set_max_age; ///
  void function(SoupCookie* cookie, const(char)* name) c_soup_cookie_set_name; ///
  void function(SoupCookie* cookie, const(char)* path) c_soup_cookie_set_path; ///
  void function(SoupCookie* cookie, SoupSameSitePolicy policy) c_soup_cookie_set_same_site_policy; ///
  void function(SoupCookie* cookie, bool secure) c_soup_cookie_set_secure; ///
  void function(SoupCookie* cookie, const(char)* value) c_soup_cookie_set_value; ///
  char* function(SoupCookie* cookie) c_soup_cookie_to_cookie_header; ///
  char* function(SoupCookie* cookie) c_soup_cookie_to_set_cookie_header; ///
  SoupCookie* function(const(char)* header, GUri* origin) c_soup_cookie_parse; ///

  // CookieJar
  GType function() c_soup_cookie_jar_get_type; ///
  SoupCookieJar* function() c_soup_cookie_jar_new; ///
  void function(SoupCookieJar* jar, SoupCookie* cookie) c_soup_cookie_jar_add_cookie; ///
  void function(SoupCookieJar* jar, SoupCookie* cookie, GUri* uri, GUri* firstParty) c_soup_cookie_jar_add_cookie_full; ///
  void function(SoupCookieJar* jar, GUri* firstParty, SoupCookie* cookie) c_soup_cookie_jar_add_cookie_with_first_party; ///
  GSList* function(SoupCookieJar* jar) c_soup_cookie_jar_all_cookies; ///
  void function(SoupCookieJar* jar, SoupCookie* cookie) c_soup_cookie_jar_delete_cookie; ///
  SoupCookieJarAcceptPolicy function(SoupCookieJar* jar) c_soup_cookie_jar_get_accept_policy; ///
  GSList* function(SoupCookieJar* jar, GUri* uri, bool forHttp) c_soup_cookie_jar_get_cookie_list; ///
  GSList* function(SoupCookieJar* jar, GUri* uri, GUri* topLevel, GUri* siteForCookies, bool forHttp, bool isSafeMethod, bool isTopLevelNavigation) c_soup_cookie_jar_get_cookie_list_with_same_site_info; ///
  char* function(SoupCookieJar* jar, GUri* uri, bool forHttp) c_soup_cookie_jar_get_cookies; ///
  bool function(SoupCookieJar* jar) c_soup_cookie_jar_is_persistent; ///
  void function(SoupCookieJar* jar, SoupCookieJarAcceptPolicy policy) c_soup_cookie_jar_set_accept_policy; ///
  void function(SoupCookieJar* jar, GUri* uri, const(char)* cookie) c_soup_cookie_jar_set_cookie; ///
  void function(SoupCookieJar* jar, GUri* uri, GUri* firstParty, const(char)* cookie) c_soup_cookie_jar_set_cookie_with_first_party; ///

  // CookieJarDB
  GType function() c_soup_cookie_jar_db_get_type; ///
  SoupCookieJar* function(const(char)* filename, bool readOnly) c_soup_cookie_jar_db_new; ///

  // CookieJarText
  GType function() c_soup_cookie_jar_text_get_type; ///
  SoupCookieJar* function(const(char)* filename, bool readOnly) c_soup_cookie_jar_text_new; ///

  // HSTSEnforcer
  GType function() c_soup_hsts_enforcer_get_type; ///
  SoupHSTSEnforcer* function() c_soup_hsts_enforcer_new; ///
  GList* function(SoupHSTSEnforcer* hstsEnforcer, bool sessionPolicies) c_soup_hsts_enforcer_get_domains; ///
  GList* function(SoupHSTSEnforcer* hstsEnforcer, bool sessionPolicies) c_soup_hsts_enforcer_get_policies; ///
  bool function(SoupHSTSEnforcer* hstsEnforcer, const(char)* domain) c_soup_hsts_enforcer_has_valid_policy; ///
  bool function(SoupHSTSEnforcer* hstsEnforcer) c_soup_hsts_enforcer_is_persistent; ///
  void function(SoupHSTSEnforcer* hstsEnforcer, SoupHSTSPolicy* policy) c_soup_hsts_enforcer_set_policy; ///
  void function(SoupHSTSEnforcer* hstsEnforcer, const(char)* domain, bool includeSubdomains) c_soup_hsts_enforcer_set_session_policy; ///

  // HSTSEnforcerDB
  GType function() c_soup_hsts_enforcer_db_get_type; ///
  SoupHSTSEnforcer* function(const(char)* filename) c_soup_hsts_enforcer_db_new; ///

  // HSTSPolicy
  GType function() c_soup_hsts_policy_get_type; ///
  SoupHSTSPolicy* function(const(char)* domain, gulong maxAge, bool includeSubdomains) c_soup_hsts_policy_new; ///
  SoupHSTSPolicy* function(SoupMessage* msg) c_soup_hsts_policy_new_from_response; ///
  SoupHSTSPolicy* function(const(char)* domain, gulong maxAge, GDateTime* expires, bool includeSubdomains) c_soup_hsts_policy_new_full; ///
  SoupHSTSPolicy* function(const(char)* domain, bool includeSubdomains) c_soup_hsts_policy_new_session_policy; ///
  SoupHSTSPolicy* function(SoupHSTSPolicy* policy) c_soup_hsts_policy_copy; ///
  bool function(SoupHSTSPolicy* policy1, SoupHSTSPolicy* policy2) c_soup_hsts_policy_equal; ///
  void function(SoupHSTSPolicy* policy) c_soup_hsts_policy_free; ///
  const(char)* function(SoupHSTSPolicy* policy) c_soup_hsts_policy_get_domain; ///
  GDateTime* function(SoupHSTSPolicy* policy) c_soup_hsts_policy_get_expires; ///
  gulong function(SoupHSTSPolicy* policy) c_soup_hsts_policy_get_max_age; ///
  bool function(SoupHSTSPolicy* policy) c_soup_hsts_policy_includes_subdomains; ///
  bool function(SoupHSTSPolicy* policy) c_soup_hsts_policy_is_expired; ///
  bool function(SoupHSTSPolicy* policy) c_soup_hsts_policy_is_session_policy; ///

  // Logger
  GType function() c_soup_logger_get_type; ///
  SoupLogger* function(SoupLoggerLogLevel level) c_soup_logger_new; ///
  int function(SoupLogger* logger) c_soup_logger_get_max_body_size; ///
  void function(SoupLogger* logger, int maxBodySize) c_soup_logger_set_max_body_size; ///
  void function(SoupLogger* logger, SoupLoggerPrinter printer, void* printerData, GDestroyNotify destroy) c_soup_logger_set_printer; ///
  void function(SoupLogger* logger, SoupLoggerFilter requestFilter, void* filterData, GDestroyNotify destroy) c_soup_logger_set_request_filter; ///
  void function(SoupLogger* logger, SoupLoggerFilter responseFilter, void* filterData, GDestroyNotify destroy) c_soup_logger_set_response_filter; ///

  // Message
  GType function() c_soup_message_get_type; ///
  SoupMessage* function(const(char)* method, const(char)* uriString) c_soup_message_new; ///
  SoupMessage* function(const(char)* method, const(char)* uriString, char* encodedForm) c_soup_message_new_from_encoded_form; ///
  SoupMessage* function(const(char)* uriString, SoupMultipart* multipart) c_soup_message_new_from_multipart; ///
  SoupMessage* function(const(char)* method, GUri* uri) c_soup_message_new_from_uri; ///
  SoupMessage* function(GUri* baseUri) c_soup_message_new_options_ping; ///
  void function(SoupMessage* msg, SoupMessageFlags flags) c_soup_message_add_flags; ///
  uint function(SoupMessage* msg, const(char)* signal, const(char)* header, GCallback callback, void* userData) c_soup_message_add_header_handler; ///
  uint function(SoupMessage* msg, const(char)* signal, uint statusCode, GCallback callback, void* userData) c_soup_message_add_status_code_handler; ///
  void function(SoupMessage* msg, GType featureType) c_soup_message_disable_feature; ///
  ulong function(SoupMessage* msg) c_soup_message_get_connection_id; ///
  GUri* function(SoupMessage* msg) c_soup_message_get_first_party; ///
  SoupMessageFlags function(SoupMessage* msg) c_soup_message_get_flags; ///
  bool function(SoupMessage* msg) c_soup_message_get_force_http1; ///
  SoupHTTPVersion function(SoupMessage* msg) c_soup_message_get_http_version; ///
  bool function(SoupMessage* msg) c_soup_message_get_is_options_ping; ///
  bool function(SoupMessage* msg) c_soup_message_get_is_top_level_navigation; ///
  const(char)* function(SoupMessage* msg) c_soup_message_get_method; ///
  SoupMessageMetrics* function(SoupMessage* msg) c_soup_message_get_metrics; ///
  SoupMessagePriority function(SoupMessage* msg) c_soup_message_get_priority; ///
  const(char)* function(SoupMessage* msg) c_soup_message_get_reason_phrase; ///
  GSocketAddress* function(SoupMessage* msg) c_soup_message_get_remote_address; ///
  SoupMessageHeaders* function(SoupMessage* msg) c_soup_message_get_request_headers; ///
  SoupMessageHeaders* function(SoupMessage* msg) c_soup_message_get_response_headers; ///
  GUri* function(SoupMessage* msg) c_soup_message_get_site_for_cookies; ///
  SoupStatus function(SoupMessage* msg) c_soup_message_get_status; ///
  const(char)* function(SoupMessage* msg) c_soup_message_get_tls_ciphersuite_name; ///
  GTlsCertificate* function(SoupMessage* msg) c_soup_message_get_tls_peer_certificate; ///
  GTlsCertificateFlags function(SoupMessage* msg) c_soup_message_get_tls_peer_certificate_errors; ///
  GTlsProtocolVersion function(SoupMessage* msg) c_soup_message_get_tls_protocol_version; ///
  GUri* function(SoupMessage* msg) c_soup_message_get_uri; ///
  bool function(SoupMessage* msg, GType featureType) c_soup_message_is_feature_disabled; ///
  bool function(SoupMessage* msg) c_soup_message_is_keepalive; ///
  bool function(SoupMessage* msg, SoupMessageFlags flags) c_soup_message_query_flags; ///
  void function(SoupMessage* msg, SoupMessageFlags flags) c_soup_message_remove_flags; ///
  void function(SoupMessage* msg, GUri* firstParty) c_soup_message_set_first_party; ///
  void function(SoupMessage* msg, SoupMessageFlags flags) c_soup_message_set_flags; ///
  void function(SoupMessage* msg, bool value) c_soup_message_set_force_http1; ///
  void function(SoupMessage* msg, bool isOptionsPing) c_soup_message_set_is_options_ping; ///
  void function(SoupMessage* msg, bool isTopLevelNavigation) c_soup_message_set_is_top_level_navigation; ///
  void function(SoupMessage* msg, const(char)* method) c_soup_message_set_method; ///
  void function(SoupMessage* msg, SoupMessagePriority priority) c_soup_message_set_priority; ///
  void function(SoupMessage* msg, const(char)* contentType, GInputStream* stream, ptrdiff_t contentLength) c_soup_message_set_request_body; ///
  void function(SoupMessage* msg, const(char)* contentType, GBytes* bytes) c_soup_message_set_request_body_from_bytes; ///
  void function(SoupMessage* msg, GUri* siteForCookies) c_soup_message_set_site_for_cookies; ///
  void function(SoupMessage* msg, GTlsCertificate* certificate) c_soup_message_set_tls_client_certificate; ///
  void function(SoupMessage* msg, GUri* uri) c_soup_message_set_uri; ///
  void function(SoupMessage* msg) c_soup_message_tls_client_certificate_password_request_complete; ///

  // MessageBody
  GType function() c_soup_message_body_get_type; ///
  SoupMessageBody* function() c_soup_message_body_new; ///
  void function(SoupMessageBody* body_, SoupMemoryUse use, const(void)* data, size_t length) c_soup_message_body_append; ///
  void function(SoupMessageBody* body_, GBytes* buffer) c_soup_message_body_append_bytes; ///
  void function(SoupMessageBody* body_, ubyte* data, size_t length) c_soup_message_body_append_take; ///
  void function(SoupMessageBody* body_) c_soup_message_body_complete; ///
  GBytes* function(SoupMessageBody* body_) c_soup_message_body_flatten; ///
  bool function(SoupMessageBody* body_) c_soup_message_body_get_accumulate; ///
  GBytes* function(SoupMessageBody* body_, long offset) c_soup_message_body_get_chunk; ///
  void function(SoupMessageBody* body_, GBytes* chunk) c_soup_message_body_got_chunk; ///
  SoupMessageBody* function(SoupMessageBody* body_) c_soup_message_body_ref; ///
  void function(SoupMessageBody* body_, bool accumulate) c_soup_message_body_set_accumulate; ///
  void function(SoupMessageBody* body_) c_soup_message_body_truncate; ///
  void function(SoupMessageBody* body_) c_soup_message_body_unref; ///
  void function(SoupMessageBody* body_, GBytes* chunk) c_soup_message_body_wrote_chunk; ///

  // MessageHeaders
  GType function() c_soup_message_headers_get_type; ///
  SoupMessageHeaders* function(SoupMessageHeadersType type) c_soup_message_headers_new; ///
  void function(SoupMessageHeaders* hdrs, const(char)* name, const(char)* value) c_soup_message_headers_append; ///
  void function(SoupMessageHeaders* hdrs) c_soup_message_headers_clean_connection_headers; ///
  void function(SoupMessageHeaders* hdrs) c_soup_message_headers_clear; ///
  void function(SoupMessageHeaders* hdrs, SoupMessageHeadersForeachFunc func, void* userData) c_soup_message_headers_foreach; ///
  void function(SoupMessageHeaders* hdrs, SoupRange* ranges) c_soup_message_headers_free_ranges; ///
  bool function(SoupMessageHeaders* hdrs, char** disposition, GHashTable** params) c_soup_message_headers_get_content_disposition; ///
  long function(SoupMessageHeaders* hdrs) c_soup_message_headers_get_content_length; ///
  bool function(SoupMessageHeaders* hdrs, long* start, long* end, long* totalLength) c_soup_message_headers_get_content_range; ///
  const(char)* function(SoupMessageHeaders* hdrs, GHashTable** params) c_soup_message_headers_get_content_type; ///
  SoupEncoding function(SoupMessageHeaders* hdrs) c_soup_message_headers_get_encoding; ///
  SoupExpectation function(SoupMessageHeaders* hdrs) c_soup_message_headers_get_expectations; ///
  SoupMessageHeadersType function(SoupMessageHeaders* hdrs) c_soup_message_headers_get_headers_type; ///
  const(char)* function(SoupMessageHeaders* hdrs, const(char)* name) c_soup_message_headers_get_list; ///
  const(char)* function(SoupMessageHeaders* hdrs, const(char)* name) c_soup_message_headers_get_one; ///
  bool function(SoupMessageHeaders* hdrs, long totalLength, SoupRange** ranges, int* length) c_soup_message_headers_get_ranges; ///
  bool function(SoupMessageHeaders* hdrs, const(char)* name, const(char)* token) c_soup_message_headers_header_contains; ///
  bool function(SoupMessageHeaders* hdrs, const(char)* name, const(char)* value) c_soup_message_headers_header_equals; ///
  SoupMessageHeaders* function(SoupMessageHeaders* hdrs) c_soup_message_headers_ref; ///
  void function(SoupMessageHeaders* hdrs, const(char)* name) c_soup_message_headers_remove; ///
  void function(SoupMessageHeaders* hdrs, const(char)* name, const(char)* value) c_soup_message_headers_replace; ///
  void function(SoupMessageHeaders* hdrs, const(char)* disposition, GHashTable* params) c_soup_message_headers_set_content_disposition; ///
  void function(SoupMessageHeaders* hdrs, long contentLength) c_soup_message_headers_set_content_length; ///
  void function(SoupMessageHeaders* hdrs, long start, long end, long totalLength) c_soup_message_headers_set_content_range; ///
  void function(SoupMessageHeaders* hdrs, const(char)* contentType, GHashTable* params) c_soup_message_headers_set_content_type; ///
  void function(SoupMessageHeaders* hdrs, SoupEncoding encoding) c_soup_message_headers_set_encoding; ///
  void function(SoupMessageHeaders* hdrs, SoupExpectation expectations) c_soup_message_headers_set_expectations; ///
  void function(SoupMessageHeaders* hdrs, long start, long end) c_soup_message_headers_set_range; ///
  void function(SoupMessageHeaders* hdrs, SoupRange* ranges, int length) c_soup_message_headers_set_ranges; ///
  void function(SoupMessageHeaders* hdrs) c_soup_message_headers_unref; ///

  // MessageHeadersIter
  bool function(SoupMessageHeadersIter* iter, const(char*)* name, const(char*)* value) c_soup_message_headers_iter_next; ///
  void function(SoupMessageHeadersIter* iter, SoupMessageHeaders* hdrs) c_soup_message_headers_iter_init; ///

  // MessageMetrics
  GType function() c_soup_message_metrics_get_type; ///
  SoupMessageMetrics* function(SoupMessageMetrics* metrics) c_soup_message_metrics_copy; ///
  void function(SoupMessageMetrics* metrics) c_soup_message_metrics_free; ///
  ulong function(SoupMessageMetrics* metrics) c_soup_message_metrics_get_connect_end; ///
  ulong function(SoupMessageMetrics* metrics) c_soup_message_metrics_get_connect_start; ///
  ulong function(SoupMessageMetrics* metrics) c_soup_message_metrics_get_dns_end; ///
  ulong function(SoupMessageMetrics* metrics) c_soup_message_metrics_get_dns_start; ///
  ulong function(SoupMessageMetrics* metrics) c_soup_message_metrics_get_fetch_start; ///
  ulong function(SoupMessageMetrics* metrics) c_soup_message_metrics_get_request_body_bytes_sent; ///
  ulong function(SoupMessageMetrics* metrics) c_soup_message_metrics_get_request_body_size; ///
  ulong function(SoupMessageMetrics* metrics) c_soup_message_metrics_get_request_header_bytes_sent; ///
  ulong function(SoupMessageMetrics* metrics) c_soup_message_metrics_get_request_start; ///
  ulong function(SoupMessageMetrics* metrics) c_soup_message_metrics_get_response_body_bytes_received; ///
  ulong function(SoupMessageMetrics* metrics) c_soup_message_metrics_get_response_body_size; ///
  ulong function(SoupMessageMetrics* metrics) c_soup_message_metrics_get_response_end; ///
  ulong function(SoupMessageMetrics* metrics) c_soup_message_metrics_get_response_header_bytes_received; ///
  ulong function(SoupMessageMetrics* metrics) c_soup_message_metrics_get_response_start; ///
  ulong function(SoupMessageMetrics* metrics) c_soup_message_metrics_get_tls_start; ///

  // Multipart
  GType function() c_soup_multipart_get_type; ///
  SoupMultipart* function(const(char)* mimeType) c_soup_multipart_new; ///
  SoupMultipart* function(SoupMessageHeaders* headers, GBytes* body_) c_soup_multipart_new_from_message; ///
  void function(SoupMultipart* multipart, const(char)* controlName, const(char)* filename, const(char)* contentType, GBytes* body_) c_soup_multipart_append_form_file; ///
  void function(SoupMultipart* multipart, const(char)* controlName, const(char)* data) c_soup_multipart_append_form_string; ///
  void function(SoupMultipart* multipart, SoupMessageHeaders* headers, GBytes* body_) c_soup_multipart_append_part; ///
  void function(SoupMultipart* multipart) c_soup_multipart_free; ///
  int function(SoupMultipart* multipart) c_soup_multipart_get_length; ///
  bool function(SoupMultipart* multipart, int part, SoupMessageHeaders** headers, GBytes** body_) c_soup_multipart_get_part; ///
  void function(SoupMultipart* multipart, SoupMessageHeaders* destHeaders, GBytes** destBody) c_soup_multipart_to_message; ///

  // MultipartInputStream
  GType function() c_soup_multipart_input_stream_get_type; ///
  SoupMultipartInputStream* function(SoupMessage* msg, GInputStream* baseStream) c_soup_multipart_input_stream_new; ///
  SoupMessageHeaders* function(SoupMultipartInputStream* multipart) c_soup_multipart_input_stream_get_headers; ///
  GInputStream* function(SoupMultipartInputStream* multipart, GCancellable* cancellable, GError** _err) c_soup_multipart_input_stream_next_part; ///
  void function(SoupMultipartInputStream* multipart, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* data) c_soup_multipart_input_stream_next_part_async; ///
  GInputStream* function(SoupMultipartInputStream* multipart, GAsyncResult* result, GError** _err) c_soup_multipart_input_stream_next_part_finish; ///

  // Server
  GType function() c_soup_server_get_type; ///
  SoupServer* function(const(char)* optname1,  ...) c_soup_server_new; ///
  bool function(SoupServer* server, GIOStream* stream, GSocketAddress* localAddr, GSocketAddress* remoteAddr, GError** _err) c_soup_server_accept_iostream; ///
  void function(SoupServer* server, SoupAuthDomain* authDomain) c_soup_server_add_auth_domain; ///
  void function(SoupServer* server, const(char)* path, SoupServerCallback callback, void* userData, GDestroyNotify destroy) c_soup_server_add_early_handler; ///
  void function(SoupServer* server, const(char)* path, SoupServerCallback callback, void* userData, GDestroyNotify destroy) c_soup_server_add_handler; ///
  void function(SoupServer* server, GType extensionType) c_soup_server_add_websocket_extension; ///
  void function(SoupServer* server, const(char)* path, const(char)* origin, char** protocols, SoupServerWebsocketCallback callback, void* userData, GDestroyNotify destroy) c_soup_server_add_websocket_handler; ///
  void function(SoupServer* server) c_soup_server_disconnect; ///
  GSList* function(SoupServer* server) c_soup_server_get_listeners; ///
  GTlsAuthenticationMode function(SoupServer* server) c_soup_server_get_tls_auth_mode; ///
  GTlsCertificate* function(SoupServer* server) c_soup_server_get_tls_certificate; ///
  GTlsDatabase* function(SoupServer* server) c_soup_server_get_tls_database; ///
  GSList* function(SoupServer* server) c_soup_server_get_uris; ///
  bool function(SoupServer* server) c_soup_server_is_https; ///
  bool function(SoupServer* server, GSocketAddress* address, SoupServerListenOptions options, GError** _err) c_soup_server_listen; ///
  bool function(SoupServer* server, uint port, SoupServerListenOptions options, GError** _err) c_soup_server_listen_all; ///
  bool function(SoupServer* server, uint port, SoupServerListenOptions options, GError** _err) c_soup_server_listen_local; ///
  bool function(SoupServer* server, GSocket* socket, SoupServerListenOptions options, GError** _err) c_soup_server_listen_socket; ///
  void function(SoupServer* server, SoupServerMessage* msg) c_soup_server_pause_message; ///
  void function(SoupServer* server, SoupAuthDomain* authDomain) c_soup_server_remove_auth_domain; ///
  void function(SoupServer* server, const(char)* path) c_soup_server_remove_handler; ///
  void function(SoupServer* server, GType extensionType) c_soup_server_remove_websocket_extension; ///
  void function(SoupServer* server, GTlsAuthenticationMode mode) c_soup_server_set_tls_auth_mode; ///
  void function(SoupServer* server, GTlsCertificate* certificate) c_soup_server_set_tls_certificate; ///
  void function(SoupServer* server, GTlsDatabase* tlsDatabase) c_soup_server_set_tls_database; ///
  void function(SoupServer* server, SoupServerMessage* msg) c_soup_server_unpause_message; ///

  // ServerMessage
  GType function() c_soup_server_message_get_type; ///
  SoupHTTPVersion function(SoupServerMessage* msg) c_soup_server_message_get_http_version; ///
  GSocketAddress* function(SoupServerMessage* msg) c_soup_server_message_get_local_address; ///
  const(char)* function(SoupServerMessage* msg) c_soup_server_message_get_method; ///
  const(char)* function(SoupServerMessage* msg) c_soup_server_message_get_reason_phrase; ///
  GSocketAddress* function(SoupServerMessage* msg) c_soup_server_message_get_remote_address; ///
  const(char)* function(SoupServerMessage* msg) c_soup_server_message_get_remote_host; ///
  SoupMessageBody* function(SoupServerMessage* msg) c_soup_server_message_get_request_body; ///
  SoupMessageHeaders* function(SoupServerMessage* msg) c_soup_server_message_get_request_headers; ///
  SoupMessageBody* function(SoupServerMessage* msg) c_soup_server_message_get_response_body; ///
  SoupMessageHeaders* function(SoupServerMessage* msg) c_soup_server_message_get_response_headers; ///
  GSocket* function(SoupServerMessage* msg) c_soup_server_message_get_socket; ///
  uint function(SoupServerMessage* msg) c_soup_server_message_get_status; ///
  GTlsCertificate* function(SoupServerMessage* msg) c_soup_server_message_get_tls_peer_certificate; ///
  GTlsCertificateFlags function(SoupServerMessage* msg) c_soup_server_message_get_tls_peer_certificate_errors; ///
  GUri* function(SoupServerMessage* msg) c_soup_server_message_get_uri; ///
  bool function(SoupServerMessage* msg) c_soup_server_message_is_options_ping; ///
  void function(SoupServerMessage* msg) c_soup_server_message_pause; ///
  void function(SoupServerMessage* msg, SoupHTTPVersion version_) c_soup_server_message_set_http_version; ///
  void function(SoupServerMessage* msg, uint statusCode, const(char)* redirectUri) c_soup_server_message_set_redirect; ///
  void function(SoupServerMessage* msg, const(char)* contentType, SoupMemoryUse respUse, const(ubyte)* respBody, size_t respLength) c_soup_server_message_set_response; ///
  void function(SoupServerMessage* msg, uint statusCode, const(char)* reasonPhrase) c_soup_server_message_set_status; ///
  GIOStream* function(SoupServerMessage* msg) c_soup_server_message_steal_connection; ///
  void function(SoupServerMessage* msg) c_soup_server_message_unpause; ///

  // Session
  GType function() c_soup_session_get_type; ///
  SoupSession* function() c_soup_session_new; ///
  SoupSession* function(const(char)* optname1,  ...) c_soup_session_new_with_options; ///
  void function(SoupSession* session) c_soup_session_abort; ///
  void function(SoupSession* session, SoupSessionFeature* feature) c_soup_session_add_feature; ///
  void function(SoupSession* session, GType featureType) c_soup_session_add_feature_by_type; ///
  const(char)* function(SoupSession* session) c_soup_session_get_accept_language; ///
  bool function(SoupSession* session) c_soup_session_get_accept_language_auto; ///
  SoupMessage* function(SoupSession* session, GAsyncResult* result) c_soup_session_get_async_result_message; ///
  SoupSessionFeature* function(SoupSession* session, GType featureType) c_soup_session_get_feature; ///
  SoupSessionFeature* function(SoupSession* session, GType featureType, SoupMessage* msg) c_soup_session_get_feature_for_message; ///
  uint function(SoupSession* session) c_soup_session_get_idle_timeout; ///
  GInetSocketAddress* function(SoupSession* session) c_soup_session_get_local_address; ///
  uint function(SoupSession* session) c_soup_session_get_max_conns; ///
  uint function(SoupSession* session) c_soup_session_get_max_conns_per_host; ///
  GProxyResolver* function(SoupSession* session) c_soup_session_get_proxy_resolver; ///
  GSocketConnectable* function(SoupSession* session) c_soup_session_get_remote_connectable; ///
  uint function(SoupSession* session) c_soup_session_get_timeout; ///
  GTlsDatabase* function(SoupSession* session) c_soup_session_get_tls_database; ///
  GTlsInteraction* function(SoupSession* session) c_soup_session_get_tls_interaction; ///
  const(char)* function(SoupSession* session) c_soup_session_get_user_agent; ///
  bool function(SoupSession* session, GType featureType) c_soup_session_has_feature; ///
  void function(SoupSession* session, SoupMessage* msg, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_soup_session_preconnect_async; ///
  bool function(SoupSession* session, GAsyncResult* result, GError** _err) c_soup_session_preconnect_finish; ///
  void function(SoupSession* session, SoupSessionFeature* feature) c_soup_session_remove_feature; ///
  void function(SoupSession* session, GType featureType) c_soup_session_remove_feature_by_type; ///
  GInputStream* function(SoupSession* session, SoupMessage* msg, GCancellable* cancellable, GError** _err) c_soup_session_send; ///
  GBytes* function(SoupSession* session, SoupMessage* msg, GCancellable* cancellable, GError** _err) c_soup_session_send_and_read; ///
  void function(SoupSession* session, SoupMessage* msg, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_soup_session_send_and_read_async; ///
  GBytes* function(SoupSession* session, GAsyncResult* result, GError** _err) c_soup_session_send_and_read_finish; ///
  ptrdiff_t function(SoupSession* session, SoupMessage* msg, GOutputStream* outStream, GOutputStreamSpliceFlags flags, GCancellable* cancellable, GError** _err) c_soup_session_send_and_splice; ///
  void function(SoupSession* session, SoupMessage* msg, GOutputStream* outStream, GOutputStreamSpliceFlags flags, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_soup_session_send_and_splice_async; ///
  ptrdiff_t function(SoupSession* session, GAsyncResult* result, GError** _err) c_soup_session_send_and_splice_finish; ///
  void function(SoupSession* session, SoupMessage* msg, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_soup_session_send_async; ///
  GInputStream* function(SoupSession* session, GAsyncResult* result, GError** _err) c_soup_session_send_finish; ///
  void function(SoupSession* session, const(char)* acceptLanguage) c_soup_session_set_accept_language; ///
  void function(SoupSession* session, bool acceptLanguageAuto) c_soup_session_set_accept_language_auto; ///
  void function(SoupSession* session, uint timeout) c_soup_session_set_idle_timeout; ///
  void function(SoupSession* session, GProxyResolver* proxyResolver) c_soup_session_set_proxy_resolver; ///
  void function(SoupSession* session, uint timeout) c_soup_session_set_timeout; ///
  void function(SoupSession* session, GTlsDatabase* tlsDatabase) c_soup_session_set_tls_database; ///
  void function(SoupSession* session, GTlsInteraction* tlsInteraction) c_soup_session_set_tls_interaction; ///
  void function(SoupSession* session, const(char)* userAgent) c_soup_session_set_user_agent; ///
  void function(SoupSession* session, SoupMessage* msg, const(char)* origin, char** protocols, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_soup_session_websocket_connect_async; ///
  SoupWebsocketConnection* function(SoupSession* session, GAsyncResult* result, GError** _err) c_soup_session_websocket_connect_finish; ///

  // SessionFeature
  GType function() c_soup_session_feature_get_type; ///

  // WebsocketConnection
  GType function() c_soup_websocket_connection_get_type; ///
  SoupWebsocketConnection* function(GIOStream* stream, GUri* uri, SoupWebsocketConnectionType type, const(char)* origin, const(char)* protocol, GList* extensions) c_soup_websocket_connection_new; ///
  void function(SoupWebsocketConnection* self, ushort code, const(char)* data) c_soup_websocket_connection_close; ///
  ushort function(SoupWebsocketConnection* self) c_soup_websocket_connection_get_close_code; ///
  const(char)* function(SoupWebsocketConnection* self) c_soup_websocket_connection_get_close_data; ///
  SoupWebsocketConnectionType function(SoupWebsocketConnection* self) c_soup_websocket_connection_get_connection_type; ///
  GList* function(SoupWebsocketConnection* self) c_soup_websocket_connection_get_extensions; ///
  GIOStream* function(SoupWebsocketConnection* self) c_soup_websocket_connection_get_io_stream; ///
  uint function(SoupWebsocketConnection* self) c_soup_websocket_connection_get_keepalive_interval; ///
  ulong function(SoupWebsocketConnection* self) c_soup_websocket_connection_get_max_incoming_payload_size; ///
  const(char)* function(SoupWebsocketConnection* self) c_soup_websocket_connection_get_origin; ///
  const(char)* function(SoupWebsocketConnection* self) c_soup_websocket_connection_get_protocol; ///
  SoupWebsocketState function(SoupWebsocketConnection* self) c_soup_websocket_connection_get_state; ///
  GUri* function(SoupWebsocketConnection* self) c_soup_websocket_connection_get_uri; ///
  void function(SoupWebsocketConnection* self, const(void)* data, size_t length) c_soup_websocket_connection_send_binary; ///
  void function(SoupWebsocketConnection* self, SoupWebsocketDataType type, GBytes* message) c_soup_websocket_connection_send_message; ///
  void function(SoupWebsocketConnection* self, const(char)* text) c_soup_websocket_connection_send_text; ///
  void function(SoupWebsocketConnection* self, uint interval) c_soup_websocket_connection_set_keepalive_interval; ///
  void function(SoupWebsocketConnection* self, ulong maxIncomingPayloadSize) c_soup_websocket_connection_set_max_incoming_payload_size; ///

  // WebsocketExtension
  GType function() c_soup_websocket_extension_get_type; ///
  bool function(SoupWebsocketExtension* extension, SoupWebsocketConnectionType connectionType, GHashTable* params, GError** _err) c_soup_websocket_extension_configure; ///
  char* function(SoupWebsocketExtension* extension) c_soup_websocket_extension_get_request_params; ///
  char* function(SoupWebsocketExtension* extension) c_soup_websocket_extension_get_response_params; ///
  GBytes* function(SoupWebsocketExtension* extension, ubyte* header, GBytes* payload, GError** _err) c_soup_websocket_extension_process_incoming_message; ///
  GBytes* function(SoupWebsocketExtension* extension, ubyte* header, GBytes* payload, GError** _err) c_soup_websocket_extension_process_outgoing_message; ///

  // WebsocketExtensionDeflate
  GType function() c_soup_websocket_extension_deflate_get_type; ///

  // WebsocketExtensionManager
  GType function() c_soup_websocket_extension_manager_get_type; ///

  // global
  bool function(uint major, uint minor, uint micro) c_soup_check_version; ///
  void function(GSList* cookies) c_soup_cookies_free; ///
  GSList* function(SoupMessage* msg) c_soup_cookies_from_request; ///
  GSList* function(SoupMessage* msg) c_soup_cookies_from_response; ///
  char* function(GSList* cookies) c_soup_cookies_to_cookie_header; ///
  void function(GSList* cookies, SoupMessage* msg) c_soup_cookies_to_request; ///
  void function(GSList* cookies, SoupMessage* msg) c_soup_cookies_to_response; ///
  GDateTime* function(const(char)* dateString) c_soup_date_time_new_from_http_string; ///
  char* function(GDateTime* date, SoupDateFormat format) c_soup_date_time_to_string; ///
  GHashTable* function(const(char)* encodedForm) c_soup_form_decode; ///
  GHashTable* function(SoupMultipart* multipart, const(char)* fileControlName, char** filename, char** contentType, GBytes** file) c_soup_form_decode_multipart; ///
  char* function(const(char)* firstField,  ...) c_soup_form_encode; ///
  char* function(GData** formDataSet) c_soup_form_encode_datalist; ///
  char* function(GHashTable* formDataSet) c_soup_form_encode_hash; ///
  char* function(const(char)* firstField, void* args) c_soup_form_encode_valist; ///
  uint function() c_soup_get_major_version; ///
  uint function() c_soup_get_micro_version; ///
  uint function() c_soup_get_minor_version; ///
  bool function(const(char)* header, const(char)* token) c_soup_header_contains; ///
  void function(GSList* list) c_soup_header_free_list; ///
  void function(GHashTable* paramList) c_soup_header_free_param_list; ///
  void function(GString* string_, const(char)* name, const(char)* value) c_soup_header_g_string_append_param; ///
  void function(GString* string_, const(char)* name, const(char)* value) c_soup_header_g_string_append_param_quoted; ///
  GSList* function(const(char)* header) c_soup_header_parse_list; ///
  GHashTable* function(const(char)* header) c_soup_header_parse_param_list; ///
  GHashTable* function(const(char)* header) c_soup_header_parse_param_list_strict; ///
  GSList* function(const(char)* header, GSList** unacceptable) c_soup_header_parse_quality_list; ///
  GHashTable* function(const(char)* header) c_soup_header_parse_semi_param_list; ///
  GHashTable* function(const(char)* header) c_soup_header_parse_semi_param_list_strict; ///
  bool function(const(char)* str, int len, SoupMessageHeaders* dest) c_soup_headers_parse; ///
  uint function(const(char)* str, int len, SoupMessageHeaders* reqHeaders, char** reqMethod, char** reqPath, SoupHTTPVersion* ver) c_soup_headers_parse_request; ///
  bool function(const(char)* str, int len, SoupMessageHeaders* headers, SoupHTTPVersion* ver, uint* statusCode, char** reasonPhrase) c_soup_headers_parse_response; ///
  bool function(const(char)* statusLine, SoupHTTPVersion* ver, uint* statusCode, char** reasonPhrase) c_soup_headers_parse_status_line; ///
  bool function(const(char)* domain) c_soup_tld_domain_is_public_suffix; ///
  const(char)* function(const(char)* hostname, GError** _err) c_soup_tld_get_base_domain; ///
  GUri* function(GUri* uri, SoupURIComponent firstComponent,  ...) c_soup_uri_copy; ///
  GBytes* function(const(char)* uri, char** contentType) c_soup_uri_decode_data_uri; ///
  bool function(GUri* uri1, GUri* uri2) c_soup_uri_equal; ///
  void function(SoupMessage* msg, const(char)* origin, char** protocols, GPtrArray* supportedExtensions) c_soup_websocket_client_prepare_handshake; ///
  bool function(SoupMessage* msg, GPtrArray* supportedExtensions, GList** acceptedExtensions, GError** _err) c_soup_websocket_client_verify_handshake; ///
  bool function(SoupServerMessage* msg, const(char)* origin, char** protocols, GPtrArray* supportedExtensions, GError** _err) c_soup_websocket_server_check_handshake; ///
  bool function(SoupServerMessage* msg, const(char)* expectedOrigin, char** protocols, GPtrArray* supportedExtensions, GList** acceptedExtensions) c_soup_websocket_server_process_handshake; ///
}

// Auth

/** */
alias soup_auth_get_type = c_soup_auth_get_type;

/** */
alias soup_auth_new = c_soup_auth_new;

/** */
alias soup_auth_authenticate = c_soup_auth_authenticate;

/** */
alias soup_auth_can_authenticate = c_soup_auth_can_authenticate;

/** */
alias soup_auth_cancel = c_soup_auth_cancel;

/** */
alias soup_auth_free_protection_space = c_soup_auth_free_protection_space;

/** */
alias soup_auth_get_authority = c_soup_auth_get_authority;

/** */
alias soup_auth_get_authorization = c_soup_auth_get_authorization;

/** */
alias soup_auth_get_info = c_soup_auth_get_info;

/** */
alias soup_auth_get_protection_space = c_soup_auth_get_protection_space;

/** */
alias soup_auth_get_realm = c_soup_auth_get_realm;

/** */
alias soup_auth_get_scheme_name = c_soup_auth_get_scheme_name;

/** */
alias soup_auth_is_authenticated = c_soup_auth_is_authenticated;

/** */
alias soup_auth_is_cancelled = c_soup_auth_is_cancelled;

/** */
alias soup_auth_is_for_proxy = c_soup_auth_is_for_proxy;

/** */
alias soup_auth_is_ready = c_soup_auth_is_ready;

/** */
alias soup_auth_update = c_soup_auth_update;

// AuthBasic

/** */
alias soup_auth_basic_get_type = c_soup_auth_basic_get_type;

// AuthDigest

/** */
alias soup_auth_digest_get_type = c_soup_auth_digest_get_type;

// AuthDomain

/** */
alias soup_auth_domain_get_type = c_soup_auth_domain_get_type;

/** */
alias soup_auth_domain_accepts = c_soup_auth_domain_accepts;

/** */
alias soup_auth_domain_add_path = c_soup_auth_domain_add_path;

/** */
alias soup_auth_domain_challenge = c_soup_auth_domain_challenge;

/** */
alias soup_auth_domain_check_password = c_soup_auth_domain_check_password;

/** */
alias soup_auth_domain_covers = c_soup_auth_domain_covers;

/** */
alias soup_auth_domain_get_realm = c_soup_auth_domain_get_realm;

/** */
alias soup_auth_domain_remove_path = c_soup_auth_domain_remove_path;

/** */
alias soup_auth_domain_set_filter = c_soup_auth_domain_set_filter;

/** */
alias soup_auth_domain_set_generic_auth_callback = c_soup_auth_domain_set_generic_auth_callback;

// AuthDomainBasic

/** */
alias soup_auth_domain_basic_get_type = c_soup_auth_domain_basic_get_type;

/** */
alias soup_auth_domain_basic_new = c_soup_auth_domain_basic_new;

/** */
alias soup_auth_domain_basic_set_auth_callback = c_soup_auth_domain_basic_set_auth_callback;

// AuthDomainDigest

/** */
alias soup_auth_domain_digest_get_type = c_soup_auth_domain_digest_get_type;

/** */
alias soup_auth_domain_digest_new = c_soup_auth_domain_digest_new;

/** */
alias soup_auth_domain_digest_encode_password = c_soup_auth_domain_digest_encode_password;

/** */
alias soup_auth_domain_digest_set_auth_callback = c_soup_auth_domain_digest_set_auth_callback;

// AuthManager

/** */
alias soup_auth_manager_get_type = c_soup_auth_manager_get_type;

/** */
alias soup_auth_manager_clear_cached_credentials = c_soup_auth_manager_clear_cached_credentials;

/** */
alias soup_auth_manager_use_auth = c_soup_auth_manager_use_auth;

// AuthNTLM

/** */
alias soup_auth_ntlm_get_type = c_soup_auth_ntlm_get_type;

// AuthNegotiate

/** */
alias soup_auth_negotiate_get_type = c_soup_auth_negotiate_get_type;

/** */
alias soup_auth_negotiate_supported = c_soup_auth_negotiate_supported;

// Cache

/** */
alias soup_cache_get_type = c_soup_cache_get_type;

/** */
alias soup_cache_new = c_soup_cache_new;

/** */
alias soup_cache_clear = c_soup_cache_clear;

/** */
alias soup_cache_dump = c_soup_cache_dump;

/** */
alias soup_cache_flush = c_soup_cache_flush;

/** */
alias soup_cache_get_max_size = c_soup_cache_get_max_size;

/** */
alias soup_cache_load = c_soup_cache_load;

/** */
alias soup_cache_set_max_size = c_soup_cache_set_max_size;

// ContentDecoder

/** */
alias soup_content_decoder_get_type = c_soup_content_decoder_get_type;

// ContentSniffer

/** */
alias soup_content_sniffer_get_type = c_soup_content_sniffer_get_type;

/** */
alias soup_content_sniffer_new = c_soup_content_sniffer_new;

/** */
alias soup_content_sniffer_sniff = c_soup_content_sniffer_sniff;

// Cookie

/** */
alias soup_cookie_get_type = c_soup_cookie_get_type;

/** */
alias soup_cookie_new = c_soup_cookie_new;

/** */
alias soup_cookie_applies_to_uri = c_soup_cookie_applies_to_uri;

/** */
alias soup_cookie_copy = c_soup_cookie_copy;

/** */
alias soup_cookie_domain_matches = c_soup_cookie_domain_matches;

/** */
alias soup_cookie_equal = c_soup_cookie_equal;

/** */
alias soup_cookie_free = c_soup_cookie_free;

/** */
alias soup_cookie_get_domain = c_soup_cookie_get_domain;

/** */
alias soup_cookie_get_expires = c_soup_cookie_get_expires;

/** */
alias soup_cookie_get_http_only = c_soup_cookie_get_http_only;

/** */
alias soup_cookie_get_name = c_soup_cookie_get_name;

/** */
alias soup_cookie_get_path = c_soup_cookie_get_path;

/** */
alias soup_cookie_get_same_site_policy = c_soup_cookie_get_same_site_policy;

/** */
alias soup_cookie_get_secure = c_soup_cookie_get_secure;

/** */
alias soup_cookie_get_value = c_soup_cookie_get_value;

/** */
alias soup_cookie_set_domain = c_soup_cookie_set_domain;

/** */
alias soup_cookie_set_expires = c_soup_cookie_set_expires;

/** */
alias soup_cookie_set_http_only = c_soup_cookie_set_http_only;

/** */
alias soup_cookie_set_max_age = c_soup_cookie_set_max_age;

/** */
alias soup_cookie_set_name = c_soup_cookie_set_name;

/** */
alias soup_cookie_set_path = c_soup_cookie_set_path;

/** */
alias soup_cookie_set_same_site_policy = c_soup_cookie_set_same_site_policy;

/** */
alias soup_cookie_set_secure = c_soup_cookie_set_secure;

/** */
alias soup_cookie_set_value = c_soup_cookie_set_value;

/** */
alias soup_cookie_to_cookie_header = c_soup_cookie_to_cookie_header;

/** */
alias soup_cookie_to_set_cookie_header = c_soup_cookie_to_set_cookie_header;

/** */
alias soup_cookie_parse = c_soup_cookie_parse;

// CookieJar

/** */
alias soup_cookie_jar_get_type = c_soup_cookie_jar_get_type;

/** */
alias soup_cookie_jar_new = c_soup_cookie_jar_new;

/** */
alias soup_cookie_jar_add_cookie = c_soup_cookie_jar_add_cookie;

/** */
alias soup_cookie_jar_add_cookie_full = c_soup_cookie_jar_add_cookie_full;

/** */
alias soup_cookie_jar_add_cookie_with_first_party = c_soup_cookie_jar_add_cookie_with_first_party;

/** */
alias soup_cookie_jar_all_cookies = c_soup_cookie_jar_all_cookies;

/** */
alias soup_cookie_jar_delete_cookie = c_soup_cookie_jar_delete_cookie;

/** */
alias soup_cookie_jar_get_accept_policy = c_soup_cookie_jar_get_accept_policy;

/** */
alias soup_cookie_jar_get_cookie_list = c_soup_cookie_jar_get_cookie_list;

/** */
alias soup_cookie_jar_get_cookie_list_with_same_site_info = c_soup_cookie_jar_get_cookie_list_with_same_site_info;

/** */
alias soup_cookie_jar_get_cookies = c_soup_cookie_jar_get_cookies;

/** */
alias soup_cookie_jar_is_persistent = c_soup_cookie_jar_is_persistent;

/** */
alias soup_cookie_jar_set_accept_policy = c_soup_cookie_jar_set_accept_policy;

/** */
alias soup_cookie_jar_set_cookie = c_soup_cookie_jar_set_cookie;

/** */
alias soup_cookie_jar_set_cookie_with_first_party = c_soup_cookie_jar_set_cookie_with_first_party;

// CookieJarDB

/** */
alias soup_cookie_jar_db_get_type = c_soup_cookie_jar_db_get_type;

/** */
alias soup_cookie_jar_db_new = c_soup_cookie_jar_db_new;

// CookieJarText

/** */
alias soup_cookie_jar_text_get_type = c_soup_cookie_jar_text_get_type;

/** */
alias soup_cookie_jar_text_new = c_soup_cookie_jar_text_new;

// HSTSEnforcer

/** */
alias soup_hsts_enforcer_get_type = c_soup_hsts_enforcer_get_type;

/** */
alias soup_hsts_enforcer_new = c_soup_hsts_enforcer_new;

/** */
alias soup_hsts_enforcer_get_domains = c_soup_hsts_enforcer_get_domains;

/** */
alias soup_hsts_enforcer_get_policies = c_soup_hsts_enforcer_get_policies;

/** */
alias soup_hsts_enforcer_has_valid_policy = c_soup_hsts_enforcer_has_valid_policy;

/** */
alias soup_hsts_enforcer_is_persistent = c_soup_hsts_enforcer_is_persistent;

/** */
alias soup_hsts_enforcer_set_policy = c_soup_hsts_enforcer_set_policy;

/** */
alias soup_hsts_enforcer_set_session_policy = c_soup_hsts_enforcer_set_session_policy;

// HSTSEnforcerDB

/** */
alias soup_hsts_enforcer_db_get_type = c_soup_hsts_enforcer_db_get_type;

/** */
alias soup_hsts_enforcer_db_new = c_soup_hsts_enforcer_db_new;

// HSTSPolicy

/** */
alias soup_hsts_policy_get_type = c_soup_hsts_policy_get_type;

/** */
alias soup_hsts_policy_new = c_soup_hsts_policy_new;

/** */
alias soup_hsts_policy_new_from_response = c_soup_hsts_policy_new_from_response;

/** */
alias soup_hsts_policy_new_full = c_soup_hsts_policy_new_full;

/** */
alias soup_hsts_policy_new_session_policy = c_soup_hsts_policy_new_session_policy;

/** */
alias soup_hsts_policy_copy = c_soup_hsts_policy_copy;

/** */
alias soup_hsts_policy_equal = c_soup_hsts_policy_equal;

/** */
alias soup_hsts_policy_free = c_soup_hsts_policy_free;

/** */
alias soup_hsts_policy_get_domain = c_soup_hsts_policy_get_domain;

/** */
alias soup_hsts_policy_get_expires = c_soup_hsts_policy_get_expires;

/** */
alias soup_hsts_policy_get_max_age = c_soup_hsts_policy_get_max_age;

/** */
alias soup_hsts_policy_includes_subdomains = c_soup_hsts_policy_includes_subdomains;

/** */
alias soup_hsts_policy_is_expired = c_soup_hsts_policy_is_expired;

/** */
alias soup_hsts_policy_is_session_policy = c_soup_hsts_policy_is_session_policy;

// Logger

/** */
alias soup_logger_get_type = c_soup_logger_get_type;

/** */
alias soup_logger_new = c_soup_logger_new;

/** */
alias soup_logger_get_max_body_size = c_soup_logger_get_max_body_size;

/** */
alias soup_logger_set_max_body_size = c_soup_logger_set_max_body_size;

/** */
alias soup_logger_set_printer = c_soup_logger_set_printer;

/** */
alias soup_logger_set_request_filter = c_soup_logger_set_request_filter;

/** */
alias soup_logger_set_response_filter = c_soup_logger_set_response_filter;

// Message

/** */
alias soup_message_get_type = c_soup_message_get_type;

/** */
alias soup_message_new = c_soup_message_new;

/** */
alias soup_message_new_from_encoded_form = c_soup_message_new_from_encoded_form;

/** */
alias soup_message_new_from_multipart = c_soup_message_new_from_multipart;

/** */
alias soup_message_new_from_uri = c_soup_message_new_from_uri;

/** */
alias soup_message_new_options_ping = c_soup_message_new_options_ping;

/** */
alias soup_message_add_flags = c_soup_message_add_flags;

/** */
alias soup_message_add_header_handler = c_soup_message_add_header_handler;

/** */
alias soup_message_add_status_code_handler = c_soup_message_add_status_code_handler;

/** */
alias soup_message_disable_feature = c_soup_message_disable_feature;

/** */
alias soup_message_get_connection_id = c_soup_message_get_connection_id;

/** */
alias soup_message_get_first_party = c_soup_message_get_first_party;

/** */
alias soup_message_get_flags = c_soup_message_get_flags;

/** */
alias soup_message_get_force_http1 = c_soup_message_get_force_http1;

/** */
alias soup_message_get_http_version = c_soup_message_get_http_version;

/** */
alias soup_message_get_is_options_ping = c_soup_message_get_is_options_ping;

/** */
alias soup_message_get_is_top_level_navigation = c_soup_message_get_is_top_level_navigation;

/** */
alias soup_message_get_method = c_soup_message_get_method;

/** */
alias soup_message_get_metrics = c_soup_message_get_metrics;

/** */
alias soup_message_get_priority = c_soup_message_get_priority;

/** */
alias soup_message_get_reason_phrase = c_soup_message_get_reason_phrase;

/** */
alias soup_message_get_remote_address = c_soup_message_get_remote_address;

/** */
alias soup_message_get_request_headers = c_soup_message_get_request_headers;

/** */
alias soup_message_get_response_headers = c_soup_message_get_response_headers;

/** */
alias soup_message_get_site_for_cookies = c_soup_message_get_site_for_cookies;

/** */
alias soup_message_get_status = c_soup_message_get_status;

/** */
alias soup_message_get_tls_ciphersuite_name = c_soup_message_get_tls_ciphersuite_name;

/** */
alias soup_message_get_tls_peer_certificate = c_soup_message_get_tls_peer_certificate;

/** */
alias soup_message_get_tls_peer_certificate_errors = c_soup_message_get_tls_peer_certificate_errors;

/** */
alias soup_message_get_tls_protocol_version = c_soup_message_get_tls_protocol_version;

/** */
alias soup_message_get_uri = c_soup_message_get_uri;

/** */
alias soup_message_is_feature_disabled = c_soup_message_is_feature_disabled;

/** */
alias soup_message_is_keepalive = c_soup_message_is_keepalive;

/** */
alias soup_message_query_flags = c_soup_message_query_flags;

/** */
alias soup_message_remove_flags = c_soup_message_remove_flags;

/** */
alias soup_message_set_first_party = c_soup_message_set_first_party;

/** */
alias soup_message_set_flags = c_soup_message_set_flags;

/** */
alias soup_message_set_force_http1 = c_soup_message_set_force_http1;

/** */
alias soup_message_set_is_options_ping = c_soup_message_set_is_options_ping;

/** */
alias soup_message_set_is_top_level_navigation = c_soup_message_set_is_top_level_navigation;

/** */
alias soup_message_set_method = c_soup_message_set_method;

/** */
alias soup_message_set_priority = c_soup_message_set_priority;

/** */
alias soup_message_set_request_body = c_soup_message_set_request_body;

/** */
alias soup_message_set_request_body_from_bytes = c_soup_message_set_request_body_from_bytes;

/** */
alias soup_message_set_site_for_cookies = c_soup_message_set_site_for_cookies;

/** */
alias soup_message_set_tls_client_certificate = c_soup_message_set_tls_client_certificate;

/** */
alias soup_message_set_uri = c_soup_message_set_uri;

/** */
alias soup_message_tls_client_certificate_password_request_complete = c_soup_message_tls_client_certificate_password_request_complete;

// MessageBody

/** */
alias soup_message_body_get_type = c_soup_message_body_get_type;

/** */
alias soup_message_body_new = c_soup_message_body_new;

/** */
alias soup_message_body_append = c_soup_message_body_append;

/** */
alias soup_message_body_append_bytes = c_soup_message_body_append_bytes;

/** */
alias soup_message_body_append_take = c_soup_message_body_append_take;

/** */
alias soup_message_body_complete = c_soup_message_body_complete;

/** */
alias soup_message_body_flatten = c_soup_message_body_flatten;

/** */
alias soup_message_body_get_accumulate = c_soup_message_body_get_accumulate;

/** */
alias soup_message_body_get_chunk = c_soup_message_body_get_chunk;

/** */
alias soup_message_body_got_chunk = c_soup_message_body_got_chunk;

/** */
alias soup_message_body_ref = c_soup_message_body_ref;

/** */
alias soup_message_body_set_accumulate = c_soup_message_body_set_accumulate;

/** */
alias soup_message_body_truncate = c_soup_message_body_truncate;

/** */
alias soup_message_body_unref = c_soup_message_body_unref;

/** */
alias soup_message_body_wrote_chunk = c_soup_message_body_wrote_chunk;

// MessageHeaders

/** */
alias soup_message_headers_get_type = c_soup_message_headers_get_type;

/** */
alias soup_message_headers_new = c_soup_message_headers_new;

/** */
alias soup_message_headers_append = c_soup_message_headers_append;

/** */
alias soup_message_headers_clean_connection_headers = c_soup_message_headers_clean_connection_headers;

/** */
alias soup_message_headers_clear = c_soup_message_headers_clear;

/** */
alias soup_message_headers_foreach = c_soup_message_headers_foreach;

/** */
alias soup_message_headers_free_ranges = c_soup_message_headers_free_ranges;

/** */
alias soup_message_headers_get_content_disposition = c_soup_message_headers_get_content_disposition;

/** */
alias soup_message_headers_get_content_length = c_soup_message_headers_get_content_length;

/** */
alias soup_message_headers_get_content_range = c_soup_message_headers_get_content_range;

/** */
alias soup_message_headers_get_content_type = c_soup_message_headers_get_content_type;

/** */
alias soup_message_headers_get_encoding = c_soup_message_headers_get_encoding;

/** */
alias soup_message_headers_get_expectations = c_soup_message_headers_get_expectations;

/** */
alias soup_message_headers_get_headers_type = c_soup_message_headers_get_headers_type;

/** */
alias soup_message_headers_get_list = c_soup_message_headers_get_list;

/** */
alias soup_message_headers_get_one = c_soup_message_headers_get_one;

/** */
alias soup_message_headers_get_ranges = c_soup_message_headers_get_ranges;

/** */
alias soup_message_headers_header_contains = c_soup_message_headers_header_contains;

/** */
alias soup_message_headers_header_equals = c_soup_message_headers_header_equals;

/** */
alias soup_message_headers_ref = c_soup_message_headers_ref;

/** */
alias soup_message_headers_remove = c_soup_message_headers_remove;

/** */
alias soup_message_headers_replace = c_soup_message_headers_replace;

/** */
alias soup_message_headers_set_content_disposition = c_soup_message_headers_set_content_disposition;

/** */
alias soup_message_headers_set_content_length = c_soup_message_headers_set_content_length;

/** */
alias soup_message_headers_set_content_range = c_soup_message_headers_set_content_range;

/** */
alias soup_message_headers_set_content_type = c_soup_message_headers_set_content_type;

/** */
alias soup_message_headers_set_encoding = c_soup_message_headers_set_encoding;

/** */
alias soup_message_headers_set_expectations = c_soup_message_headers_set_expectations;

/** */
alias soup_message_headers_set_range = c_soup_message_headers_set_range;

/** */
alias soup_message_headers_set_ranges = c_soup_message_headers_set_ranges;

/** */
alias soup_message_headers_unref = c_soup_message_headers_unref;

// MessageHeadersIter

/** */
alias soup_message_headers_iter_next = c_soup_message_headers_iter_next;

/** */
alias soup_message_headers_iter_init = c_soup_message_headers_iter_init;

// MessageMetrics

/** */
alias soup_message_metrics_get_type = c_soup_message_metrics_get_type;

/** */
alias soup_message_metrics_copy = c_soup_message_metrics_copy;

/** */
alias soup_message_metrics_free = c_soup_message_metrics_free;

/** */
alias soup_message_metrics_get_connect_end = c_soup_message_metrics_get_connect_end;

/** */
alias soup_message_metrics_get_connect_start = c_soup_message_metrics_get_connect_start;

/** */
alias soup_message_metrics_get_dns_end = c_soup_message_metrics_get_dns_end;

/** */
alias soup_message_metrics_get_dns_start = c_soup_message_metrics_get_dns_start;

/** */
alias soup_message_metrics_get_fetch_start = c_soup_message_metrics_get_fetch_start;

/** */
alias soup_message_metrics_get_request_body_bytes_sent = c_soup_message_metrics_get_request_body_bytes_sent;

/** */
alias soup_message_metrics_get_request_body_size = c_soup_message_metrics_get_request_body_size;

/** */
alias soup_message_metrics_get_request_header_bytes_sent = c_soup_message_metrics_get_request_header_bytes_sent;

/** */
alias soup_message_metrics_get_request_start = c_soup_message_metrics_get_request_start;

/** */
alias soup_message_metrics_get_response_body_bytes_received = c_soup_message_metrics_get_response_body_bytes_received;

/** */
alias soup_message_metrics_get_response_body_size = c_soup_message_metrics_get_response_body_size;

/** */
alias soup_message_metrics_get_response_end = c_soup_message_metrics_get_response_end;

/** */
alias soup_message_metrics_get_response_header_bytes_received = c_soup_message_metrics_get_response_header_bytes_received;

/** */
alias soup_message_metrics_get_response_start = c_soup_message_metrics_get_response_start;

/** */
alias soup_message_metrics_get_tls_start = c_soup_message_metrics_get_tls_start;

// Multipart

/** */
alias soup_multipart_get_type = c_soup_multipart_get_type;

/** */
alias soup_multipart_new = c_soup_multipart_new;

/** */
alias soup_multipart_new_from_message = c_soup_multipart_new_from_message;

/** */
alias soup_multipart_append_form_file = c_soup_multipart_append_form_file;

/** */
alias soup_multipart_append_form_string = c_soup_multipart_append_form_string;

/** */
alias soup_multipart_append_part = c_soup_multipart_append_part;

/** */
alias soup_multipart_free = c_soup_multipart_free;

/** */
alias soup_multipart_get_length = c_soup_multipart_get_length;

/** */
alias soup_multipart_get_part = c_soup_multipart_get_part;

/** */
alias soup_multipart_to_message = c_soup_multipart_to_message;

// MultipartInputStream

/** */
alias soup_multipart_input_stream_get_type = c_soup_multipart_input_stream_get_type;

/** */
alias soup_multipart_input_stream_new = c_soup_multipart_input_stream_new;

/** */
alias soup_multipart_input_stream_get_headers = c_soup_multipart_input_stream_get_headers;

/** */
alias soup_multipart_input_stream_next_part = c_soup_multipart_input_stream_next_part;

/** */
alias soup_multipart_input_stream_next_part_async = c_soup_multipart_input_stream_next_part_async;

/** */
alias soup_multipart_input_stream_next_part_finish = c_soup_multipart_input_stream_next_part_finish;

// Server

/** */
alias soup_server_get_type = c_soup_server_get_type;

/** */
alias soup_server_new = c_soup_server_new;

/** */
alias soup_server_accept_iostream = c_soup_server_accept_iostream;

/** */
alias soup_server_add_auth_domain = c_soup_server_add_auth_domain;

/** */
alias soup_server_add_early_handler = c_soup_server_add_early_handler;

/** */
alias soup_server_add_handler = c_soup_server_add_handler;

/** */
alias soup_server_add_websocket_extension = c_soup_server_add_websocket_extension;

/** */
alias soup_server_add_websocket_handler = c_soup_server_add_websocket_handler;

/** */
alias soup_server_disconnect = c_soup_server_disconnect;

/** */
alias soup_server_get_listeners = c_soup_server_get_listeners;

/** */
alias soup_server_get_tls_auth_mode = c_soup_server_get_tls_auth_mode;

/** */
alias soup_server_get_tls_certificate = c_soup_server_get_tls_certificate;

/** */
alias soup_server_get_tls_database = c_soup_server_get_tls_database;

/** */
alias soup_server_get_uris = c_soup_server_get_uris;

/** */
alias soup_server_is_https = c_soup_server_is_https;

/** */
alias soup_server_listen = c_soup_server_listen;

/** */
alias soup_server_listen_all = c_soup_server_listen_all;

/** */
alias soup_server_listen_local = c_soup_server_listen_local;

/** */
alias soup_server_listen_socket = c_soup_server_listen_socket;

/** */
alias soup_server_pause_message = c_soup_server_pause_message;

/** */
alias soup_server_remove_auth_domain = c_soup_server_remove_auth_domain;

/** */
alias soup_server_remove_handler = c_soup_server_remove_handler;

/** */
alias soup_server_remove_websocket_extension = c_soup_server_remove_websocket_extension;

/** */
alias soup_server_set_tls_auth_mode = c_soup_server_set_tls_auth_mode;

/** */
alias soup_server_set_tls_certificate = c_soup_server_set_tls_certificate;

/** */
alias soup_server_set_tls_database = c_soup_server_set_tls_database;

/** */
alias soup_server_unpause_message = c_soup_server_unpause_message;

// ServerMessage

/** */
alias soup_server_message_get_type = c_soup_server_message_get_type;

/** */
alias soup_server_message_get_http_version = c_soup_server_message_get_http_version;

/** */
alias soup_server_message_get_local_address = c_soup_server_message_get_local_address;

/** */
alias soup_server_message_get_method = c_soup_server_message_get_method;

/** */
alias soup_server_message_get_reason_phrase = c_soup_server_message_get_reason_phrase;

/** */
alias soup_server_message_get_remote_address = c_soup_server_message_get_remote_address;

/** */
alias soup_server_message_get_remote_host = c_soup_server_message_get_remote_host;

/** */
alias soup_server_message_get_request_body = c_soup_server_message_get_request_body;

/** */
alias soup_server_message_get_request_headers = c_soup_server_message_get_request_headers;

/** */
alias soup_server_message_get_response_body = c_soup_server_message_get_response_body;

/** */
alias soup_server_message_get_response_headers = c_soup_server_message_get_response_headers;

/** */
alias soup_server_message_get_socket = c_soup_server_message_get_socket;

/** */
alias soup_server_message_get_status = c_soup_server_message_get_status;

/** */
alias soup_server_message_get_tls_peer_certificate = c_soup_server_message_get_tls_peer_certificate;

/** */
alias soup_server_message_get_tls_peer_certificate_errors = c_soup_server_message_get_tls_peer_certificate_errors;

/** */
alias soup_server_message_get_uri = c_soup_server_message_get_uri;

/** */
alias soup_server_message_is_options_ping = c_soup_server_message_is_options_ping;

/** */
alias soup_server_message_pause = c_soup_server_message_pause;

/** */
alias soup_server_message_set_http_version = c_soup_server_message_set_http_version;

/** */
alias soup_server_message_set_redirect = c_soup_server_message_set_redirect;

/** */
alias soup_server_message_set_response = c_soup_server_message_set_response;

/** */
alias soup_server_message_set_status = c_soup_server_message_set_status;

/** */
alias soup_server_message_steal_connection = c_soup_server_message_steal_connection;

/** */
alias soup_server_message_unpause = c_soup_server_message_unpause;

// Session

/** */
alias soup_session_get_type = c_soup_session_get_type;

/** */
alias soup_session_new = c_soup_session_new;

/** */
alias soup_session_new_with_options = c_soup_session_new_with_options;

/** */
alias soup_session_abort = c_soup_session_abort;

/** */
alias soup_session_add_feature = c_soup_session_add_feature;

/** */
alias soup_session_add_feature_by_type = c_soup_session_add_feature_by_type;

/** */
alias soup_session_get_accept_language = c_soup_session_get_accept_language;

/** */
alias soup_session_get_accept_language_auto = c_soup_session_get_accept_language_auto;

/** */
alias soup_session_get_async_result_message = c_soup_session_get_async_result_message;

/** */
alias soup_session_get_feature = c_soup_session_get_feature;

/** */
alias soup_session_get_feature_for_message = c_soup_session_get_feature_for_message;

/** */
alias soup_session_get_idle_timeout = c_soup_session_get_idle_timeout;

/** */
alias soup_session_get_local_address = c_soup_session_get_local_address;

/** */
alias soup_session_get_max_conns = c_soup_session_get_max_conns;

/** */
alias soup_session_get_max_conns_per_host = c_soup_session_get_max_conns_per_host;

/** */
alias soup_session_get_proxy_resolver = c_soup_session_get_proxy_resolver;

/** */
alias soup_session_get_remote_connectable = c_soup_session_get_remote_connectable;

/** */
alias soup_session_get_timeout = c_soup_session_get_timeout;

/** */
alias soup_session_get_tls_database = c_soup_session_get_tls_database;

/** */
alias soup_session_get_tls_interaction = c_soup_session_get_tls_interaction;

/** */
alias soup_session_get_user_agent = c_soup_session_get_user_agent;

/** */
alias soup_session_has_feature = c_soup_session_has_feature;

/** */
alias soup_session_preconnect_async = c_soup_session_preconnect_async;

/** */
alias soup_session_preconnect_finish = c_soup_session_preconnect_finish;

/** */
alias soup_session_remove_feature = c_soup_session_remove_feature;

/** */
alias soup_session_remove_feature_by_type = c_soup_session_remove_feature_by_type;

/** */
alias soup_session_send = c_soup_session_send;

/** */
alias soup_session_send_and_read = c_soup_session_send_and_read;

/** */
alias soup_session_send_and_read_async = c_soup_session_send_and_read_async;

/** */
alias soup_session_send_and_read_finish = c_soup_session_send_and_read_finish;

/** */
alias soup_session_send_and_splice = c_soup_session_send_and_splice;

/** */
alias soup_session_send_and_splice_async = c_soup_session_send_and_splice_async;

/** */
alias soup_session_send_and_splice_finish = c_soup_session_send_and_splice_finish;

/** */
alias soup_session_send_async = c_soup_session_send_async;

/** */
alias soup_session_send_finish = c_soup_session_send_finish;

/** */
alias soup_session_set_accept_language = c_soup_session_set_accept_language;

/** */
alias soup_session_set_accept_language_auto = c_soup_session_set_accept_language_auto;

/** */
alias soup_session_set_idle_timeout = c_soup_session_set_idle_timeout;

/** */
alias soup_session_set_proxy_resolver = c_soup_session_set_proxy_resolver;

/** */
alias soup_session_set_timeout = c_soup_session_set_timeout;

/** */
alias soup_session_set_tls_database = c_soup_session_set_tls_database;

/** */
alias soup_session_set_tls_interaction = c_soup_session_set_tls_interaction;

/** */
alias soup_session_set_user_agent = c_soup_session_set_user_agent;

/** */
alias soup_session_websocket_connect_async = c_soup_session_websocket_connect_async;

/** */
alias soup_session_websocket_connect_finish = c_soup_session_websocket_connect_finish;

// SessionFeature

/** */
alias soup_session_feature_get_type = c_soup_session_feature_get_type;

// WebsocketConnection

/** */
alias soup_websocket_connection_get_type = c_soup_websocket_connection_get_type;

/** */
alias soup_websocket_connection_new = c_soup_websocket_connection_new;

/** */
alias soup_websocket_connection_close = c_soup_websocket_connection_close;

/** */
alias soup_websocket_connection_get_close_code = c_soup_websocket_connection_get_close_code;

/** */
alias soup_websocket_connection_get_close_data = c_soup_websocket_connection_get_close_data;

/** */
alias soup_websocket_connection_get_connection_type = c_soup_websocket_connection_get_connection_type;

/** */
alias soup_websocket_connection_get_extensions = c_soup_websocket_connection_get_extensions;

/** */
alias soup_websocket_connection_get_io_stream = c_soup_websocket_connection_get_io_stream;

/** */
alias soup_websocket_connection_get_keepalive_interval = c_soup_websocket_connection_get_keepalive_interval;

/** */
alias soup_websocket_connection_get_max_incoming_payload_size = c_soup_websocket_connection_get_max_incoming_payload_size;

/** */
alias soup_websocket_connection_get_origin = c_soup_websocket_connection_get_origin;

/** */
alias soup_websocket_connection_get_protocol = c_soup_websocket_connection_get_protocol;

/** */
alias soup_websocket_connection_get_state = c_soup_websocket_connection_get_state;

/** */
alias soup_websocket_connection_get_uri = c_soup_websocket_connection_get_uri;

/** */
alias soup_websocket_connection_send_binary = c_soup_websocket_connection_send_binary;

/** */
alias soup_websocket_connection_send_message = c_soup_websocket_connection_send_message;

/** */
alias soup_websocket_connection_send_text = c_soup_websocket_connection_send_text;

/** */
alias soup_websocket_connection_set_keepalive_interval = c_soup_websocket_connection_set_keepalive_interval;

/** */
alias soup_websocket_connection_set_max_incoming_payload_size = c_soup_websocket_connection_set_max_incoming_payload_size;

// WebsocketExtension

/** */
alias soup_websocket_extension_get_type = c_soup_websocket_extension_get_type;

/** */
alias soup_websocket_extension_configure = c_soup_websocket_extension_configure;

/** */
alias soup_websocket_extension_get_request_params = c_soup_websocket_extension_get_request_params;

/** */
alias soup_websocket_extension_get_response_params = c_soup_websocket_extension_get_response_params;

/** */
alias soup_websocket_extension_process_incoming_message = c_soup_websocket_extension_process_incoming_message;

/** */
alias soup_websocket_extension_process_outgoing_message = c_soup_websocket_extension_process_outgoing_message;

// WebsocketExtensionDeflate

/** */
alias soup_websocket_extension_deflate_get_type = c_soup_websocket_extension_deflate_get_type;

// WebsocketExtensionManager

/** */
alias soup_websocket_extension_manager_get_type = c_soup_websocket_extension_manager_get_type;

// global

/** */
alias soup_check_version = c_soup_check_version;

/** */
alias soup_cookies_free = c_soup_cookies_free;

/** */
alias soup_cookies_from_request = c_soup_cookies_from_request;

/** */
alias soup_cookies_from_response = c_soup_cookies_from_response;

/** */
alias soup_cookies_to_cookie_header = c_soup_cookies_to_cookie_header;

/** */
alias soup_cookies_to_request = c_soup_cookies_to_request;

/** */
alias soup_cookies_to_response = c_soup_cookies_to_response;

/** */
alias soup_date_time_new_from_http_string = c_soup_date_time_new_from_http_string;

/** */
alias soup_date_time_to_string = c_soup_date_time_to_string;

/** */
alias soup_form_decode = c_soup_form_decode;

/** */
alias soup_form_decode_multipart = c_soup_form_decode_multipart;

/** */
alias soup_form_encode = c_soup_form_encode;

/** */
alias soup_form_encode_datalist = c_soup_form_encode_datalist;

/** */
alias soup_form_encode_hash = c_soup_form_encode_hash;

/** */
alias soup_form_encode_valist = c_soup_form_encode_valist;

/** */
alias soup_get_major_version = c_soup_get_major_version;

/** */
alias soup_get_micro_version = c_soup_get_micro_version;

/** */
alias soup_get_minor_version = c_soup_get_minor_version;

/** */
alias soup_header_contains = c_soup_header_contains;

/** */
alias soup_header_free_list = c_soup_header_free_list;

/** */
alias soup_header_free_param_list = c_soup_header_free_param_list;

/** */
alias soup_header_g_string_append_param = c_soup_header_g_string_append_param;

/** */
alias soup_header_g_string_append_param_quoted = c_soup_header_g_string_append_param_quoted;

/** */
alias soup_header_parse_list = c_soup_header_parse_list;

/** */
alias soup_header_parse_param_list = c_soup_header_parse_param_list;

/** */
alias soup_header_parse_param_list_strict = c_soup_header_parse_param_list_strict;

/** */
alias soup_header_parse_quality_list = c_soup_header_parse_quality_list;

/** */
alias soup_header_parse_semi_param_list = c_soup_header_parse_semi_param_list;

/** */
alias soup_header_parse_semi_param_list_strict = c_soup_header_parse_semi_param_list_strict;

/** */
alias soup_headers_parse = c_soup_headers_parse;

/** */
alias soup_headers_parse_request = c_soup_headers_parse_request;

/** */
alias soup_headers_parse_response = c_soup_headers_parse_response;

/** */
alias soup_headers_parse_status_line = c_soup_headers_parse_status_line;

/** */
alias soup_tld_domain_is_public_suffix = c_soup_tld_domain_is_public_suffix;

/** */
alias soup_tld_get_base_domain = c_soup_tld_get_base_domain;

/** */
alias soup_uri_copy = c_soup_uri_copy;

/** */
alias soup_uri_decode_data_uri = c_soup_uri_decode_data_uri;

/** */
alias soup_uri_equal = c_soup_uri_equal;

/** */
alias soup_websocket_client_prepare_handshake = c_soup_websocket_client_prepare_handshake;

/** */
alias soup_websocket_client_verify_handshake = c_soup_websocket_client_verify_handshake;

/** */
alias soup_websocket_server_check_handshake = c_soup_websocket_server_check_handshake;

/** */
alias soup_websocket_server_process_handshake = c_soup_websocket_server_process_handshake;

shared static this()
{
  // Auth
  gidLink(cast(void**)&soup_auth_get_type, "soup_auth_get_type", LIBS);
  gidLink(cast(void**)&soup_auth_new, "soup_auth_new", LIBS);
  gidLink(cast(void**)&soup_auth_authenticate, "soup_auth_authenticate", LIBS);
  gidLink(cast(void**)&soup_auth_can_authenticate, "soup_auth_can_authenticate", LIBS);
  gidLink(cast(void**)&soup_auth_cancel, "soup_auth_cancel", LIBS);
  gidLink(cast(void**)&soup_auth_free_protection_space, "soup_auth_free_protection_space", LIBS);
  gidLink(cast(void**)&soup_auth_get_authority, "soup_auth_get_authority", LIBS);
  gidLink(cast(void**)&soup_auth_get_authorization, "soup_auth_get_authorization", LIBS);
  gidLink(cast(void**)&soup_auth_get_info, "soup_auth_get_info", LIBS);
  gidLink(cast(void**)&soup_auth_get_protection_space, "soup_auth_get_protection_space", LIBS);
  gidLink(cast(void**)&soup_auth_get_realm, "soup_auth_get_realm", LIBS);
  gidLink(cast(void**)&soup_auth_get_scheme_name, "soup_auth_get_scheme_name", LIBS);
  gidLink(cast(void**)&soup_auth_is_authenticated, "soup_auth_is_authenticated", LIBS);
  gidLink(cast(void**)&soup_auth_is_cancelled, "soup_auth_is_cancelled", LIBS);
  gidLink(cast(void**)&soup_auth_is_for_proxy, "soup_auth_is_for_proxy", LIBS);
  gidLink(cast(void**)&soup_auth_is_ready, "soup_auth_is_ready", LIBS);
  gidLink(cast(void**)&soup_auth_update, "soup_auth_update", LIBS);

  // AuthBasic
  gidLink(cast(void**)&soup_auth_basic_get_type, "soup_auth_basic_get_type", LIBS);

  // AuthDigest
  gidLink(cast(void**)&soup_auth_digest_get_type, "soup_auth_digest_get_type", LIBS);

  // AuthDomain
  gidLink(cast(void**)&soup_auth_domain_get_type, "soup_auth_domain_get_type", LIBS);
  gidLink(cast(void**)&soup_auth_domain_accepts, "soup_auth_domain_accepts", LIBS);
  gidLink(cast(void**)&soup_auth_domain_add_path, "soup_auth_domain_add_path", LIBS);
  gidLink(cast(void**)&soup_auth_domain_challenge, "soup_auth_domain_challenge", LIBS);
  gidLink(cast(void**)&soup_auth_domain_check_password, "soup_auth_domain_check_password", LIBS);
  gidLink(cast(void**)&soup_auth_domain_covers, "soup_auth_domain_covers", LIBS);
  gidLink(cast(void**)&soup_auth_domain_get_realm, "soup_auth_domain_get_realm", LIBS);
  gidLink(cast(void**)&soup_auth_domain_remove_path, "soup_auth_domain_remove_path", LIBS);
  gidLink(cast(void**)&soup_auth_domain_set_filter, "soup_auth_domain_set_filter", LIBS);
  gidLink(cast(void**)&soup_auth_domain_set_generic_auth_callback, "soup_auth_domain_set_generic_auth_callback", LIBS);

  // AuthDomainBasic
  gidLink(cast(void**)&soup_auth_domain_basic_get_type, "soup_auth_domain_basic_get_type", LIBS);
  gidLink(cast(void**)&soup_auth_domain_basic_new, "soup_auth_domain_basic_new", LIBS);
  gidLink(cast(void**)&soup_auth_domain_basic_set_auth_callback, "soup_auth_domain_basic_set_auth_callback", LIBS);

  // AuthDomainDigest
  gidLink(cast(void**)&soup_auth_domain_digest_get_type, "soup_auth_domain_digest_get_type", LIBS);
  gidLink(cast(void**)&soup_auth_domain_digest_new, "soup_auth_domain_digest_new", LIBS);
  gidLink(cast(void**)&soup_auth_domain_digest_encode_password, "soup_auth_domain_digest_encode_password", LIBS);
  gidLink(cast(void**)&soup_auth_domain_digest_set_auth_callback, "soup_auth_domain_digest_set_auth_callback", LIBS);

  // AuthManager
  gidLink(cast(void**)&soup_auth_manager_get_type, "soup_auth_manager_get_type", LIBS);
  gidLink(cast(void**)&soup_auth_manager_clear_cached_credentials, "soup_auth_manager_clear_cached_credentials", LIBS);
  gidLink(cast(void**)&soup_auth_manager_use_auth, "soup_auth_manager_use_auth", LIBS);

  // AuthNTLM
  gidLink(cast(void**)&soup_auth_ntlm_get_type, "soup_auth_ntlm_get_type", LIBS);

  // AuthNegotiate
  gidLink(cast(void**)&soup_auth_negotiate_get_type, "soup_auth_negotiate_get_type", LIBS);
  gidLink(cast(void**)&soup_auth_negotiate_supported, "soup_auth_negotiate_supported", LIBS);

  // Cache
  gidLink(cast(void**)&soup_cache_get_type, "soup_cache_get_type", LIBS);
  gidLink(cast(void**)&soup_cache_new, "soup_cache_new", LIBS);
  gidLink(cast(void**)&soup_cache_clear, "soup_cache_clear", LIBS);
  gidLink(cast(void**)&soup_cache_dump, "soup_cache_dump", LIBS);
  gidLink(cast(void**)&soup_cache_flush, "soup_cache_flush", LIBS);
  gidLink(cast(void**)&soup_cache_get_max_size, "soup_cache_get_max_size", LIBS);
  gidLink(cast(void**)&soup_cache_load, "soup_cache_load", LIBS);
  gidLink(cast(void**)&soup_cache_set_max_size, "soup_cache_set_max_size", LIBS);

  // ContentDecoder
  gidLink(cast(void**)&soup_content_decoder_get_type, "soup_content_decoder_get_type", LIBS);

  // ContentSniffer
  gidLink(cast(void**)&soup_content_sniffer_get_type, "soup_content_sniffer_get_type", LIBS);
  gidLink(cast(void**)&soup_content_sniffer_new, "soup_content_sniffer_new", LIBS);
  gidLink(cast(void**)&soup_content_sniffer_sniff, "soup_content_sniffer_sniff", LIBS);

  // Cookie
  gidLink(cast(void**)&soup_cookie_get_type, "soup_cookie_get_type", LIBS);
  gidLink(cast(void**)&soup_cookie_new, "soup_cookie_new", LIBS);
  gidLink(cast(void**)&soup_cookie_applies_to_uri, "soup_cookie_applies_to_uri", LIBS);
  gidLink(cast(void**)&soup_cookie_copy, "soup_cookie_copy", LIBS);
  gidLink(cast(void**)&soup_cookie_domain_matches, "soup_cookie_domain_matches", LIBS);
  gidLink(cast(void**)&soup_cookie_equal, "soup_cookie_equal", LIBS);
  gidLink(cast(void**)&soup_cookie_free, "soup_cookie_free", LIBS);
  gidLink(cast(void**)&soup_cookie_get_domain, "soup_cookie_get_domain", LIBS);
  gidLink(cast(void**)&soup_cookie_get_expires, "soup_cookie_get_expires", LIBS);
  gidLink(cast(void**)&soup_cookie_get_http_only, "soup_cookie_get_http_only", LIBS);
  gidLink(cast(void**)&soup_cookie_get_name, "soup_cookie_get_name", LIBS);
  gidLink(cast(void**)&soup_cookie_get_path, "soup_cookie_get_path", LIBS);
  gidLink(cast(void**)&soup_cookie_get_same_site_policy, "soup_cookie_get_same_site_policy", LIBS);
  gidLink(cast(void**)&soup_cookie_get_secure, "soup_cookie_get_secure", LIBS);
  gidLink(cast(void**)&soup_cookie_get_value, "soup_cookie_get_value", LIBS);
  gidLink(cast(void**)&soup_cookie_set_domain, "soup_cookie_set_domain", LIBS);
  gidLink(cast(void**)&soup_cookie_set_expires, "soup_cookie_set_expires", LIBS);
  gidLink(cast(void**)&soup_cookie_set_http_only, "soup_cookie_set_http_only", LIBS);
  gidLink(cast(void**)&soup_cookie_set_max_age, "soup_cookie_set_max_age", LIBS);
  gidLink(cast(void**)&soup_cookie_set_name, "soup_cookie_set_name", LIBS);
  gidLink(cast(void**)&soup_cookie_set_path, "soup_cookie_set_path", LIBS);
  gidLink(cast(void**)&soup_cookie_set_same_site_policy, "soup_cookie_set_same_site_policy", LIBS);
  gidLink(cast(void**)&soup_cookie_set_secure, "soup_cookie_set_secure", LIBS);
  gidLink(cast(void**)&soup_cookie_set_value, "soup_cookie_set_value", LIBS);
  gidLink(cast(void**)&soup_cookie_to_cookie_header, "soup_cookie_to_cookie_header", LIBS);
  gidLink(cast(void**)&soup_cookie_to_set_cookie_header, "soup_cookie_to_set_cookie_header", LIBS);
  gidLink(cast(void**)&soup_cookie_parse, "soup_cookie_parse", LIBS);

  // CookieJar
  gidLink(cast(void**)&soup_cookie_jar_get_type, "soup_cookie_jar_get_type", LIBS);
  gidLink(cast(void**)&soup_cookie_jar_new, "soup_cookie_jar_new", LIBS);
  gidLink(cast(void**)&soup_cookie_jar_add_cookie, "soup_cookie_jar_add_cookie", LIBS);
  gidLink(cast(void**)&soup_cookie_jar_add_cookie_full, "soup_cookie_jar_add_cookie_full", LIBS);
  gidLink(cast(void**)&soup_cookie_jar_add_cookie_with_first_party, "soup_cookie_jar_add_cookie_with_first_party", LIBS);
  gidLink(cast(void**)&soup_cookie_jar_all_cookies, "soup_cookie_jar_all_cookies", LIBS);
  gidLink(cast(void**)&soup_cookie_jar_delete_cookie, "soup_cookie_jar_delete_cookie", LIBS);
  gidLink(cast(void**)&soup_cookie_jar_get_accept_policy, "soup_cookie_jar_get_accept_policy", LIBS);
  gidLink(cast(void**)&soup_cookie_jar_get_cookie_list, "soup_cookie_jar_get_cookie_list", LIBS);
  gidLink(cast(void**)&soup_cookie_jar_get_cookie_list_with_same_site_info, "soup_cookie_jar_get_cookie_list_with_same_site_info", LIBS);
  gidLink(cast(void**)&soup_cookie_jar_get_cookies, "soup_cookie_jar_get_cookies", LIBS);
  gidLink(cast(void**)&soup_cookie_jar_is_persistent, "soup_cookie_jar_is_persistent", LIBS);
  gidLink(cast(void**)&soup_cookie_jar_set_accept_policy, "soup_cookie_jar_set_accept_policy", LIBS);
  gidLink(cast(void**)&soup_cookie_jar_set_cookie, "soup_cookie_jar_set_cookie", LIBS);
  gidLink(cast(void**)&soup_cookie_jar_set_cookie_with_first_party, "soup_cookie_jar_set_cookie_with_first_party", LIBS);

  // CookieJarDB
  gidLink(cast(void**)&soup_cookie_jar_db_get_type, "soup_cookie_jar_db_get_type", LIBS);
  gidLink(cast(void**)&soup_cookie_jar_db_new, "soup_cookie_jar_db_new", LIBS);

  // CookieJarText
  gidLink(cast(void**)&soup_cookie_jar_text_get_type, "soup_cookie_jar_text_get_type", LIBS);
  gidLink(cast(void**)&soup_cookie_jar_text_new, "soup_cookie_jar_text_new", LIBS);

  // HSTSEnforcer
  gidLink(cast(void**)&soup_hsts_enforcer_get_type, "soup_hsts_enforcer_get_type", LIBS);
  gidLink(cast(void**)&soup_hsts_enforcer_new, "soup_hsts_enforcer_new", LIBS);
  gidLink(cast(void**)&soup_hsts_enforcer_get_domains, "soup_hsts_enforcer_get_domains", LIBS);
  gidLink(cast(void**)&soup_hsts_enforcer_get_policies, "soup_hsts_enforcer_get_policies", LIBS);
  gidLink(cast(void**)&soup_hsts_enforcer_has_valid_policy, "soup_hsts_enforcer_has_valid_policy", LIBS);
  gidLink(cast(void**)&soup_hsts_enforcer_is_persistent, "soup_hsts_enforcer_is_persistent", LIBS);
  gidLink(cast(void**)&soup_hsts_enforcer_set_policy, "soup_hsts_enforcer_set_policy", LIBS);
  gidLink(cast(void**)&soup_hsts_enforcer_set_session_policy, "soup_hsts_enforcer_set_session_policy", LIBS);

  // HSTSEnforcerDB
  gidLink(cast(void**)&soup_hsts_enforcer_db_get_type, "soup_hsts_enforcer_db_get_type", LIBS);
  gidLink(cast(void**)&soup_hsts_enforcer_db_new, "soup_hsts_enforcer_db_new", LIBS);

  // HSTSPolicy
  gidLink(cast(void**)&soup_hsts_policy_get_type, "soup_hsts_policy_get_type", LIBS);
  gidLink(cast(void**)&soup_hsts_policy_new, "soup_hsts_policy_new", LIBS);
  gidLink(cast(void**)&soup_hsts_policy_new_from_response, "soup_hsts_policy_new_from_response", LIBS);
  gidLink(cast(void**)&soup_hsts_policy_new_full, "soup_hsts_policy_new_full", LIBS);
  gidLink(cast(void**)&soup_hsts_policy_new_session_policy, "soup_hsts_policy_new_session_policy", LIBS);
  gidLink(cast(void**)&soup_hsts_policy_copy, "soup_hsts_policy_copy", LIBS);
  gidLink(cast(void**)&soup_hsts_policy_equal, "soup_hsts_policy_equal", LIBS);
  gidLink(cast(void**)&soup_hsts_policy_free, "soup_hsts_policy_free", LIBS);
  gidLink(cast(void**)&soup_hsts_policy_get_domain, "soup_hsts_policy_get_domain", LIBS);
  gidLink(cast(void**)&soup_hsts_policy_get_expires, "soup_hsts_policy_get_expires", LIBS);
  gidLink(cast(void**)&soup_hsts_policy_get_max_age, "soup_hsts_policy_get_max_age", LIBS);
  gidLink(cast(void**)&soup_hsts_policy_includes_subdomains, "soup_hsts_policy_includes_subdomains", LIBS);
  gidLink(cast(void**)&soup_hsts_policy_is_expired, "soup_hsts_policy_is_expired", LIBS);
  gidLink(cast(void**)&soup_hsts_policy_is_session_policy, "soup_hsts_policy_is_session_policy", LIBS);

  // Logger
  gidLink(cast(void**)&soup_logger_get_type, "soup_logger_get_type", LIBS);
  gidLink(cast(void**)&soup_logger_new, "soup_logger_new", LIBS);
  gidLink(cast(void**)&soup_logger_get_max_body_size, "soup_logger_get_max_body_size", LIBS);
  gidLink(cast(void**)&soup_logger_set_max_body_size, "soup_logger_set_max_body_size", LIBS);
  gidLink(cast(void**)&soup_logger_set_printer, "soup_logger_set_printer", LIBS);
  gidLink(cast(void**)&soup_logger_set_request_filter, "soup_logger_set_request_filter", LIBS);
  gidLink(cast(void**)&soup_logger_set_response_filter, "soup_logger_set_response_filter", LIBS);

  // Message
  gidLink(cast(void**)&soup_message_get_type, "soup_message_get_type", LIBS);
  gidLink(cast(void**)&soup_message_new, "soup_message_new", LIBS);
  gidLink(cast(void**)&soup_message_new_from_encoded_form, "soup_message_new_from_encoded_form", LIBS);
  gidLink(cast(void**)&soup_message_new_from_multipart, "soup_message_new_from_multipart", LIBS);
  gidLink(cast(void**)&soup_message_new_from_uri, "soup_message_new_from_uri", LIBS);
  gidLink(cast(void**)&soup_message_new_options_ping, "soup_message_new_options_ping", LIBS);
  gidLink(cast(void**)&soup_message_add_flags, "soup_message_add_flags", LIBS);
  gidLink(cast(void**)&soup_message_add_header_handler, "soup_message_add_header_handler", LIBS);
  gidLink(cast(void**)&soup_message_add_status_code_handler, "soup_message_add_status_code_handler", LIBS);
  gidLink(cast(void**)&soup_message_disable_feature, "soup_message_disable_feature", LIBS);
  gidLink(cast(void**)&soup_message_get_connection_id, "soup_message_get_connection_id", LIBS);
  gidLink(cast(void**)&soup_message_get_first_party, "soup_message_get_first_party", LIBS);
  gidLink(cast(void**)&soup_message_get_flags, "soup_message_get_flags", LIBS);
  gidLink(cast(void**)&soup_message_get_force_http1, "soup_message_get_force_http1", LIBS);
  gidLink(cast(void**)&soup_message_get_http_version, "soup_message_get_http_version", LIBS);
  gidLink(cast(void**)&soup_message_get_is_options_ping, "soup_message_get_is_options_ping", LIBS);
  gidLink(cast(void**)&soup_message_get_is_top_level_navigation, "soup_message_get_is_top_level_navigation", LIBS);
  gidLink(cast(void**)&soup_message_get_method, "soup_message_get_method", LIBS);
  gidLink(cast(void**)&soup_message_get_metrics, "soup_message_get_metrics", LIBS);
  gidLink(cast(void**)&soup_message_get_priority, "soup_message_get_priority", LIBS);
  gidLink(cast(void**)&soup_message_get_reason_phrase, "soup_message_get_reason_phrase", LIBS);
  gidLink(cast(void**)&soup_message_get_remote_address, "soup_message_get_remote_address", LIBS);
  gidLink(cast(void**)&soup_message_get_request_headers, "soup_message_get_request_headers", LIBS);
  gidLink(cast(void**)&soup_message_get_response_headers, "soup_message_get_response_headers", LIBS);
  gidLink(cast(void**)&soup_message_get_site_for_cookies, "soup_message_get_site_for_cookies", LIBS);
  gidLink(cast(void**)&soup_message_get_status, "soup_message_get_status", LIBS);
  gidLink(cast(void**)&soup_message_get_tls_ciphersuite_name, "soup_message_get_tls_ciphersuite_name", LIBS);
  gidLink(cast(void**)&soup_message_get_tls_peer_certificate, "soup_message_get_tls_peer_certificate", LIBS);
  gidLink(cast(void**)&soup_message_get_tls_peer_certificate_errors, "soup_message_get_tls_peer_certificate_errors", LIBS);
  gidLink(cast(void**)&soup_message_get_tls_protocol_version, "soup_message_get_tls_protocol_version", LIBS);
  gidLink(cast(void**)&soup_message_get_uri, "soup_message_get_uri", LIBS);
  gidLink(cast(void**)&soup_message_is_feature_disabled, "soup_message_is_feature_disabled", LIBS);
  gidLink(cast(void**)&soup_message_is_keepalive, "soup_message_is_keepalive", LIBS);
  gidLink(cast(void**)&soup_message_query_flags, "soup_message_query_flags", LIBS);
  gidLink(cast(void**)&soup_message_remove_flags, "soup_message_remove_flags", LIBS);
  gidLink(cast(void**)&soup_message_set_first_party, "soup_message_set_first_party", LIBS);
  gidLink(cast(void**)&soup_message_set_flags, "soup_message_set_flags", LIBS);
  gidLink(cast(void**)&soup_message_set_force_http1, "soup_message_set_force_http1", LIBS);
  gidLink(cast(void**)&soup_message_set_is_options_ping, "soup_message_set_is_options_ping", LIBS);
  gidLink(cast(void**)&soup_message_set_is_top_level_navigation, "soup_message_set_is_top_level_navigation", LIBS);
  gidLink(cast(void**)&soup_message_set_method, "soup_message_set_method", LIBS);
  gidLink(cast(void**)&soup_message_set_priority, "soup_message_set_priority", LIBS);
  gidLink(cast(void**)&soup_message_set_request_body, "soup_message_set_request_body", LIBS);
  gidLink(cast(void**)&soup_message_set_request_body_from_bytes, "soup_message_set_request_body_from_bytes", LIBS);
  gidLink(cast(void**)&soup_message_set_site_for_cookies, "soup_message_set_site_for_cookies", LIBS);
  gidLink(cast(void**)&soup_message_set_tls_client_certificate, "soup_message_set_tls_client_certificate", LIBS);
  gidLink(cast(void**)&soup_message_set_uri, "soup_message_set_uri", LIBS);
  gidLink(cast(void**)&soup_message_tls_client_certificate_password_request_complete, "soup_message_tls_client_certificate_password_request_complete", LIBS);

  // MessageBody
  gidLink(cast(void**)&soup_message_body_get_type, "soup_message_body_get_type", LIBS);
  gidLink(cast(void**)&soup_message_body_new, "soup_message_body_new", LIBS);
  gidLink(cast(void**)&soup_message_body_append, "soup_message_body_append", LIBS);
  gidLink(cast(void**)&soup_message_body_append_bytes, "soup_message_body_append_bytes", LIBS);
  gidLink(cast(void**)&soup_message_body_append_take, "soup_message_body_append_take", LIBS);
  gidLink(cast(void**)&soup_message_body_complete, "soup_message_body_complete", LIBS);
  gidLink(cast(void**)&soup_message_body_flatten, "soup_message_body_flatten", LIBS);
  gidLink(cast(void**)&soup_message_body_get_accumulate, "soup_message_body_get_accumulate", LIBS);
  gidLink(cast(void**)&soup_message_body_get_chunk, "soup_message_body_get_chunk", LIBS);
  gidLink(cast(void**)&soup_message_body_got_chunk, "soup_message_body_got_chunk", LIBS);
  gidLink(cast(void**)&soup_message_body_ref, "soup_message_body_ref", LIBS);
  gidLink(cast(void**)&soup_message_body_set_accumulate, "soup_message_body_set_accumulate", LIBS);
  gidLink(cast(void**)&soup_message_body_truncate, "soup_message_body_truncate", LIBS);
  gidLink(cast(void**)&soup_message_body_unref, "soup_message_body_unref", LIBS);
  gidLink(cast(void**)&soup_message_body_wrote_chunk, "soup_message_body_wrote_chunk", LIBS);

  // MessageHeaders
  gidLink(cast(void**)&soup_message_headers_get_type, "soup_message_headers_get_type", LIBS);
  gidLink(cast(void**)&soup_message_headers_new, "soup_message_headers_new", LIBS);
  gidLink(cast(void**)&soup_message_headers_append, "soup_message_headers_append", LIBS);
  gidLink(cast(void**)&soup_message_headers_clean_connection_headers, "soup_message_headers_clean_connection_headers", LIBS);
  gidLink(cast(void**)&soup_message_headers_clear, "soup_message_headers_clear", LIBS);
  gidLink(cast(void**)&soup_message_headers_foreach, "soup_message_headers_foreach", LIBS);
  gidLink(cast(void**)&soup_message_headers_free_ranges, "soup_message_headers_free_ranges", LIBS);
  gidLink(cast(void**)&soup_message_headers_get_content_disposition, "soup_message_headers_get_content_disposition", LIBS);
  gidLink(cast(void**)&soup_message_headers_get_content_length, "soup_message_headers_get_content_length", LIBS);
  gidLink(cast(void**)&soup_message_headers_get_content_range, "soup_message_headers_get_content_range", LIBS);
  gidLink(cast(void**)&soup_message_headers_get_content_type, "soup_message_headers_get_content_type", LIBS);
  gidLink(cast(void**)&soup_message_headers_get_encoding, "soup_message_headers_get_encoding", LIBS);
  gidLink(cast(void**)&soup_message_headers_get_expectations, "soup_message_headers_get_expectations", LIBS);
  gidLink(cast(void**)&soup_message_headers_get_headers_type, "soup_message_headers_get_headers_type", LIBS);
  gidLink(cast(void**)&soup_message_headers_get_list, "soup_message_headers_get_list", LIBS);
  gidLink(cast(void**)&soup_message_headers_get_one, "soup_message_headers_get_one", LIBS);
  gidLink(cast(void**)&soup_message_headers_get_ranges, "soup_message_headers_get_ranges", LIBS);
  gidLink(cast(void**)&soup_message_headers_header_contains, "soup_message_headers_header_contains", LIBS);
  gidLink(cast(void**)&soup_message_headers_header_equals, "soup_message_headers_header_equals", LIBS);
  gidLink(cast(void**)&soup_message_headers_ref, "soup_message_headers_ref", LIBS);
  gidLink(cast(void**)&soup_message_headers_remove, "soup_message_headers_remove", LIBS);
  gidLink(cast(void**)&soup_message_headers_replace, "soup_message_headers_replace", LIBS);
  gidLink(cast(void**)&soup_message_headers_set_content_disposition, "soup_message_headers_set_content_disposition", LIBS);
  gidLink(cast(void**)&soup_message_headers_set_content_length, "soup_message_headers_set_content_length", LIBS);
  gidLink(cast(void**)&soup_message_headers_set_content_range, "soup_message_headers_set_content_range", LIBS);
  gidLink(cast(void**)&soup_message_headers_set_content_type, "soup_message_headers_set_content_type", LIBS);
  gidLink(cast(void**)&soup_message_headers_set_encoding, "soup_message_headers_set_encoding", LIBS);
  gidLink(cast(void**)&soup_message_headers_set_expectations, "soup_message_headers_set_expectations", LIBS);
  gidLink(cast(void**)&soup_message_headers_set_range, "soup_message_headers_set_range", LIBS);
  gidLink(cast(void**)&soup_message_headers_set_ranges, "soup_message_headers_set_ranges", LIBS);
  gidLink(cast(void**)&soup_message_headers_unref, "soup_message_headers_unref", LIBS);

  // MessageHeadersIter
  gidLink(cast(void**)&soup_message_headers_iter_next, "soup_message_headers_iter_next", LIBS);
  gidLink(cast(void**)&soup_message_headers_iter_init, "soup_message_headers_iter_init", LIBS);

  // MessageMetrics
  gidLink(cast(void**)&soup_message_metrics_get_type, "soup_message_metrics_get_type", LIBS);
  gidLink(cast(void**)&soup_message_metrics_copy, "soup_message_metrics_copy", LIBS);
  gidLink(cast(void**)&soup_message_metrics_free, "soup_message_metrics_free", LIBS);
  gidLink(cast(void**)&soup_message_metrics_get_connect_end, "soup_message_metrics_get_connect_end", LIBS);
  gidLink(cast(void**)&soup_message_metrics_get_connect_start, "soup_message_metrics_get_connect_start", LIBS);
  gidLink(cast(void**)&soup_message_metrics_get_dns_end, "soup_message_metrics_get_dns_end", LIBS);
  gidLink(cast(void**)&soup_message_metrics_get_dns_start, "soup_message_metrics_get_dns_start", LIBS);
  gidLink(cast(void**)&soup_message_metrics_get_fetch_start, "soup_message_metrics_get_fetch_start", LIBS);
  gidLink(cast(void**)&soup_message_metrics_get_request_body_bytes_sent, "soup_message_metrics_get_request_body_bytes_sent", LIBS);
  gidLink(cast(void**)&soup_message_metrics_get_request_body_size, "soup_message_metrics_get_request_body_size", LIBS);
  gidLink(cast(void**)&soup_message_metrics_get_request_header_bytes_sent, "soup_message_metrics_get_request_header_bytes_sent", LIBS);
  gidLink(cast(void**)&soup_message_metrics_get_request_start, "soup_message_metrics_get_request_start", LIBS);
  gidLink(cast(void**)&soup_message_metrics_get_response_body_bytes_received, "soup_message_metrics_get_response_body_bytes_received", LIBS);
  gidLink(cast(void**)&soup_message_metrics_get_response_body_size, "soup_message_metrics_get_response_body_size", LIBS);
  gidLink(cast(void**)&soup_message_metrics_get_response_end, "soup_message_metrics_get_response_end", LIBS);
  gidLink(cast(void**)&soup_message_metrics_get_response_header_bytes_received, "soup_message_metrics_get_response_header_bytes_received", LIBS);
  gidLink(cast(void**)&soup_message_metrics_get_response_start, "soup_message_metrics_get_response_start", LIBS);
  gidLink(cast(void**)&soup_message_metrics_get_tls_start, "soup_message_metrics_get_tls_start", LIBS);

  // Multipart
  gidLink(cast(void**)&soup_multipart_get_type, "soup_multipart_get_type", LIBS);
  gidLink(cast(void**)&soup_multipart_new, "soup_multipart_new", LIBS);
  gidLink(cast(void**)&soup_multipart_new_from_message, "soup_multipart_new_from_message", LIBS);
  gidLink(cast(void**)&soup_multipart_append_form_file, "soup_multipart_append_form_file", LIBS);
  gidLink(cast(void**)&soup_multipart_append_form_string, "soup_multipart_append_form_string", LIBS);
  gidLink(cast(void**)&soup_multipart_append_part, "soup_multipart_append_part", LIBS);
  gidLink(cast(void**)&soup_multipart_free, "soup_multipart_free", LIBS);
  gidLink(cast(void**)&soup_multipart_get_length, "soup_multipart_get_length", LIBS);
  gidLink(cast(void**)&soup_multipart_get_part, "soup_multipart_get_part", LIBS);
  gidLink(cast(void**)&soup_multipart_to_message, "soup_multipart_to_message", LIBS);

  // MultipartInputStream
  gidLink(cast(void**)&soup_multipart_input_stream_get_type, "soup_multipart_input_stream_get_type", LIBS);
  gidLink(cast(void**)&soup_multipart_input_stream_new, "soup_multipart_input_stream_new", LIBS);
  gidLink(cast(void**)&soup_multipart_input_stream_get_headers, "soup_multipart_input_stream_get_headers", LIBS);
  gidLink(cast(void**)&soup_multipart_input_stream_next_part, "soup_multipart_input_stream_next_part", LIBS);
  gidLink(cast(void**)&soup_multipart_input_stream_next_part_async, "soup_multipart_input_stream_next_part_async", LIBS);
  gidLink(cast(void**)&soup_multipart_input_stream_next_part_finish, "soup_multipart_input_stream_next_part_finish", LIBS);

  // Server
  gidLink(cast(void**)&soup_server_get_type, "soup_server_get_type", LIBS);
  gidLink(cast(void**)&soup_server_new, "soup_server_new", LIBS);
  gidLink(cast(void**)&soup_server_accept_iostream, "soup_server_accept_iostream", LIBS);
  gidLink(cast(void**)&soup_server_add_auth_domain, "soup_server_add_auth_domain", LIBS);
  gidLink(cast(void**)&soup_server_add_early_handler, "soup_server_add_early_handler", LIBS);
  gidLink(cast(void**)&soup_server_add_handler, "soup_server_add_handler", LIBS);
  gidLink(cast(void**)&soup_server_add_websocket_extension, "soup_server_add_websocket_extension", LIBS);
  gidLink(cast(void**)&soup_server_add_websocket_handler, "soup_server_add_websocket_handler", LIBS);
  gidLink(cast(void**)&soup_server_disconnect, "soup_server_disconnect", LIBS);
  gidLink(cast(void**)&soup_server_get_listeners, "soup_server_get_listeners", LIBS);
  gidLink(cast(void**)&soup_server_get_tls_auth_mode, "soup_server_get_tls_auth_mode", LIBS);
  gidLink(cast(void**)&soup_server_get_tls_certificate, "soup_server_get_tls_certificate", LIBS);
  gidLink(cast(void**)&soup_server_get_tls_database, "soup_server_get_tls_database", LIBS);
  gidLink(cast(void**)&soup_server_get_uris, "soup_server_get_uris", LIBS);
  gidLink(cast(void**)&soup_server_is_https, "soup_server_is_https", LIBS);
  gidLink(cast(void**)&soup_server_listen, "soup_server_listen", LIBS);
  gidLink(cast(void**)&soup_server_listen_all, "soup_server_listen_all", LIBS);
  gidLink(cast(void**)&soup_server_listen_local, "soup_server_listen_local", LIBS);
  gidLink(cast(void**)&soup_server_listen_socket, "soup_server_listen_socket", LIBS);
  gidLink(cast(void**)&soup_server_pause_message, "soup_server_pause_message", LIBS);
  gidLink(cast(void**)&soup_server_remove_auth_domain, "soup_server_remove_auth_domain", LIBS);
  gidLink(cast(void**)&soup_server_remove_handler, "soup_server_remove_handler", LIBS);
  gidLink(cast(void**)&soup_server_remove_websocket_extension, "soup_server_remove_websocket_extension", LIBS);
  gidLink(cast(void**)&soup_server_set_tls_auth_mode, "soup_server_set_tls_auth_mode", LIBS);
  gidLink(cast(void**)&soup_server_set_tls_certificate, "soup_server_set_tls_certificate", LIBS);
  gidLink(cast(void**)&soup_server_set_tls_database, "soup_server_set_tls_database", LIBS);
  gidLink(cast(void**)&soup_server_unpause_message, "soup_server_unpause_message", LIBS);

  // ServerMessage
  gidLink(cast(void**)&soup_server_message_get_type, "soup_server_message_get_type", LIBS);
  gidLink(cast(void**)&soup_server_message_get_http_version, "soup_server_message_get_http_version", LIBS);
  gidLink(cast(void**)&soup_server_message_get_local_address, "soup_server_message_get_local_address", LIBS);
  gidLink(cast(void**)&soup_server_message_get_method, "soup_server_message_get_method", LIBS);
  gidLink(cast(void**)&soup_server_message_get_reason_phrase, "soup_server_message_get_reason_phrase", LIBS);
  gidLink(cast(void**)&soup_server_message_get_remote_address, "soup_server_message_get_remote_address", LIBS);
  gidLink(cast(void**)&soup_server_message_get_remote_host, "soup_server_message_get_remote_host", LIBS);
  gidLink(cast(void**)&soup_server_message_get_request_body, "soup_server_message_get_request_body", LIBS);
  gidLink(cast(void**)&soup_server_message_get_request_headers, "soup_server_message_get_request_headers", LIBS);
  gidLink(cast(void**)&soup_server_message_get_response_body, "soup_server_message_get_response_body", LIBS);
  gidLink(cast(void**)&soup_server_message_get_response_headers, "soup_server_message_get_response_headers", LIBS);
  gidLink(cast(void**)&soup_server_message_get_socket, "soup_server_message_get_socket", LIBS);
  gidLink(cast(void**)&soup_server_message_get_status, "soup_server_message_get_status", LIBS);
  gidLink(cast(void**)&soup_server_message_get_tls_peer_certificate, "soup_server_message_get_tls_peer_certificate", LIBS);
  gidLink(cast(void**)&soup_server_message_get_tls_peer_certificate_errors, "soup_server_message_get_tls_peer_certificate_errors", LIBS);
  gidLink(cast(void**)&soup_server_message_get_uri, "soup_server_message_get_uri", LIBS);
  gidLink(cast(void**)&soup_server_message_is_options_ping, "soup_server_message_is_options_ping", LIBS);
  gidLink(cast(void**)&soup_server_message_pause, "soup_server_message_pause", LIBS);
  gidLink(cast(void**)&soup_server_message_set_http_version, "soup_server_message_set_http_version", LIBS);
  gidLink(cast(void**)&soup_server_message_set_redirect, "soup_server_message_set_redirect", LIBS);
  gidLink(cast(void**)&soup_server_message_set_response, "soup_server_message_set_response", LIBS);
  gidLink(cast(void**)&soup_server_message_set_status, "soup_server_message_set_status", LIBS);
  gidLink(cast(void**)&soup_server_message_steal_connection, "soup_server_message_steal_connection", LIBS);
  gidLink(cast(void**)&soup_server_message_unpause, "soup_server_message_unpause", LIBS);

  // Session
  gidLink(cast(void**)&soup_session_get_type, "soup_session_get_type", LIBS);
  gidLink(cast(void**)&soup_session_new, "soup_session_new", LIBS);
  gidLink(cast(void**)&soup_session_new_with_options, "soup_session_new_with_options", LIBS);
  gidLink(cast(void**)&soup_session_abort, "soup_session_abort", LIBS);
  gidLink(cast(void**)&soup_session_add_feature, "soup_session_add_feature", LIBS);
  gidLink(cast(void**)&soup_session_add_feature_by_type, "soup_session_add_feature_by_type", LIBS);
  gidLink(cast(void**)&soup_session_get_accept_language, "soup_session_get_accept_language", LIBS);
  gidLink(cast(void**)&soup_session_get_accept_language_auto, "soup_session_get_accept_language_auto", LIBS);
  gidLink(cast(void**)&soup_session_get_async_result_message, "soup_session_get_async_result_message", LIBS);
  gidLink(cast(void**)&soup_session_get_feature, "soup_session_get_feature", LIBS);
  gidLink(cast(void**)&soup_session_get_feature_for_message, "soup_session_get_feature_for_message", LIBS);
  gidLink(cast(void**)&soup_session_get_idle_timeout, "soup_session_get_idle_timeout", LIBS);
  gidLink(cast(void**)&soup_session_get_local_address, "soup_session_get_local_address", LIBS);
  gidLink(cast(void**)&soup_session_get_max_conns, "soup_session_get_max_conns", LIBS);
  gidLink(cast(void**)&soup_session_get_max_conns_per_host, "soup_session_get_max_conns_per_host", LIBS);
  gidLink(cast(void**)&soup_session_get_proxy_resolver, "soup_session_get_proxy_resolver", LIBS);
  gidLink(cast(void**)&soup_session_get_remote_connectable, "soup_session_get_remote_connectable", LIBS);
  gidLink(cast(void**)&soup_session_get_timeout, "soup_session_get_timeout", LIBS);
  gidLink(cast(void**)&soup_session_get_tls_database, "soup_session_get_tls_database", LIBS);
  gidLink(cast(void**)&soup_session_get_tls_interaction, "soup_session_get_tls_interaction", LIBS);
  gidLink(cast(void**)&soup_session_get_user_agent, "soup_session_get_user_agent", LIBS);
  gidLink(cast(void**)&soup_session_has_feature, "soup_session_has_feature", LIBS);
  gidLink(cast(void**)&soup_session_preconnect_async, "soup_session_preconnect_async", LIBS);
  gidLink(cast(void**)&soup_session_preconnect_finish, "soup_session_preconnect_finish", LIBS);
  gidLink(cast(void**)&soup_session_remove_feature, "soup_session_remove_feature", LIBS);
  gidLink(cast(void**)&soup_session_remove_feature_by_type, "soup_session_remove_feature_by_type", LIBS);
  gidLink(cast(void**)&soup_session_send, "soup_session_send", LIBS);
  gidLink(cast(void**)&soup_session_send_and_read, "soup_session_send_and_read", LIBS);
  gidLink(cast(void**)&soup_session_send_and_read_async, "soup_session_send_and_read_async", LIBS);
  gidLink(cast(void**)&soup_session_send_and_read_finish, "soup_session_send_and_read_finish", LIBS);
  gidLink(cast(void**)&soup_session_send_and_splice, "soup_session_send_and_splice", LIBS);
  gidLink(cast(void**)&soup_session_send_and_splice_async, "soup_session_send_and_splice_async", LIBS);
  gidLink(cast(void**)&soup_session_send_and_splice_finish, "soup_session_send_and_splice_finish", LIBS);
  gidLink(cast(void**)&soup_session_send_async, "soup_session_send_async", LIBS);
  gidLink(cast(void**)&soup_session_send_finish, "soup_session_send_finish", LIBS);
  gidLink(cast(void**)&soup_session_set_accept_language, "soup_session_set_accept_language", LIBS);
  gidLink(cast(void**)&soup_session_set_accept_language_auto, "soup_session_set_accept_language_auto", LIBS);
  gidLink(cast(void**)&soup_session_set_idle_timeout, "soup_session_set_idle_timeout", LIBS);
  gidLink(cast(void**)&soup_session_set_proxy_resolver, "soup_session_set_proxy_resolver", LIBS);
  gidLink(cast(void**)&soup_session_set_timeout, "soup_session_set_timeout", LIBS);
  gidLink(cast(void**)&soup_session_set_tls_database, "soup_session_set_tls_database", LIBS);
  gidLink(cast(void**)&soup_session_set_tls_interaction, "soup_session_set_tls_interaction", LIBS);
  gidLink(cast(void**)&soup_session_set_user_agent, "soup_session_set_user_agent", LIBS);
  gidLink(cast(void**)&soup_session_websocket_connect_async, "soup_session_websocket_connect_async", LIBS);
  gidLink(cast(void**)&soup_session_websocket_connect_finish, "soup_session_websocket_connect_finish", LIBS);

  // SessionFeature
  gidLink(cast(void**)&soup_session_feature_get_type, "soup_session_feature_get_type", LIBS);

  // WebsocketConnection
  gidLink(cast(void**)&soup_websocket_connection_get_type, "soup_websocket_connection_get_type", LIBS);
  gidLink(cast(void**)&soup_websocket_connection_new, "soup_websocket_connection_new", LIBS);
  gidLink(cast(void**)&soup_websocket_connection_close, "soup_websocket_connection_close", LIBS);
  gidLink(cast(void**)&soup_websocket_connection_get_close_code, "soup_websocket_connection_get_close_code", LIBS);
  gidLink(cast(void**)&soup_websocket_connection_get_close_data, "soup_websocket_connection_get_close_data", LIBS);
  gidLink(cast(void**)&soup_websocket_connection_get_connection_type, "soup_websocket_connection_get_connection_type", LIBS);
  gidLink(cast(void**)&soup_websocket_connection_get_extensions, "soup_websocket_connection_get_extensions", LIBS);
  gidLink(cast(void**)&soup_websocket_connection_get_io_stream, "soup_websocket_connection_get_io_stream", LIBS);
  gidLink(cast(void**)&soup_websocket_connection_get_keepalive_interval, "soup_websocket_connection_get_keepalive_interval", LIBS);
  gidLink(cast(void**)&soup_websocket_connection_get_max_incoming_payload_size, "soup_websocket_connection_get_max_incoming_payload_size", LIBS);
  gidLink(cast(void**)&soup_websocket_connection_get_origin, "soup_websocket_connection_get_origin", LIBS);
  gidLink(cast(void**)&soup_websocket_connection_get_protocol, "soup_websocket_connection_get_protocol", LIBS);
  gidLink(cast(void**)&soup_websocket_connection_get_state, "soup_websocket_connection_get_state", LIBS);
  gidLink(cast(void**)&soup_websocket_connection_get_uri, "soup_websocket_connection_get_uri", LIBS);
  gidLink(cast(void**)&soup_websocket_connection_send_binary, "soup_websocket_connection_send_binary", LIBS);
  gidLink(cast(void**)&soup_websocket_connection_send_message, "soup_websocket_connection_send_message", LIBS);
  gidLink(cast(void**)&soup_websocket_connection_send_text, "soup_websocket_connection_send_text", LIBS);
  gidLink(cast(void**)&soup_websocket_connection_set_keepalive_interval, "soup_websocket_connection_set_keepalive_interval", LIBS);
  gidLink(cast(void**)&soup_websocket_connection_set_max_incoming_payload_size, "soup_websocket_connection_set_max_incoming_payload_size", LIBS);

  // WebsocketExtension
  gidLink(cast(void**)&soup_websocket_extension_get_type, "soup_websocket_extension_get_type", LIBS);
  gidLink(cast(void**)&soup_websocket_extension_configure, "soup_websocket_extension_configure", LIBS);
  gidLink(cast(void**)&soup_websocket_extension_get_request_params, "soup_websocket_extension_get_request_params", LIBS);
  gidLink(cast(void**)&soup_websocket_extension_get_response_params, "soup_websocket_extension_get_response_params", LIBS);
  gidLink(cast(void**)&soup_websocket_extension_process_incoming_message, "soup_websocket_extension_process_incoming_message", LIBS);
  gidLink(cast(void**)&soup_websocket_extension_process_outgoing_message, "soup_websocket_extension_process_outgoing_message", LIBS);

  // WebsocketExtensionDeflate
  gidLink(cast(void**)&soup_websocket_extension_deflate_get_type, "soup_websocket_extension_deflate_get_type", LIBS);

  // WebsocketExtensionManager
  gidLink(cast(void**)&soup_websocket_extension_manager_get_type, "soup_websocket_extension_manager_get_type", LIBS);

  // global
  gidLink(cast(void**)&soup_check_version, "soup_check_version", LIBS);
  gidLink(cast(void**)&soup_cookies_free, "soup_cookies_free", LIBS);
  gidLink(cast(void**)&soup_cookies_from_request, "soup_cookies_from_request", LIBS);
  gidLink(cast(void**)&soup_cookies_from_response, "soup_cookies_from_response", LIBS);
  gidLink(cast(void**)&soup_cookies_to_cookie_header, "soup_cookies_to_cookie_header", LIBS);
  gidLink(cast(void**)&soup_cookies_to_request, "soup_cookies_to_request", LIBS);
  gidLink(cast(void**)&soup_cookies_to_response, "soup_cookies_to_response", LIBS);
  gidLink(cast(void**)&soup_date_time_new_from_http_string, "soup_date_time_new_from_http_string", LIBS);
  gidLink(cast(void**)&soup_date_time_to_string, "soup_date_time_to_string", LIBS);
  gidLink(cast(void**)&soup_form_decode, "soup_form_decode", LIBS);
  gidLink(cast(void**)&soup_form_decode_multipart, "soup_form_decode_multipart", LIBS);
  gidLink(cast(void**)&soup_form_encode, "soup_form_encode", LIBS);
  gidLink(cast(void**)&soup_form_encode_datalist, "soup_form_encode_datalist", LIBS);
  gidLink(cast(void**)&soup_form_encode_hash, "soup_form_encode_hash", LIBS);
  gidLink(cast(void**)&soup_form_encode_valist, "soup_form_encode_valist", LIBS);
  gidLink(cast(void**)&soup_get_major_version, "soup_get_major_version", LIBS);
  gidLink(cast(void**)&soup_get_micro_version, "soup_get_micro_version", LIBS);
  gidLink(cast(void**)&soup_get_minor_version, "soup_get_minor_version", LIBS);
  gidLink(cast(void**)&soup_header_contains, "soup_header_contains", LIBS);
  gidLink(cast(void**)&soup_header_free_list, "soup_header_free_list", LIBS);
  gidLink(cast(void**)&soup_header_free_param_list, "soup_header_free_param_list", LIBS);
  gidLink(cast(void**)&soup_header_g_string_append_param, "soup_header_g_string_append_param", LIBS);
  gidLink(cast(void**)&soup_header_g_string_append_param_quoted, "soup_header_g_string_append_param_quoted", LIBS);
  gidLink(cast(void**)&soup_header_parse_list, "soup_header_parse_list", LIBS);
  gidLink(cast(void**)&soup_header_parse_param_list, "soup_header_parse_param_list", LIBS);
  gidLink(cast(void**)&soup_header_parse_param_list_strict, "soup_header_parse_param_list_strict", LIBS);
  gidLink(cast(void**)&soup_header_parse_quality_list, "soup_header_parse_quality_list", LIBS);
  gidLink(cast(void**)&soup_header_parse_semi_param_list, "soup_header_parse_semi_param_list", LIBS);
  gidLink(cast(void**)&soup_header_parse_semi_param_list_strict, "soup_header_parse_semi_param_list_strict", LIBS);
  gidLink(cast(void**)&soup_headers_parse, "soup_headers_parse", LIBS);
  gidLink(cast(void**)&soup_headers_parse_request, "soup_headers_parse_request", LIBS);
  gidLink(cast(void**)&soup_headers_parse_response, "soup_headers_parse_response", LIBS);
  gidLink(cast(void**)&soup_headers_parse_status_line, "soup_headers_parse_status_line", LIBS);
  gidLink(cast(void**)&soup_tld_domain_is_public_suffix, "soup_tld_domain_is_public_suffix", LIBS);
  gidLink(cast(void**)&soup_tld_get_base_domain, "soup_tld_get_base_domain", LIBS);
  gidLink(cast(void**)&soup_uri_copy, "soup_uri_copy", LIBS);
  gidLink(cast(void**)&soup_uri_decode_data_uri, "soup_uri_decode_data_uri", LIBS);
  gidLink(cast(void**)&soup_uri_equal, "soup_uri_equal", LIBS);
  gidLink(cast(void**)&soup_websocket_client_prepare_handshake, "soup_websocket_client_prepare_handshake", LIBS);
  gidLink(cast(void**)&soup_websocket_client_verify_handshake, "soup_websocket_client_verify_handshake", LIBS);
  gidLink(cast(void**)&soup_websocket_server_check_handshake, "soup_websocket_server_check_handshake", LIBS);
  gidLink(cast(void**)&soup_websocket_server_process_handshake, "soup_websocket_server_process_handshake", LIBS);
}
