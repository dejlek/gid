module soup.global;

import gid.gid;
import glib.bytes;
import glib.date_time;
import glib.error;
import glib.string_;
import glib.types;
import glib.uri;
import soup.c.functions;
import soup.c.types;
import soup.cookie;
import soup.message;
import soup.message_headers;
import soup.multipart;
import soup.types;


/**
 * Like funcCHECK_VERSION, but the check for soup_check_version is
 * at runtime instead of compile time.
 * This is useful for compiling against older versions of libsoup, but using
 * features from newer versions.
 * Params:
 *   major = the major version to check
 *   minor = the minor version to check
 *   micro = the micro version to check
 * Returns: %TRUE if the version of the libsoup currently loaded
 *   is the same as or newer than the passed-in version.
 */
bool checkVersion(uint major, uint minor, uint micro)
{
  bool _retval;
  _retval = soup_check_version(major, minor, micro);
  return _retval;
}

/**
 * Parses msg's Cookie request header and returns a [GLib.SList] of
 * `SoupCookie`s.
 * As the "Cookie" header, unlike "Set-Cookie", only contains cookie names and
 * values, none of the other #SoupCookie fields will be filled in. $(LPAREN)Thus, you
 * can't generally pass a cookie returned from this method directly to
 * funccookies_to_response.$(RPAREN)
 * Params:
 *   msg = a #SoupMessage containing a "Cookie" request header
 * Returns: a #GSList of
 *   `SoupCookie`s, which can be freed with [Soup.Cookie.free].
 */
Cookie[] cookiesFromRequest(Message msg)
{
  GSList* _cretval;
  _cretval = soup_cookies_from_request(msg ? cast(SoupMessage*)msg.cPtr(No.Dup) : null);
  auto _retval = gSListToD!(Cookie, GidOwnership.Full)(cast(GSList*)_cretval);
  return _retval;
}

/**
 * Parses msg's Set-Cookie response headers and returns a [GLib.SList]
 * of `SoupCookie`s.
 * Cookies that do not specify "path" or "domain" attributes will have their
 * values defaulted from msg.
 * Params:
 *   msg = a #SoupMessage containing a "Set-Cookie" response header
 * Returns: a #GSList of
 *   `SoupCookie`s, which can be freed with [Soup.Cookie.free].
 */
Cookie[] cookiesFromResponse(Message msg)
{
  GSList* _cretval;
  _cretval = soup_cookies_from_response(msg ? cast(SoupMessage*)msg.cPtr(No.Dup) : null);
  auto _retval = gSListToD!(Cookie, GidOwnership.Full)(cast(GSList*)_cretval);
  return _retval;
}

/**
 * Serializes a [GLib.SList] of #SoupCookie into a string suitable for
 * setting as the value of the "Cookie" header.
 * Params:
 *   cookies = a #GSList of #SoupCookie
 * Returns: the serialization of cookies
 */
string cookiesToCookieHeader(Cookie[] cookies)
{
  char* _cretval;
  auto _cookies = gSListFromD!(Cookie)(cookies);
  scope(exit) containerFree!(GSList*, Cookie, GidOwnership.None)(_cookies);
  _cretval = soup_cookies_to_cookie_header(_cookies);
  string _retval = _cretval.fromCString(Yes.Free);
  return _retval;
}

/**
 * Adds the name and value of each cookie in cookies to msg's
 * "Cookie" request.
 * If msg already has a "Cookie" request header, these cookies will be appended
 * to the cookies already present. Be careful that you do not append the same
 * cookies twice, eg, when requeuing a message.
 * Params:
 *   cookies = a #GSList of #SoupCookie
 *   msg = a #SoupMessage
 */
void cookiesToRequest(Cookie[] cookies, Message msg)
{
  auto _cookies = gSListFromD!(Cookie)(cookies);
  scope(exit) containerFree!(GSList*, Cookie, GidOwnership.None)(_cookies);
  soup_cookies_to_request(_cookies, msg ? cast(SoupMessage*)msg.cPtr(No.Dup) : null);
}

/**
 * Appends a "Set-Cookie" response header to msg for each cookie in
 * cookies.
 * This is in addition to any other "Set-Cookie" headers
 * msg may already have.
 * Params:
 *   cookies = a #GSList of #SoupCookie
 *   msg = a #SoupMessage
 */
void cookiesToResponse(Cookie[] cookies, Message msg)
{
  auto _cookies = gSListFromD!(Cookie)(cookies);
  scope(exit) containerFree!(GSList*, Cookie, GidOwnership.None)(_cookies);
  soup_cookies_to_response(_cookies, msg ? cast(SoupMessage*)msg.cPtr(No.Dup) : null);
}

/**
 * Parses date_string and tries to extract a date from it.
 * This recognizes all of the "HTTP-date" formats from RFC 2616, RFC 2822 dates,
 * and reasonable approximations thereof. $(LPAREN)Eg, it is lenient about whitespace,
 * leading "0"s, etc.$(RPAREN)
 * Params:
 *   dateString = The date as a string
 * Returns: a new #GDateTime, or %NULL if date_string
 *   could not be parsed.
 */
DateTime dateTimeNewFromHttpString(string dateString)
{
  GDateTime* _cretval;
  const(char)* _dateString = dateString.toCString(No.Alloc);
  _cretval = soup_date_time_new_from_http_string(_dateString);
  auto _retval = _cretval ? new DateTime(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
 * Converts date to a string in the format described by format.
 * Params:
 *   date = a #GDateTime
 *   format = the format to generate the date in
 * Returns: date as a string or %NULL
 */
string dateTimeToString(DateTime date, DateFormat format)
{
  char* _cretval;
  _cretval = soup_date_time_to_string(date ? cast(GDateTime*)date.cPtr(No.Dup) : null, format);
  string _retval = _cretval.fromCString(Yes.Free);
  return _retval;
}

/**
 * Decodes form.
 * which is an urlencoded dataset as defined in the HTML 4.01 spec.
 * Params:
 *   encodedForm = data of type "application/x-www-form-urlencoded"
 * Returns: a hash
 *   table containing the name/value pairs from encoded_form, which you
 *   can free with [GLib.HashTable.destroy].
 */
string[string] formDecode(string encodedForm)
{
  GHashTable* _cretval;
  const(char)* _encodedForm = encodedForm.toCString(No.Alloc);
  _cretval = soup_form_decode(_encodedForm);
  auto _retval = gHashTableToD!(string, string, GidOwnership.Container)(cast(GHashTable*)_cretval);
  return _retval;
}

/**
 * Decodes the "multipart/form-data" request in multipart.
 * this is a convenience method for the case when you have a single file upload
 * control in a form. $(LPAREN)Or when you don't have any file upload controls, but are
 * still using "multipart/form-data" anyway.$(RPAREN) Pass the name of the file upload
 * control in file_control_name, and funcform_decode_multipart will extract
 * the uploaded file data into filename, content_type, and file. All of the
 * other form control data will be returned $(LPAREN)as strings, as with
 * funcform_decode in the returned [GLib.HashTable].
 * You may pass %NULL for filename, content_type and/or file if you do not
 * care about those fields. funcform_decode_multipart may also
 * return %NULL in those fields if the client did not provide that
 * information. You must free the returned filename and content-type
 * with funcGLib.free, and the returned file data with methodGlib.Bytes.unref.
 * If you have a form with more than one file upload control, you will
 * need to decode it manually, using [Soup.Multipart.newFromMessage]
 * and [Soup.Multipart.getPart].
 * Params:
 *   multipart = a #SoupMultipart
 *   fileControlName = the name of the HTML file upload control
 *   filename = return location for the name of the uploaded file
 *   contentType = return location for the MIME type of the uploaded file
 *   file = return location for the uploaded file data
 * Returns: a hash table containing the name/value pairs $(LPAREN)other than
 *   file_control_name$(RPAREN) from msg, which you can free with
 *   [GLib.HashTable.destroy]. On error, it will return %NULL.
 */
string[string] formDecodeMultipart(Multipart multipart, string fileControlName, out string filename, out string contentType, out Bytes file)
{
  GHashTable* _cretval;
  const(char)* _fileControlName = fileControlName.toCString(No.Alloc);
  char* _filename;
  char* _contentType;
  GBytes* _file;
  _cretval = soup_form_decode_multipart(multipart ? cast(SoupMultipart*)multipart.cPtr(No.Dup) : null, _fileControlName, &_filename, &_contentType, &_file);
  auto _retval = gHashTableToD!(string, string, GidOwnership.Container)(cast(GHashTable*)_cretval);
  filename = _filename.fromCString(Yes.Free);
  contentType = _contentType.fromCString(Yes.Free);
  file = new Bytes(cast(void*)_file, Yes.Take);
  return _retval;
}

/**
 * Encodes form_data_set into a value of type
 * "application/x-www-form-urlencoded".
 * Encodes as defined in the HTML 4.01 spec. Unlike funcform_encode_hash,
 * this preserves the ordering of the form elements, which may be required in
 * some situations.
 * See also: [Soup.Message.newFromEncodedForm].
 * Params:
 *   formDataSet = a datalist containing name/value pairs
 * Returns: the encoded form
 */
string formEncodeDatalist(Data formDataSet)
{
  char* _cretval;
  _cretval = soup_form_encode_datalist(formDataSet);
  string _retval = _cretval.fromCString(Yes.Free);
  return _retval;
}

/**
 * Encodes form_data_set into a value of type
 * "application/x-www-form-urlencoded".
 * Encodes as defined in the HTML 4.01 spec.
 * Note that the HTML spec states that "The control names/values are
 * listed in the order they appear in the document." Since this method
 * takes a hash table, it cannot enforce that; if you care about the
 * ordering of the form fields, use funcform_encode_datalist.
 * See also: [Soup.Message.newFromEncodedForm].
 * Params:
 *   formDataSet = a hash table containing
 *     name/value pairs $(LPAREN)as strings$(RPAREN)
 * Returns: the encoded form
 */
string formEncodeHash(string[string] formDataSet)
{
  char* _cretval;
  auto _formDataSet = gHashTableFromD!(string, string)(formDataSet);
  scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_formDataSet);
  _cretval = soup_form_encode_hash(_formDataSet);
  string _retval = _cretval.fromCString(Yes.Free);
  return _retval;
}

/**
 * Returns the major version number of the libsoup library.
 * e.g. in libsoup version 2.42.0 this is 2.
 * This function is in the library, so it represents the libsoup library
 * your code is running against. Contrast with the #SOUP_MAJOR_VERSION
 * macro, which represents the major version of the libsoup headers you
 * have included when compiling your code.
 * Returns: the major version number of the libsoup library
 */
uint getMajorVersion()
{
  uint _retval;
  _retval = soup_get_major_version();
  return _retval;
}

/**
 * Returns the micro version number of the libsoup library.
 * e.g. in libsoup version 2.42.0 this is 0.
 * This function is in the library, so it represents the libsoup library
 * your code is running against. Contrast with the #SOUP_MICRO_VERSION
 * macro, which represents the micro version of the libsoup headers you
 * have included when compiling your code.
 * Returns: the micro version number of the libsoup library
 */
uint getMicroVersion()
{
  uint _retval;
  _retval = soup_get_micro_version();
  return _retval;
}

/**
 * Returns the minor version number of the libsoup library.
 * e.g. in libsoup version 2.42.0 this is 42.
 * This function is in the library, so it represents the libsoup library
 * your code is running against. Contrast with the #SOUP_MINOR_VERSION
 * macro, which represents the minor version of the libsoup headers you
 * have included when compiling your code.
 * Returns: the minor version number of the libsoup library
 */
uint getMinorVersion()
{
  uint _retval;
  _retval = soup_get_minor_version();
  return _retval;
}

/**
 * Parses header to see if it contains the token token $(LPAREN)matched
 * case-insensitively$(RPAREN).
 * Note that this can't be used with lists that have qvalues.
 * Params:
 *   header = An HTTP header suitable for parsing with
 *     funcheader_parse_list
 *   token = a token
 * Returns: whether or not header contains token
 */
bool headerContains(string header, string token)
{
  bool _retval;
  const(char)* _header = header.toCString(No.Alloc);
  const(char)* _token = token.toCString(No.Alloc);
  _retval = soup_header_contains(_header, _token);
  return _retval;
}

/**
 * Frees param_list.
 * Params:
 *   paramList = a #GHashTable returned from
 *     funcheader_parse_param_list or funcheader_parse_semi_param_list
 */
void headerFreeParamList(string[string] paramList)
{
  auto _paramList = gHashTableFromD!(string, string)(paramList);
  scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_paramList);
  soup_header_free_param_list(_paramList);
}

/**
 * Appends something like `name\=value` to string, taking care to quote value
 * if needed, and if so, to escape any quotes or backslashes in value.
 * Alternatively, if value is a non-ASCII UTF-8 string, it will be
 * appended using RFC5987 syntax. Although in theory this is supposed
 * to work anywhere in HTTP that uses this style of parameter, in
 * reality, it can only be used portably with the Content-Disposition
 * "filename" parameter.
 * If value is %NULL, this will just append name to string.
 * Params:
 *   string_ = a #GString being used to construct an HTTP header value
 *   name = a parameter name
 *   value = a parameter value, or %NULL
 */
void headerGStringAppendParam(String string_, string name, string value)
{
  const(char)* _name = name.toCString(No.Alloc);
  const(char)* _value = value.toCString(No.Alloc);
  soup_header_g_string_append_param(string_ ? cast(GString*)string_.cPtr(No.Dup) : null, _name, _value);
}

/**
 * Appends something like `name\="value"` to
 * string, taking care to escape any quotes or backslashes in value.
 * If value is $(LPAREN)non-ASCII$(RPAREN) UTF-8, this will instead use RFC 5987
 * encoding, just like funcheader_g_string_append_param.
 * Params:
 *   string_ = a #GString being used to construct an HTTP header value
 *   name = a parameter name
 *   value = a parameter value
 */
void headerGStringAppendParamQuoted(String string_, string name, string value)
{
  const(char)* _name = name.toCString(No.Alloc);
  const(char)* _value = value.toCString(No.Alloc);
  soup_header_g_string_append_param_quoted(string_ ? cast(GString*)string_.cPtr(No.Dup) : null, _name, _value);
}

/**
 * Parses a header whose content is described by RFC2616 as `#something`.
 * "something" does not itself contain commas, except as part of quoted-strings.
 * Params:
 *   header = a header value
 * Returns: a #GSList of
 *   list elements, as allocated strings
 */
string[] headerParseList(string header)
{
  GSList* _cretval;
  const(char)* _header = header.toCString(No.Alloc);
  _cretval = soup_header_parse_list(_header);
  auto _retval = gSListToD!(string, GidOwnership.Full)(cast(GSList*)_cretval);
  return _retval;
}

/**
 * Parses a header which is a comma-delimited list of something like:
 * `token [ "\=" $(LPAREN) token | quoted-string $(RPAREN) ]`.
 * Tokens that don't have an associated value will still be added to
 * the resulting hash table, but with a %NULL value.
 * This also handles RFC5987 encoding $(LPAREN)which in HTTP is mostly used
 * for giving UTF8-encoded filenames in the Content-Disposition
 * header$(RPAREN).
 * Params:
 *   header = a header value
 * Returns: a
 *   #GHashTable of list elements, which can be freed with
 *   funcheader_free_param_list.
 */
string[string] headerParseParamList(string header)
{
  GHashTable* _cretval;
  const(char)* _header = header.toCString(No.Alloc);
  _cretval = soup_header_parse_param_list(_header);
  auto _retval = gHashTableToD!(string, string, GidOwnership.Full)(cast(GHashTable*)_cretval);
  return _retval;
}

/**
 * A strict version of funcheader_parse_param_list
 * that bails out if there are duplicate parameters.
 * Note that this function will treat RFC5987-encoded
 * parameters as duplicated if an ASCII version is also
 * present. For header fields that might contain
 * RFC5987-encoded parameters, use
 * funcheader_parse_param_list instead.
 * Params:
 *   header = a header value
 * Returns: a #GHashTable of list elements, which can be freed with
 *   funcheader_free_param_list or %NULL if there are duplicate
 *   elements.
 */
string[string] headerParseParamListStrict(string header)
{
  GHashTable* _cretval;
  const(char)* _header = header.toCString(No.Alloc);
  _cretval = soup_header_parse_param_list_strict(_header);
  auto _retval = gHashTableToD!(string, string, GidOwnership.Full)(cast(GHashTable*)_cretval);
  return _retval;
}

/**
 * Parses a header whose content is a list of items with optional
 * "qvalue"s $(LPAREN)eg, Accept, Accept-Charset, Accept-Encoding,
 * Accept-Language, TE$(RPAREN).
 * If unacceptable is not %NULL, then on return, it will contain the
 * items with qvalue 0. Either way, those items will be removed from
 * the main list.
 * Params:
 *   header = a header value
 *   unacceptable = on
 *     return, will contain a list of unacceptable values
 * Returns: a #GSList of
 *   acceptable values $(LPAREN)as allocated strings$(RPAREN), highest-qvalue first.
 */
string[] headerParseQualityList(string header, out string[] unacceptable)
{
  GSList* _cretval;
  const(char)* _header = header.toCString(No.Alloc);
  GSList* _unacceptable;
  _cretval = soup_header_parse_quality_list(_header, &_unacceptable);
  auto _retval = gSListToD!(string, GidOwnership.Full)(cast(GSList*)_cretval);
  unacceptable = gSListToD!(string, GidOwnership.Full)(_unacceptable);
  return _retval;
}

/**
 * Parses a header which is a semicolon-delimited list of something
 * like: `token [ "\=" $(LPAREN) token | quoted-string $(RPAREN) ]`.
 * Tokens that don't have an associated value will still be added to
 * the resulting hash table, but with a %NULL value.
 * This also handles RFC5987 encoding $(LPAREN)which in HTTP is mostly used
 * for giving UTF8-encoded filenames in the Content-Disposition
 * header$(RPAREN).
 * Params:
 *   header = a header value
 * Returns: a
 *   #GHashTable of list elements, which can be freed with
 *   funcheader_free_param_list.
 */
string[string] headerParseSemiParamList(string header)
{
  GHashTable* _cretval;
  const(char)* _header = header.toCString(No.Alloc);
  _cretval = soup_header_parse_semi_param_list(_header);
  auto _retval = gHashTableToD!(string, string, GidOwnership.Full)(cast(GHashTable*)_cretval);
  return _retval;
}

/**
 * A strict version of funcheader_parse_semi_param_list
 * that bails out if there are duplicate parameters.
 * Note that this function will treat RFC5987-encoded
 * parameters as duplicated if an ASCII version is also
 * present. For header fields that might contain
 * RFC5987-encoded parameters, use
 * funcheader_parse_semi_param_list instead.
 * Params:
 *   header = a header value
 * Returns: a #GHashTable of list elements, which can be freed with
 *   funcheader_free_param_list or %NULL if there are duplicate
 *   elements.
 */
string[string] headerParseSemiParamListStrict(string header)
{
  GHashTable* _cretval;
  const(char)* _header = header.toCString(No.Alloc);
  _cretval = soup_header_parse_semi_param_list_strict(_header);
  auto _retval = gHashTableToD!(string, string, GidOwnership.Full)(cast(GHashTable*)_cretval);
  return _retval;
}

/**
 * Parses the headers of an HTTP request or response in str and
 * stores the results in dest.
 * Beware that dest may be modified even on failure.
 * This is a low-level method; normally you would use
 * funcheaders_parse_request or funcheaders_parse_response.
 * Params:
 *   str = the header string $(LPAREN)including the Request-Line or Status-Line,
 *     but not the trailing blank line$(RPAREN)
 *   len = length of str
 *   dest = #SoupMessageHeaders to store the header values in
 * Returns: success or failure
 */
bool headersParse(string str, int len, MessageHeaders dest)
{
  bool _retval;
  const(char)* _str = str.toCString(No.Alloc);
  _retval = soup_headers_parse(_str, len, dest ? cast(SoupMessageHeaders*)dest.cPtr(No.Dup) : null);
  return _retval;
}

/**
 * Parses the headers of an HTTP request in str and stores the
 * results in req_method, req_path, ver, and req_headers.
 * Beware that req_headers may be modified even on failure.
 * Params:
 *   str = the headers $(LPAREN)up to, but not including, the trailing blank line$(RPAREN)
 *   len = length of str
 *   reqHeaders = #SoupMessageHeaders to store the header values in
 *   reqMethod = if non-%NULL, will be filled in with the
 *     request method
 *   reqPath = if non-%NULL, will be filled in with the
 *     request path
 *   ver = if non-%NULL, will be filled in with the HTTP
 *     version
 * Returns: %SOUP_STATUS_OK if the headers could be parsed, or an
 *   HTTP error to be returned to the client if they could not be.
 */
uint headersParseRequest(string str, int len, MessageHeaders reqHeaders, out string reqMethod, out string reqPath, out HTTPVersion ver)
{
  uint _retval;
  const(char)* _str = str.toCString(No.Alloc);
  char* _reqMethod;
  char* _reqPath;
  _retval = soup_headers_parse_request(_str, len, reqHeaders ? cast(SoupMessageHeaders*)reqHeaders.cPtr(No.Dup) : null, &_reqMethod, &_reqPath, &ver);
  reqMethod = _reqMethod.fromCString(Yes.Free);
  reqPath = _reqPath.fromCString(Yes.Free);
  return _retval;
}

/**
 * Parses the headers of an HTTP response in str and stores the
 * results in ver, status_code, reason_phrase, and headers.
 * Beware that headers may be modified even on failure.
 * Params:
 *   str = the headers $(LPAREN)up to, but not including, the trailing blank line$(RPAREN)
 *   len = length of str
 *   headers = #SoupMessageHeaders to store the header values in
 *   ver = if non-%NULL, will be filled in with the HTTP
 *     version
 *   statusCode = if non-%NULL, will be filled in with
 *     the status code
 *   reasonPhrase = if non-%NULL, will be filled in with
 *     the reason phrase
 * Returns: success or failure.
 */
bool headersParseResponse(string str, int len, MessageHeaders headers, out HTTPVersion ver, out uint statusCode, out string reasonPhrase)
{
  bool _retval;
  const(char)* _str = str.toCString(No.Alloc);
  char* _reasonPhrase;
  _retval = soup_headers_parse_response(_str, len, headers ? cast(SoupMessageHeaders*)headers.cPtr(No.Dup) : null, &ver, cast(uint*)&statusCode, &_reasonPhrase);
  reasonPhrase = _reasonPhrase.fromCString(Yes.Free);
  return _retval;
}

/**
 * Parses the HTTP Status-Line string in status_line into ver,
 * status_code, and reason_phrase.
 * status_line must be terminated by either "\0" or "\r\n".
 * Params:
 *   statusLine = an HTTP Status-Line
 *   ver = if non-%NULL, will be filled in with the HTTP
 *     version
 *   statusCode = if non-%NULL, will be filled in with
 *     the status code
 *   reasonPhrase = if non-%NULL, will be filled in with
 *     the reason phrase
 * Returns: %TRUE if status_line was parsed successfully.
 */
bool headersParseStatusLine(string statusLine, out HTTPVersion ver, out uint statusCode, out string reasonPhrase)
{
  bool _retval;
  const(char)* _statusLine = statusLine.toCString(No.Alloc);
  char* _reasonPhrase;
  _retval = soup_headers_parse_status_line(_statusLine, &ver, cast(uint*)&statusCode, &_reasonPhrase);
  reasonPhrase = _reasonPhrase.fromCString(Yes.Free);
  return _retval;
}

/**
 * Looks whether the domain passed as argument is a public domain
 * suffix $(LPAREN).org, .com, .co.uk, etc$(RPAREN) or not.
 * Prior to libsoup 2.46, this function required that domain be in
 * UTF-8 if it was an IDN. From 2.46 on, the name can be in either
 * UTF-8 or ASCII format.
 * Params:
 *   domain = a domain name
 * Returns: %TRUE if it is a public domain, %FALSE otherwise.
 */
bool tldDomainIsPublicSuffix(string domain)
{
  bool _retval;
  const(char)* _domain = domain.toCString(No.Alloc);
  _retval = soup_tld_domain_is_public_suffix(_domain);
  return _retval;
}

/**
 * Finds the base domain for a given hostname
 * The base domain is composed by the top level domain $(LPAREN)such as .org, .com,
 * .co.uk, etc$(RPAREN) plus the second level domain, for example for
 * myhost.mydomain.com it will return mydomain.com.
 * Note that %NULL will be returned for private URLs $(LPAREN)those not ending
 * with any well known TLD$(RPAREN) because choosing a base domain for them
 * would be totally arbitrary.
 * Prior to libsoup 2.46, this function required that hostname be in
 * UTF-8 if it was an IDN. From 2.46 on, the name can be in either
 * UTF-8 or ASCII format $(LPAREN)and the return value will be in the same
 * format$(RPAREN).
 * Params:
 *   hostname = a hostname
 * Returns: a pointer to the start of the base domain in hostname. If
 *   an error occurs, %NULL will be returned and error set.
 */
string tldGetBaseDomain(string hostname)
{
  const(char)* _cretval;
  const(char)* _hostname = hostname.toCString(No.Alloc);
  GError *_err;
  _cretval = soup_tld_get_base_domain(_hostname, &_err);
  if (_err)
    throw new ErrorG(_err);
  string _retval = _cretval.fromCString(No.Free);
  return _retval;
}

/**
 * Decodes the given data URI and returns its contents and content_type.
 * Params:
 *   uri = a data URI, in string form
 *   contentType = location to store content type
 * Returns: a #GBytes with the contents of uri,
 *   or %NULL if uri is not a valid data URI
 */
Bytes uriDecodeDataUri(string uri, out string contentType)
{
  GBytes* _cretval;
  const(char)* _uri = uri.toCString(No.Alloc);
  char* _contentType;
  _cretval = soup_uri_decode_data_uri(_uri, &_contentType);
  auto _retval = _cretval ? new Bytes(cast(void*)_cretval, Yes.Take) : null;
  contentType = _contentType.fromCString(Yes.Free);
  return _retval;
}

/**
 * Tests whether or not uri1 and uri2 are equal in all parts.
 * Params:
 *   uri1 = a #GUri
 *   uri2 = another #GUri
 * Returns: %TRUE if equal otherwise %FALSE
 */
bool uriEqual(Uri uri1, Uri uri2)
{
  bool _retval;
  _retval = soup_uri_equal(uri1 ? cast(GUri*)uri1.cPtr(No.Dup) : null, uri2 ? cast(GUri*)uri2.cPtr(No.Dup) : null);
  return _retval;
}
