module gtksource.language;

import gid.gid;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/**
 * Represents a syntax highlighted language.
 * A `GtkSourceLanguage` represents a programming or markup language, affecting
 * syntax highlighting and [context classes](./class.Buffer.html#context-classes).
 * Use class@LanguageManager to obtain a `GtkSourceLanguage` instance, and
 * [GtkSource.Buffer.setLanguage] to apply it to a class@Buffer.
 */
class Language : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_language_get_type != &gidSymbolNotFound ? gtk_source_language_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Returns whether the language should be hidden from the user.
   * Returns: %TRUE if the language should be hidden, %FALSE otherwise.
   */
  bool getHidden()
  {
    bool _retval;
    _retval = gtk_source_language_get_hidden(cast(GtkSourceLanguage*)cPtr);
    return _retval;
  }

  /**
   * Returns the ID of the language.
   * The ID is not locale-dependent.The returned string is owned by language
   * and should not be freed or modified.
   * Returns: the ID of language.
   */
  string getId()
  {
    const(char)* _cretval;
    _cretval = gtk_source_language_get_id(cast(GtkSourceLanguage*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  string getMetadata(string name)
  {
    const(char)* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_source_language_get_metadata(cast(GtkSourceLanguage*)cPtr, _name);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Returns the localized name of the language.
   * The returned string is owned by language and should not be freed
   * or modified.
   * Returns: the name of language.
   */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gtk_source_language_get_name(cast(GtkSourceLanguage*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Returns the localized section of the language.
   * Each language belong to a section $(LPAREN)ex. HTML belongs to the
   * Markup section$(RPAREN).
   * The returned string is owned by language and should not be freed
   * or modified.
   * Returns: the section of language.
   */
  string getSection()
  {
    const(char)* _cretval;
    _cretval = gtk_source_language_get_section(cast(GtkSourceLanguage*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Returns the ID of the style to use if the specified style_id
   * is not present in the current style scheme.
   * Params:
   *   styleId = a style ID.
   * Returns: the ID of the style to use if the
   *   specified style_id is not present in the current style scheme or %NULL
   *   if the style has no fallback defined.
   *   The returned string is owned by the language and must not be modified.
   */
  string getStyleFallback(string styleId)
  {
    const(char)* _cretval;
    const(char)* _styleId = styleId.toCString(No.Alloc);
    _cretval = gtk_source_language_get_style_fallback(cast(GtkSourceLanguage*)cPtr, _styleId);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Returns the name of the style with ID style_id defined by this language.
   * Params:
   *   styleId = a style ID.
   * Returns: the name of the style with ID style_id
   *   defined by this language or %NULL if the style has no name or there is no
   *   style with ID style_id defined by this language.
   *   The returned string is owned by the language and must not be modified.
   */
  string getStyleName(string styleId)
  {
    const(char)* _cretval;
    const(char)* _styleId = styleId.toCString(No.Alloc);
    _cretval = gtk_source_language_get_style_name(cast(GtkSourceLanguage*)cPtr, _styleId);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }
}
