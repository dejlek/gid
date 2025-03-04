module soup.cookie_jar_text;

import gid.gid;
import soup.c.functions;
import soup.c.types;
import soup.cookie_jar;
import soup.session_feature;
import soup.session_feature_mixin;
import soup.types;

/**
 * Text-file-based $(LPAREN)"cookies.txt"$(RPAREN) Cookie Jar
 * #SoupCookieJarText is a class@CookieJar that reads cookies from and writes
 * them to a text file in format similar to Mozilla's "cookies.txt".
 */
class CookieJarText : soup.cookie_jar.CookieJar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_cookie_jar_text_get_type != &gidSymbolNotFound ? soup_cookie_jar_text_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a #SoupCookieJarText.
   * filename will be read in at startup to create an initial set of cookies. If
   * read_only is %FALSE, then the non-session cookies will be written to
   * filename when the signalCookieJar::changed signal is emitted from the
   * jar. $(LPAREN)If read_only is %TRUE, then the cookie jar will only be used for this
   * session, and changes made to it will be lost when the jar is destroyed.$(RPAREN)
   * Params:
   *   filename = the filename to read to/write from
   *   readOnly = %TRUE if filename is read-only
   * Returns: the new #SoupCookieJar
   */
  this(string filename, bool readOnly)
  {
    SoupCookieJar* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    _cretval = soup_cookie_jar_text_new(_filename, readOnly);
    this(_cretval, Yes.Take);
  }
}
