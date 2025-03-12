module gtksource.completion;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtksource.buffer;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.completion_provider;
import gtksource.types;
import gtksource.view;
import pango.attr_list;

/**
    Main Completion Object.
  
  The completion system helps the user when they writes some text,
  such as words, command names, functions, and suchlike. Proposals can
  be shown, to complete the text the user is writing. Each proposal can
  contain an additional piece of information (for example
  documentation), that is displayed when the "Details" button is
  clicked.
  
  Proposals are created via a `iface@CompletionProvider`. There can
  be for example a provider to complete words (see `class@CompletionWords`),
  another provider for the completion of
  function names, etc. To add a provider, call
  [gtksource.completion.Completion.addProvider].
  
  The `iface@CompletionProposal` interface represents a proposal.
  
  If a proposal contains extra information (see
  [gtksource.types.CompletionColumn.Details]), it will be
  displayed in a supplemental details window, which appears when
  the "Details" button is clicked.
  
  Each `class@View` object is associated with a `class@Completion`
  instance. This instance can be obtained with
  [gtksource.view.View.getCompletion]. The `class@View` class contains also the
  `signal@View::show-completion` signal.
  
  A same `iface@CompletionProvider` object can be used for several
  [gtksource.completion.Completion]'s.
*/
class Completion : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_completion_get_type != &gidSymbolNotFound ? gtk_source_completion_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Completion self()
  {
    return this;
  }

  /**
      This will add `<b>` tags around matched characters in haystack
    based on casefold_query.
    Params:
      haystack =       the string to be highlighted
      casefoldQuery =       the typed-text used to highlight haystack
    Returns:     a #PangoAttrList or null
  */
  static pango.attr_list.AttrList fuzzyHighlight(string haystack, string casefoldQuery)
  {
    PangoAttrList* _cretval;
    const(char)* _haystack = haystack.toCString(No.Alloc);
    const(char)* _casefoldQuery = casefoldQuery.toCString(No.Alloc);
    _cretval = gtk_source_completion_fuzzy_highlight(_haystack, _casefoldQuery);
    auto _retval = _cretval ? new pango.attr_list.AttrList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      This helper function can do a fuzzy match for you giving a haystack and
    casefolded needle.
    
    Casefold your needle using `funcGLib.utf8_casefold` before
    running the query.
    
    Score will be set with the score of the match upon success. Otherwise,
    it will be set to zero.
    Params:
      haystack =       the string to be searched.
      casefoldNeedle =       A [glib.global.utf8Casefold] version of the needle.
      priority =       An optional location for the score of the match
    Returns:     true if haystack matched casefold_needle, otherwise false.
  */
  static bool fuzzyMatch(string haystack, string casefoldNeedle, out uint priority)
  {
    bool _retval;
    const(char)* _haystack = haystack.toCString(No.Alloc);
    const(char)* _casefoldNeedle = casefoldNeedle.toCString(No.Alloc);
    _retval = gtk_source_completion_fuzzy_match(_haystack, _casefoldNeedle, cast(uint*)&priority);
    return _retval;
  }

  /**
      Adds a `ifaceCompletionProvider` to the list of providers to be queried
    for completion results.
    Params:
      provider =       a #GtkSourceCompletionProvider
  */
  void addProvider(gtksource.completion_provider.CompletionProvider provider)
  {
    gtk_source_completion_add_provider(cast(GtkSourceCompletion*)cPtr, provider ? cast(GtkSourceCompletionProvider*)(cast(ObjectG)provider).cPtr(No.Dup) : null);
  }

  /** */
  void blockInteractive()
  {
    gtk_source_completion_block_interactive(cast(GtkSourceCompletion*)cPtr);
  }

  /**
      Gets the connected `classView`'s `classBuffer`
    Returns:     A #GtkSourceBuffer
  */
  gtksource.buffer.Buffer getBuffer()
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_completion_get_buffer(cast(GtkSourceCompletion*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.buffer.Buffer)(cast(GtkSourceBuffer*)_cretval, No.Take);
    return _retval;
  }

  /** */
  uint getPageSize()
  {
    uint _retval;
    _retval = gtk_source_completion_get_page_size(cast(GtkSourceCompletion*)cPtr);
    return _retval;
  }

  /**
      Gets the `classView` that owns the `classCompletion`.
    Returns:     A #GtkSourceView
  */
  gtksource.view.View getView()
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_completion_get_view(cast(GtkSourceCompletion*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.view.View)(cast(GtkSourceView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Emits the "hide" signal.
    
    When the "hide" signal is emitted, the completion window will be
    dismissed.
  */
  void hide()
  {
    gtk_source_completion_hide(cast(GtkSourceCompletion*)cPtr);
  }

  /**
      Removes a `ifaceCompletionProvider` previously added with
    [gtksource.completion.Completion.addProvider].
    Params:
      provider =       a #GtkSourceCompletionProvider
  */
  void removeProvider(gtksource.completion_provider.CompletionProvider provider)
  {
    gtk_source_completion_remove_provider(cast(GtkSourceCompletion*)cPtr, provider ? cast(GtkSourceCompletionProvider*)(cast(ObjectG)provider).cPtr(No.Dup) : null);
  }

  /** */
  void setPageSize(uint pageSize)
  {
    gtk_source_completion_set_page_size(cast(GtkSourceCompletion*)cPtr, pageSize);
  }

  /**
      Emits the "show" signal.
    
    When the "show" signal is emitted, the completion window will be
    displayed if there are any results available.
  */
  void show()
  {
    gtk_source_completion_show(cast(GtkSourceCompletion*)cPtr);
  }

  /** */
  void unblockInteractive()
  {
    gtk_source_completion_unblock_interactive(cast(GtkSourceCompletion*)cPtr);
  }

  /**
      The "hide" signal is emitted when the completion window should
    be hidden.
  
    ## Parameters
    $(LIST
      * $(B completion) the instance the signal is connected to
    )
  */
  alias HideCallbackDlg = void delegate(gtksource.completion.Completion completion);

  /** ditto */
  alias HideCallbackFunc = void function(gtksource.completion.Completion completion);

  /**
    Connect to Hide signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectHide(T)(T callback, Flag!"After" after = No.After)
  if (is(T : HideCallbackDlg) || is(T : HideCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto completion = getVal!(gtksource.completion.Completion)(_paramVals);
      _dClosure.dlg(completion);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("hide", closure, after);
  }

  /**
      The "provided-added" signal is emitted when a new provider is
    added to the completion.
  
    ## Parameters
    $(LIST
      * $(B provider)       a #GtkSourceCompletionProvider
      * $(B completion) the instance the signal is connected to
    )
  */
  alias ProviderAddedCallbackDlg = void delegate(gtksource.completion_provider.CompletionProvider provider, gtksource.completion.Completion completion);

  /** ditto */
  alias ProviderAddedCallbackFunc = void function(gtksource.completion_provider.CompletionProvider provider, gtksource.completion.Completion completion);

  /**
    Connect to ProviderAdded signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectProviderAdded(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ProviderAddedCallbackDlg) || is(T : ProviderAddedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto completion = getVal!(gtksource.completion.Completion)(_paramVals);
      auto provider = getVal!(gtksource.completion_provider.CompletionProvider)(&_paramVals[1]);
      _dClosure.dlg(provider, completion);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("provider-added", closure, after);
  }

  /**
      The "provided-removed" signal is emitted when a provider has
    been removed from the completion.
  
    ## Parameters
    $(LIST
      * $(B provider)       a #GtkSourceCompletionProvider
      * $(B completion) the instance the signal is connected to
    )
  */
  alias ProviderRemovedCallbackDlg = void delegate(gtksource.completion_provider.CompletionProvider provider, gtksource.completion.Completion completion);

  /** ditto */
  alias ProviderRemovedCallbackFunc = void function(gtksource.completion_provider.CompletionProvider provider, gtksource.completion.Completion completion);

  /**
    Connect to ProviderRemoved signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectProviderRemoved(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ProviderRemovedCallbackDlg) || is(T : ProviderRemovedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto completion = getVal!(gtksource.completion.Completion)(_paramVals);
      auto provider = getVal!(gtksource.completion_provider.CompletionProvider)(&_paramVals[1]);
      _dClosure.dlg(provider, completion);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("provider-removed", closure, after);
  }

  /**
      The "show" signal is emitted when the completion window should
    be shown.
  
    ## Parameters
    $(LIST
      * $(B completion) the instance the signal is connected to
    )
  */
  alias ShowCallbackDlg = void delegate(gtksource.completion.Completion completion);

  /** ditto */
  alias ShowCallbackFunc = void function(gtksource.completion.Completion completion);

  /**
    Connect to Show signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectShow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ShowCallbackDlg) || is(T : ShowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto completion = getVal!(gtksource.completion.Completion)(_paramVals);
      _dClosure.dlg(completion);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show", closure, after);
  }
}
