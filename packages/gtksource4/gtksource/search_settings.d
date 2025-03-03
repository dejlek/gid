module gtksource.search_settings;

import gid.gid;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

class SearchSettings : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_search_settings_get_type != &gidSymbolNotFound ? gtk_source_search_settings_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new search settings object.
   * Returns: a new search settings object.
   */
  this()
  {
    GtkSourceSearchSettings* _cretval;
    _cretval = gtk_source_search_settings_new();
    this(_cretval, Yes.Take);
  }

  bool getAtWordBoundaries()
  {
    bool _retval;
    _retval = gtk_source_search_settings_get_at_word_boundaries(cast(GtkSourceSearchSettings*)cPtr);
    return _retval;
  }

  bool getCaseSensitive()
  {
    bool _retval;
    _retval = gtk_source_search_settings_get_case_sensitive(cast(GtkSourceSearchSettings*)cPtr);
    return _retval;
  }

  bool getRegexEnabled()
  {
    bool _retval;
    _retval = gtk_source_search_settings_get_regex_enabled(cast(GtkSourceSearchSettings*)cPtr);
    return _retval;
  }

  /**
   * Gets the text to search. The return value must not be freed.
   * You may be interested to call [gtksource.global.utilsEscapeSearchText] after
   * this function.
   * Returns: the text to search, or %NULL if the search is disabled.
   */
  string getSearchText()
  {
    const(char)* _cretval;
    _cretval = gtk_source_search_settings_get_search_text(cast(GtkSourceSearchSettings*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  bool getWrapAround()
  {
    bool _retval;
    _retval = gtk_source_search_settings_get_wrap_around(cast(GtkSourceSearchSettings*)cPtr);
    return _retval;
  }

  /**
   * Change whether the search is done at word boundaries. If at_word_boundaries
   * is %TRUE, a search match must start and end a word. The match can span
   * multiple words. See also [gtk.text_iter.TextIter.startsWord] and
   * [gtk.text_iter.TextIter.endsWord].
   * Params:
   *   atWordBoundaries = the setting.
   */
  void setAtWordBoundaries(bool atWordBoundaries)
  {
    gtk_source_search_settings_set_at_word_boundaries(cast(GtkSourceSearchSettings*)cPtr, atWordBoundaries);
  }

  /**
   * Enables or disables the case sensitivity for the search.
   * Params:
   *   caseSensitive = the setting.
   */
  void setCaseSensitive(bool caseSensitive)
  {
    gtk_source_search_settings_set_case_sensitive(cast(GtkSourceSearchSettings*)cPtr, caseSensitive);
  }

  /**
   * Enables or disables whether to search by regular expressions.
   * If enabled, the #GtkSourceSearchSettings:search-text property contains the
   * pattern of the regular expression.
   * #GtkSourceSearchContext uses #GRegex when regex search is enabled. See the
   * [Regular expression syntax](https://developer.gnome.org/glib/stable/glib-regex-syntax.html)
   * page in the GLib reference manual.
   * Params:
   *   regexEnabled = the setting.
   */
  void setRegexEnabled(bool regexEnabled)
  {
    gtk_source_search_settings_set_regex_enabled(cast(GtkSourceSearchSettings*)cPtr, regexEnabled);
  }

  /**
   * Sets the text to search. If search_text is %NULL or is empty, the search
   * will be disabled. A copy of search_text will be made, so you can safely free
   * search_text after a call to this function.
   * You may be interested to call [gtksource.global.utilsUnescapeSearchText] before
   * this function.
   * Params:
   *   searchText = the nul-terminated text to search, or %NULL to disable the search.
   */
  void setSearchText(string searchText = null)
  {
    const(char)* _searchText = searchText.toCString(No.Alloc);
    gtk_source_search_settings_set_search_text(cast(GtkSourceSearchSettings*)cPtr, _searchText);
  }

  /**
   * Enables or disables the wrap around search. If wrap_around is %TRUE, the
   * forward search continues at the beginning of the buffer if no search
   * occurrences are found. Similarly, the backward search continues to search at
   * the end of the buffer.
   * Params:
   *   wrapAround = the setting.
   */
  void setWrapAround(bool wrapAround)
  {
    gtk_source_search_settings_set_wrap_around(cast(GtkSourceSearchSettings*)cPtr, wrapAround);
  }
}
