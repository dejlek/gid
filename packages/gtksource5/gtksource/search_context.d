module gtksource.search_context;

import gid.gid;
import gio.async_result;
import gio.async_result_mixin;
import gio.cancellable;
import gio.types;
import glib.error;
import gobject.object;
import gtk.text_iter;
import gtksource.buffer;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.search_settings;
import gtksource.style;
import gtksource.types;

/**
 * Search context.
 * A `GtkSourceSearchContext` is used for the search and replace in a
 * class@Buffer. The search settings are represented by a
 * class@SearchSettings object. There can be a many-to-many relationship
 * between buffers and search settings, with the search contexts in-between: a
 * search settings object can be shared between several search contexts; and a
 * buffer can contain several search contexts at the same time.
 * The total number of search occurrences can be retrieved with
 * [GtkSource.SearchContext.getOccurrencesCount]. To know the position of a
 * certain match, use [GtkSource.SearchContext.getOccurrencePosition].
 * The buffer is scanned asynchronously, so it doesn't block the user interface.
 * For each search, the buffer is scanned at most once. After that, navigating
 * through the occurrences doesn't require to re-scan the buffer entirely.
 * To search forward, use [GtkSource.SearchContext.forward] or
 * [GtkSource.SearchContext.forwardAsync] for the asynchronous version.
 * The backward search is done similarly. To replace a search match, or all
 * matches, use [GtkSource.SearchContext.replace] and
 * [GtkSource.SearchContext.replaceAll].
 * The search occurrences are highlighted by default. To disable it, use
 * [GtkSource.SearchContext.setHighlight]. You can enable the search
 * highlighting for several `GtkSourceSearchContext`s attached to the
 * same buffer. Moreover, each of those `GtkSourceSearchContext`s can
 * have a different text style associated. Use
 * [GtkSource.SearchContext.setMatchStyle] to specify the class@Style
 * to apply on search matches.
 * Note that the property@SearchContext:highlight and
 * property@SearchContext:match-style properties are in the
 * `GtkSourceSearchContext` class, not class@SearchSettings. Appearance
 * settings should be tied to one, and only one buffer, as different buffers can
 * have different style scheme associated $(LPAREN)a class@SearchSettings object
 * can be bound indirectly to several buffers$(RPAREN).
 * The concept of "current match" doesn't exist yet. A way to highlight
 * differently the current match is to select it.
 * A search occurrence's position doesn't depend on the cursor position or other
 * parameters. Take for instance the buffer "aaaa" with the search text "aa".
 * The two occurrences are at positions [0:2] and [2:4]. If you begin to search
 * at position 1, you will get the occurrence [2:4], not [1:3]. This is a
 * prerequisite for regular expression searches. The pattern ".*" matches the
 * entire line. If the cursor is at the middle of the line, you don't want the
 * rest of the line as the occurrence, you want an entire line. $(LPAREN)As a side note,
 * regular expression searches can also match multiple lines.$(RPAREN)
 * In the GtkSourceView source code, there is an example of how to use the
 * search and replace API: see the tests/test-search.c file. It is a mini
 * application for the search and replace, with a basic user interface.
 */
class SearchContext : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_search_context_get_type != &gidSymbolNotFound ? gtk_source_search_context_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new search context, associated with buffer, and customized with
   * settings.
   * If settings is %NULL, a new classSearchSettings object will
   * be created, that you can retrieve with [GtkSource.SearchContext.getSettings].
   * Params:
   *   buffer = a #GtkSourceBuffer.
   *   settings = a #GtkSourceSearchSettings, or %NULL.
   * Returns: a new search context.
   */
  this(Buffer buffer, SearchSettings settings)
  {
    GtkSourceSearchContext* _cretval;
    _cretval = gtk_source_search_context_new(buffer ? cast(GtkSourceBuffer*)buffer.cPtr(No.Dup) : null, settings ? cast(GtkSourceSearchSettings*)settings.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Synchronous backward search.
   * It is recommended to use the asynchronous functions instead, to not block the user interface.
   * However, if you are sure that the buffer is small, this function is more convenient to use.
   * If the propertySearchSettings:wrap-around property is %FALSE, this function
   * doesn't try to wrap around.
   * The has_wrapped_around out parameter is set independently of whether a match
   * is found. So if this function returns %FALSE, has_wrapped_around will have
   * the same value as the propertySearchSettings:wrap-around property.
   * Params:
   *   iter = start of search.
   *   matchStart = return location for start of match, or %NULL.
   *   matchEnd = return location for end of match, or %NULL.
   *   hasWrappedAround = return location to know whether the
   *     search has wrapped around, or %NULL.
   * Returns: whether a match was found.
   */
  bool backward(TextIter iter, out TextIter matchStart, out TextIter matchEnd, out bool hasWrappedAround)
  {
    bool _retval;
    GtkTextIter _matchStart;
    GtkTextIter _matchEnd;
    _retval = gtk_source_search_context_backward(cast(GtkSourceSearchContext*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null, &_matchStart, &_matchEnd, cast(bool*)&hasWrappedAround);
    matchStart = new TextIter(cast(void*)&_matchStart, No.Take);
    matchEnd = new TextIter(cast(void*)&_matchEnd, No.Take);
    return _retval;
  }

  /**
   * The asynchronous version of [GtkSource.SearchContext.backward].
   * See the [Gio.AsyncResult] documentation to know how to use this function.
   * If the operation is cancelled, the callback will only be called if
   * cancellable was not %NULL. The method takes
   * ownership of cancellable, so you can unref it after calling this function.
   * Params:
   *   iter = start of search.
   *   cancellable = a #GCancellable, or %NULL.
   *   callback = a #GAsyncReadyCallback to call when the operation is finished.
   */
  void backwardAsync(TextIter iter, Cancellable cancellable, AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!ObjectG(cast(void*)sourceObject, No.Take), ObjectG.getDObject!AsyncResult(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_source_search_context_backward_async(cast(GtkSourceSearchContext*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Finishes a backward search started with
   * [GtkSource.SearchContext.backwardAsync].
   * See the documentation of [GtkSource.SearchContext.backward] for more
   * details.
   * Params:
   *   result = a #GAsyncResult.
   *   matchStart = return location for start of match, or %NULL.
   *   matchEnd = return location for end of match, or %NULL.
   *   hasWrappedAround = return location to know whether the
   *     search has wrapped around, or %NULL.
   * Returns: whether a match was found.
   */
  bool backwardFinish(AsyncResult result, out TextIter matchStart, out TextIter matchEnd, out bool hasWrappedAround)
  {
    bool _retval;
    GtkTextIter _matchStart;
    GtkTextIter _matchEnd;
    GError *_err;
    _retval = gtk_source_search_context_backward_finish(cast(GtkSourceSearchContext*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_matchStart, &_matchEnd, cast(bool*)&hasWrappedAround, &_err);
    if (_err)
      throw new ErrorG(_err);
    matchStart = new TextIter(cast(void*)&_matchStart, No.Take);
    matchEnd = new TextIter(cast(void*)&_matchEnd, No.Take);
    return _retval;
  }

  /**
   * Synchronous forward search.
   * It is recommended to use the asynchronous functions instead, to not block the user interface.
   * However, if you are sure that the buffer is small, this function is more convenient to use.
   * If the propertySearchSettings:wrap-around property is %FALSE, this function
   * doesn't try to wrap around.
   * The has_wrapped_around out parameter is set independently of whether a match
   * is found. So if this function returns %FALSE, has_wrapped_around will have
   * the same value as the  propertySearchSettings:wrap-around property.
   * Params:
   *   iter = start of search.
   *   matchStart = return location for start of match, or %NULL.
   *   matchEnd = return location for end of match, or %NULL.
   *   hasWrappedAround = return location to know whether the
   *     search has wrapped around, or %NULL.
   * Returns: whether a match was found.
   */
  bool forward(TextIter iter, out TextIter matchStart, out TextIter matchEnd, out bool hasWrappedAround)
  {
    bool _retval;
    GtkTextIter _matchStart;
    GtkTextIter _matchEnd;
    _retval = gtk_source_search_context_forward(cast(GtkSourceSearchContext*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null, &_matchStart, &_matchEnd, cast(bool*)&hasWrappedAround);
    matchStart = new TextIter(cast(void*)&_matchStart, No.Take);
    matchEnd = new TextIter(cast(void*)&_matchEnd, No.Take);
    return _retval;
  }

  /**
   * The asynchronous version of [GtkSource.SearchContext.forward].
   * See the [Gio.AsyncResult] documentation to know how to use this function.
   * If the operation is cancelled, the callback will only be called if
   * cancellable was not %NULL. The method takes
   * ownership of cancellable, so you can unref it after calling this function.
   * Params:
   *   iter = start of search.
   *   cancellable = a #GCancellable, or %NULL.
   *   callback = a #GAsyncReadyCallback to call when the operation is finished.
   */
  void forwardAsync(TextIter iter, Cancellable cancellable, AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!ObjectG(cast(void*)sourceObject, No.Take), ObjectG.getDObject!AsyncResult(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_source_search_context_forward_async(cast(GtkSourceSearchContext*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Finishes a forward search started with [GtkSource.SearchContext.forwardAsync].
   * See the documentation of [GtkSource.SearchContext.forward] for more
   * details.
   * Params:
   *   result = a #GAsyncResult.
   *   matchStart = return location for start of match, or %NULL.
   *   matchEnd = return location for end of match, or %NULL.
   *   hasWrappedAround = return location to know whether the
   *     search has wrapped around, or %NULL.
   * Returns: whether a match was found.
   */
  bool forwardFinish(AsyncResult result, out TextIter matchStart, out TextIter matchEnd, out bool hasWrappedAround)
  {
    bool _retval;
    GtkTextIter _matchStart;
    GtkTextIter _matchEnd;
    GError *_err;
    _retval = gtk_source_search_context_forward_finish(cast(GtkSourceSearchContext*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_matchStart, &_matchEnd, cast(bool*)&hasWrappedAround, &_err);
    if (_err)
      throw new ErrorG(_err);
    matchStart = new TextIter(cast(void*)&_matchStart, No.Take);
    matchEnd = new TextIter(cast(void*)&_matchEnd, No.Take);
    return _retval;
  }

  Buffer getBuffer()
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_search_context_get_buffer(cast(GtkSourceSearchContext*)cPtr);
    auto _retval = ObjectG.getDObject!Buffer(cast(GtkSourceBuffer*)_cretval, No.Take);
    return _retval;
  }

  bool getHighlight()
  {
    bool _retval;
    _retval = gtk_source_search_context_get_highlight(cast(GtkSourceSearchContext*)cPtr);
    return _retval;
  }

  Style getMatchStyle()
  {
    GtkSourceStyle* _cretval;
    _cretval = gtk_source_search_context_get_match_style(cast(GtkSourceSearchContext*)cPtr);
    auto _retval = ObjectG.getDObject!Style(cast(GtkSourceStyle*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the position of a search occurrence.
   * If the buffer is not already fully scanned, the position may be unknown,
   * and -1 is returned. If 0 is returned, it means that this part of the buffer
   * has already been scanned, and that match_start and match_end don't delimit an occurrence.
   * Params:
   *   matchStart = the start of the occurrence.
   *   matchEnd = the end of the occurrence.
   * Returns: the position of the search occurrence. The first occurrence has the
   *   position 1 $(LPAREN)not 0$(RPAREN). Returns 0 if match_start and match_end don't delimit
   *   an occurrence. Returns -1 if the position is not yet known.
   */
  int getOccurrencePosition(TextIter matchStart, TextIter matchEnd)
  {
    int _retval;
    _retval = gtk_source_search_context_get_occurrence_position(cast(GtkSourceSearchContext*)cPtr, matchStart ? cast(GtkTextIter*)matchStart.cPtr(No.Dup) : null, matchEnd ? cast(GtkTextIter*)matchEnd.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Gets the total number of search occurrences.
   * If the buffer is not already fully scanned, the total number of occurrences is
   * unknown, and -1 is returned.
   * Returns: the total number of search occurrences, or -1 if unknown.
   */
  int getOccurrencesCount()
  {
    int _retval;
    _retval = gtk_source_search_context_get_occurrences_count(cast(GtkSourceSearchContext*)cPtr);
    return _retval;
  }

  /**
   * Regular expression patterns must follow certain rules. If
   * propertySearchSettings:search-text breaks a rule, the error can be
   * retrieved with this function.
   * The error domain is [GLib.RegexError].
   * Free the return value with [GLib.ErrorG.free].
   * Returns: the #GError, or %NULL if the
   *   pattern is valid.
   */
  ErrorG getRegexError()
  {
    GError* _cretval;
    _cretval = gtk_source_search_context_get_regex_error(cast(GtkSourceSearchContext*)cPtr);
    auto _retval = _cretval ? new ErrorG(cast(GError*)_cretval) : null;
    return _retval;
  }

  SearchSettings getSettings()
  {
    GtkSourceSearchSettings* _cretval;
    _cretval = gtk_source_search_context_get_settings(cast(GtkSourceSearchContext*)cPtr);
    auto _retval = ObjectG.getDObject!SearchSettings(cast(GtkSourceSearchSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Replaces a search match by another text. If match_start and match_end
   * doesn't correspond to a search match, %FALSE is returned.
   * match_start and match_end iters are revalidated to point to the replacement
   * text boundaries.
   * For a regular expression replacement, you can check if replace is valid by
   * calling [GLib.Regex.checkReplacement]. The replace text can contain
   * backreferences.
   * Params:
   *   matchStart = the start of the match to replace.
   *   matchEnd = the end of the match to replace.
   *   replace = the replacement text.
   *   replaceLength = the length of replace in bytes, or -1.
   * Returns: whether the match has been replaced.
   */
  bool replace(TextIter matchStart, TextIter matchEnd, string replace, int replaceLength)
  {
    bool _retval;
    const(char)* _replace = replace.toCString(No.Alloc);
    GError *_err;
    _retval = gtk_source_search_context_replace(cast(GtkSourceSearchContext*)cPtr, matchStart ? cast(GtkTextIter*)matchStart.cPtr(No.Dup) : null, matchEnd ? cast(GtkTextIter*)matchEnd.cPtr(No.Dup) : null, _replace, replaceLength, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Replaces all search matches by another text.
   * It is a synchronous function, so it can block the user interface.
   * For a regular expression replacement, you can check if replace is valid by
   * calling [GLib.Regex.checkReplacement]. The replace text can contain
   * backreferences.
   * Params:
   *   replace = the replacement text.
   *   replaceLength = the length of replace in bytes, or -1.
   * Returns: the number of replaced matches.
   */
  uint replaceAll(string replace, int replaceLength)
  {
    uint _retval;
    const(char)* _replace = replace.toCString(No.Alloc);
    GError *_err;
    _retval = gtk_source_search_context_replace_all(cast(GtkSourceSearchContext*)cPtr, _replace, replaceLength, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Enables or disables the search occurrences highlighting.
   * Params:
   *   highlight = the setting.
   */
  void setHighlight(bool highlight)
  {
    gtk_source_search_context_set_highlight(cast(GtkSourceSearchContext*)cPtr, highlight);
  }

  /**
   * Set the style to apply on search matches.
   * If match_style is %NULL, default theme's scheme 'match-style' will be used.
   * To enable or disable the search highlighting, use [GtkSource.SearchContext.setHighlight].
   * Params:
   *   matchStyle = a #GtkSourceStyle, or %NULL.
   */
  void setMatchStyle(Style matchStyle)
  {
    gtk_source_search_context_set_match_style(cast(GtkSourceSearchContext*)cPtr, matchStyle ? cast(GtkSourceStyle*)matchStyle.cPtr(No.Dup) : null);
  }
}
