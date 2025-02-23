module GtkSource.Encoding;

import GObject.Boxed;
import Gid.gid;
import GtkSource.Types;
import GtkSource.c.functions;
import GtkSource.c.types;

/**
 * Character encoding.
 * The #GtkSourceEncoding boxed type represents a character encoding. It is used
 * for example by #GtkSourceFile. Note that the text in GTK widgets is always
 * encoded in UTF-8.
 */
class Encoding : Boxed
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
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_encoding_get_type != &gidSymbolNotFound ? gtk_source_encoding_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Used by language bindings.
   * Returns: a copy of enc.
   */
  Encoding copy()
  {
    GtkSourceEncoding* _cretval;
    _cretval = gtk_source_encoding_copy(cast(GtkSourceEncoding*)cPtr);
    auto _retval = _cretval ? new Encoding(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Gets the character set of the #GtkSourceEncoding, such as "UTF-8" or
   * "ISO-8859-1".
   * Returns: the character set of the #GtkSourceEncoding.
   */
  string getCharset()
  {
    const(char)* _cretval;
    _cretval = gtk_source_encoding_get_charset(cast(GtkSourceEncoding*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets the name of the #GtkSourceEncoding such as "Unicode" or "Western".
   * Returns: the name of the #GtkSourceEncoding.
   */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gtk_source_encoding_get_name(cast(GtkSourceEncoding*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  string toString_()
  {
    char* _cretval;
    _cretval = gtk_source_encoding_to_string(cast(GtkSourceEncoding*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Gets all encodings.
   * Returns: a list of
   *   all #GtkSourceEncoding's. Free with [GLib.SList.free].
   */
  static Encoding[] getAll()
  {
    GSList* _cretval;
    _cretval = gtk_source_encoding_get_all();
    auto _retval = gSListToD!(Encoding, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
   * Gets the #GtkSourceEncoding for the current locale.
   * See also funcGLib.get_charset.
   * Returns: the current locale encoding.
   */
  static Encoding getCurrent()
  {
    const(GtkSourceEncoding)* _cretval;
    _cretval = gtk_source_encoding_get_current();
    auto _retval = _cretval ? new Encoding(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Gets the list of default candidate encodings to try when loading a file.
   * See [GtkSource.FileLoader.setCandidateEncodings].
   * This function returns a different list depending on the current locale $(LPAREN)i.e.
   * language, country and default encoding$(RPAREN). The UTF-8 encoding and the current
   * locale encoding are guaranteed to be present in the returned list.
   * Returns: the list of
   *   default candidate encodings. Free with [GLib.SList.free].
   */
  static Encoding[] getDefaultCandidates()
  {
    GSList* _cretval;
    _cretval = gtk_source_encoding_get_default_candidates();
    auto _retval = gSListToD!(Encoding, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
   * Gets a #GtkSourceEncoding from a character set such as "UTF-8" or
   * "ISO-8859-1".
   * Params:
   *   charset = a character set.
   * Returns: the corresponding #GtkSourceEncoding, or %NULL
   *   if not found.
   */
  static Encoding getFromCharset(string charset)
  {
    const(GtkSourceEncoding)* _cretval;
    const(char)* _charset = charset.toCString(No.Alloc);
    _cretval = gtk_source_encoding_get_from_charset(_charset);
    auto _retval = _cretval ? new Encoding(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  static Encoding getUtf8()
  {
    const(GtkSourceEncoding)* _cretval;
    _cretval = gtk_source_encoding_get_utf8();
    auto _retval = _cretval ? new Encoding(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
