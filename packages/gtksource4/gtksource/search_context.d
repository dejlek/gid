/// Module for [SearchContext] class
module gtksource.search_context;

import gid.gid;
import gio.async_result;
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

/** */
class SearchContext : gobject.object.ObjectG
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_search_context_get_type != &gidSymbolNotFound ? gtk_source_search_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override SearchContext self()
  {
    return this;
  }

  /**
      Creates a new search context, associated with buffer, and customized with
      settings. If settings is null, a new #GtkSourceSearchSettings object will
      be created, that you can retrieve with
      [gtksource.search_context.SearchContext.getSettings].
  
      Params:
        buffer = a #GtkSourceBuffer.
        settings = a #GtkSourceSearchSettings, or null.
      Returns: a new search context.
  */
  this(gtksource.buffer.Buffer buffer, gtksource.search_settings.SearchSettings settings = null)
  {
    GtkSourceSearchContext* _cretval;
    _cretval = gtk_source_search_context_new(buffer ? cast(GtkSourceBuffer*)buffer.cPtr(No.Dup) : null, settings ? cast(GtkSourceSearchSettings*)settings.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Synchronous backward search. It is recommended to use the asynchronous
      functions instead, to not block the user interface. However, if you are sure
      that the buffer is small, this function is more convenient to use.
      
      If the #GtkSourceSearchSettings:wrap-around property is false, this function
      doesn't try to wrap around.
      
      The has_wrapped_around out parameter is set independently of whether a match
      is found. So if this function returns false, has_wrapped_around will have
      the same value as the #GtkSourceSearchSettings:wrap-around property.
  
      Params:
        iter = start of search.
        matchStart = return location for start of match, or null.
        matchEnd = return location for end of match, or null.
        hasWrappedAround = return location to know whether the
            search has wrapped around, or null.
      Returns: whether a match was found.
  */
  bool backward(gtk.text_iter.TextIter iter, out gtk.text_iter.TextIter matchStart, out gtk.text_iter.TextIter matchEnd, out bool hasWrappedAround)
  {
    bool _retval;
    GtkTextIter _matchStart;
    GtkTextIter _matchEnd;
    _retval = gtk_source_search_context_backward(cast(GtkSourceSearchContext*)cPtr, iter ? cast(const(GtkTextIter)*)iter.cPtr(No.Dup) : null, &_matchStart, &_matchEnd, cast(bool*)&hasWrappedAround);
    matchStart = new gtk.text_iter.TextIter(cast(void*)&_matchStart, No.Take);
    matchEnd = new gtk.text_iter.TextIter(cast(void*)&_matchEnd, No.Take);
    return _retval;
  }

  /**
      The asynchronous version of [gtksource.search_context.SearchContext.backward].
      
      See the documentation of [gtksource.search_context.SearchContext.backward] for more
      details.
      
      See the #GAsyncResult documentation to know how to use this function.
      
      If the operation is cancelled, the callback will only be called if
      cancellable was not null. [gtksource.search_context.SearchContext.backwardAsync] takes
      ownership of cancellable, so you can unref it after calling this function.
  
      Params:
        iter = start of search.
        cancellable = a #GCancellable, or null.
        callback = a #GAsyncReadyCallback to call when the operation is finished.
  */
  void backwardAsync(gtk.text_iter.TextIter iter, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_source_search_context_backward_async(cast(GtkSourceSearchContext*)cPtr, iter ? cast(const(GtkTextIter)*)iter.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a backward search started with
      [gtksource.search_context.SearchContext.backwardAsync].
      
      See the documentation of [gtksource.search_context.SearchContext.backward] for more
      details.
  
      Params:
        result = a #GAsyncResult.
        matchStart = return location for start of match, or null.
        matchEnd = return location for end of match, or null.
        hasWrappedAround = return location to know whether the
            search has wrapped around, or null.
      Returns: whether a match was found.
      Throws: [ErrorG]
  */
  bool backwardFinish(gio.async_result.AsyncResult result, out gtk.text_iter.TextIter matchStart, out gtk.text_iter.TextIter matchEnd, out bool hasWrappedAround)
  {
    bool _retval;
    GtkTextIter _matchStart;
    GtkTextIter _matchEnd;
    GError *_err;
    _retval = gtk_source_search_context_backward_finish(cast(GtkSourceSearchContext*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_matchStart, &_matchEnd, cast(bool*)&hasWrappedAround, &_err);
    if (_err)
      throw new ErrorG(_err);
    matchStart = new gtk.text_iter.TextIter(cast(void*)&_matchStart, No.Take);
    matchEnd = new gtk.text_iter.TextIter(cast(void*)&_matchEnd, No.Take);
    return _retval;
  }

  /**
      Synchronous forward search. It is recommended to use the asynchronous
      functions instead, to not block the user interface. However, if you are sure
      that the buffer is small, this function is more convenient to use.
      
      If the #GtkSourceSearchSettings:wrap-around property is false, this function
      doesn't try to wrap around.
      
      The has_wrapped_around out parameter is set independently of whether a match
      is found. So if this function returns false, has_wrapped_around will have
      the same value as the #GtkSourceSearchSettings:wrap-around property.
  
      Params:
        iter = start of search.
        matchStart = return location for start of match, or null.
        matchEnd = return location for end of match, or null.
        hasWrappedAround = return location to know whether the
            search has wrapped around, or null.
      Returns: whether a match was found.
  */
  bool forward(gtk.text_iter.TextIter iter, out gtk.text_iter.TextIter matchStart, out gtk.text_iter.TextIter matchEnd, out bool hasWrappedAround)
  {
    bool _retval;
    GtkTextIter _matchStart;
    GtkTextIter _matchEnd;
    _retval = gtk_source_search_context_forward(cast(GtkSourceSearchContext*)cPtr, iter ? cast(const(GtkTextIter)*)iter.cPtr(No.Dup) : null, &_matchStart, &_matchEnd, cast(bool*)&hasWrappedAround);
    matchStart = new gtk.text_iter.TextIter(cast(void*)&_matchStart, No.Take);
    matchEnd = new gtk.text_iter.TextIter(cast(void*)&_matchEnd, No.Take);
    return _retval;
  }

  /**
      The asynchronous version of [gtksource.search_context.SearchContext.forward].
      
      See the documentation of [gtksource.search_context.SearchContext.forward] for more
      details.
      
      See the #GAsyncResult documentation to know how to use this function.
      
      If the operation is cancelled, the callback will only be called if
      cancellable was not null. [gtksource.search_context.SearchContext.forwardAsync] takes
      ownership of cancellable, so you can unref it after calling this function.
  
      Params:
        iter = start of search.
        cancellable = a #GCancellable, or null.
        callback = a #GAsyncReadyCallback to call when the operation is finished.
  */
  void forwardAsync(gtk.text_iter.TextIter iter, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_source_search_context_forward_async(cast(GtkSourceSearchContext*)cPtr, iter ? cast(const(GtkTextIter)*)iter.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a forward search started with
      [gtksource.search_context.SearchContext.forwardAsync].
      
      See the documentation of [gtksource.search_context.SearchContext.forward] for more
      details.
  
      Params:
        result = a #GAsyncResult.
        matchStart = return location for start of match, or null.
        matchEnd = return location for end of match, or null.
        hasWrappedAround = return location to know whether the
            search has wrapped around, or null.
      Returns: whether a match was found.
      Throws: [ErrorG]
  */
  bool forwardFinish(gio.async_result.AsyncResult result, out gtk.text_iter.TextIter matchStart, out gtk.text_iter.TextIter matchEnd, out bool hasWrappedAround)
  {
    bool _retval;
    GtkTextIter _matchStart;
    GtkTextIter _matchEnd;
    GError *_err;
    _retval = gtk_source_search_context_forward_finish(cast(GtkSourceSearchContext*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_matchStart, &_matchEnd, cast(bool*)&hasWrappedAround, &_err);
    if (_err)
      throw new ErrorG(_err);
    matchStart = new gtk.text_iter.TextIter(cast(void*)&_matchStart, No.Take);
    matchEnd = new gtk.text_iter.TextIter(cast(void*)&_matchEnd, No.Take);
    return _retval;
  }

  /** */
  gtksource.buffer.Buffer getBuffer()
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_search_context_get_buffer(cast(GtkSourceSearchContext*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.buffer.Buffer)(cast(GtkSourceBuffer*)_cretval, No.Take);
    return _retval;
  }

  /** */
  bool getHighlight()
  {
    bool _retval;
    _retval = gtk_source_search_context_get_highlight(cast(GtkSourceSearchContext*)cPtr);
    return _retval;
  }

  /** */
  gtksource.style.Style getMatchStyle()
  {
    GtkSourceStyle* _cretval;
    _cretval = gtk_source_search_context_get_match_style(cast(GtkSourceSearchContext*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.style.Style)(cast(GtkSourceStyle*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the position of a search occurrence. If the buffer is not already fully
      scanned, the position may be unknown, and -1 is returned. If 0 is returned,
      it means that this part of the buffer has already been scanned, and that
      match_start and match_end don't delimit an occurrence.
  
      Params:
        matchStart = the start of the occurrence.
        matchEnd = the end of the occurrence.
      Returns: the position of the search occurrence. The first occurrence has the
        position 1 (not 0). Returns 0 if match_start and match_end don't delimit
        an occurrence. Returns -1 if the position is not yet known.
  */
  int getOccurrencePosition(gtk.text_iter.TextIter matchStart, gtk.text_iter.TextIter matchEnd)
  {
    int _retval;
    _retval = gtk_source_search_context_get_occurrence_position(cast(GtkSourceSearchContext*)cPtr, matchStart ? cast(const(GtkTextIter)*)matchStart.cPtr(No.Dup) : null, matchEnd ? cast(const(GtkTextIter)*)matchEnd.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the total number of search occurrences. If the buffer is not already
      fully scanned, the total number of occurrences is unknown, and -1 is
      returned.
      Returns: the total number of search occurrences, or -1 if unknown.
  */
  int getOccurrencesCount()
  {
    int _retval;
    _retval = gtk_source_search_context_get_occurrences_count(cast(GtkSourceSearchContext*)cPtr);
    return _retval;
  }

  /**
      Regular expression patterns must follow certain rules. If
      #GtkSourceSearchSettings:search-text breaks a rule, the error can be retrieved
      with this function. The error domain is #G_REGEX_ERROR.
      
      Free the return value with [glib.error.ErrorG.free].
      Returns: the #GError, or null if the pattern is valid.
  */
  glib.error.ErrorG getRegexError()
  {
    GError* _cretval;
    _cretval = gtk_source_search_context_get_regex_error(cast(GtkSourceSearchContext*)cPtr);
    auto _retval = _cretval ? new glib.error.ErrorG(cast(GError*)_cretval) : null;
    return _retval;
  }

  /** */
  gtksource.search_settings.SearchSettings getSettings()
  {
    GtkSourceSearchSettings* _cretval;
    _cretval = gtk_source_search_context_get_settings(cast(GtkSourceSearchContext*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.search_settings.SearchSettings)(cast(GtkSourceSearchSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
      Replaces a search match by another text. If match_start and match_end
      doesn't correspond to a search match, false is returned.
      
      match_start and match_end iters are revalidated to point to the replacement
      text boundaries.
      
      For a regular expression replacement, you can check if replace is valid by
      calling [glib.regex.Regex.checkReplacement]. The replace text can contain
      backreferences; read the [glib.regex.Regex.replace] documentation for more details.
  
      Params:
        matchStart = the start of the match to replace.
        matchEnd = the end of the match to replace.
        replace = the replacement text.
        replaceLength = the length of replace in bytes, or -1.
      Returns: whether the match has been replaced.
      Throws: [ErrorG]
  */
  bool replace(gtk.text_iter.TextIter matchStart, gtk.text_iter.TextIter matchEnd, string replace, int replaceLength)
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
      Replaces all search matches by another text. It is a synchronous function, so
      it can block the user interface.
      
      For a regular expression replacement, you can check if replace is valid by
      calling [glib.regex.Regex.checkReplacement]. The replace text can contain
      backreferences; read the [glib.regex.Regex.replace] documentation for more details.
  
      Params:
        replace = the replacement text.
        replaceLength = the length of replace in bytes, or -1.
      Returns: the number of replaced matches.
      Throws: [ErrorG]
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
      Enables or disables the search occurrences highlighting.
  
      Params:
        highlight = the setting.
  */
  void setHighlight(bool highlight)
  {
    gtk_source_search_context_set_highlight(cast(GtkSourceSearchContext*)cPtr, highlight);
  }

  /**
      Set the style to apply on search matches. If match_style is null, default
      theme's scheme 'match-style' will be used.
      To enable or disable the search highlighting, use
      [gtksource.search_context.SearchContext.setHighlight].
  
      Params:
        matchStyle = a #GtkSourceStyle, or null.
  */
  void setMatchStyle(gtksource.style.Style matchStyle = null)
  {
    gtk_source_search_context_set_match_style(cast(GtkSourceSearchContext*)cPtr, matchStyle ? cast(GtkSourceStyle*)matchStyle.cPtr(No.Dup) : null);
  }
}
