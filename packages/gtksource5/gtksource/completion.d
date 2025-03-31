/// Module for [Completion] class
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

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_completion_get_type != &gidSymbolNotFound ? gtk_source_completion_get_type() : cast(GType)0;
  }

  /** */
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
        haystack = the string to be highlighted
        casefoldQuery = the typed-text used to highlight haystack
      Returns: a #PangoAttrList or null
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
        haystack = the string to be searched.
        casefoldNeedle = A [glib.global.utf8Casefold] version of the needle.
        priority = An optional location for the score of the match
      Returns: true if haystack matched casefold_needle, otherwise false.
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
        provider = a #GtkSourceCompletionProvider
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
      Returns: A #GtkSourceBuffer
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
      Returns: A #GtkSourceView
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
        provider = a #GtkSourceCompletionProvider
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
      Connect to `Hide` signal.
  
      The "hide" signal is emitted when the completion window should
      be hidden.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.completion.Completion completion))
  
          `completion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectHide(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.completion.Completion)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("hide", closure, after);
  }

  /**
      Connect to `ProviderAdded` signal.
  
      The "provided-added" signal is emitted when a new provider is
      added to the completion.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.completion_provider.CompletionProvider provider, gtksource.completion.Completion completion))
  
          `provider` a #GtkSourceCompletionProvider (optional)
  
          `completion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectProviderAdded(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.completion_provider.CompletionProvider)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtksource.completion.Completion)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("provider-added", closure, after);
  }

  /**
      Connect to `ProviderRemoved` signal.
  
      The "provided-removed" signal is emitted when a provider has
      been removed from the completion.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.completion_provider.CompletionProvider provider, gtksource.completion.Completion completion))
  
          `provider` a #GtkSourceCompletionProvider (optional)
  
          `completion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectProviderRemoved(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.completion_provider.CompletionProvider)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtksource.completion.Completion)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("provider-removed", closure, after);
  }

  /**
      Connect to `Show` signal.
  
      The "show" signal is emitted when the completion window should
      be shown.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.completion.Completion completion))
  
          `completion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectShow(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.completion.Completion)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show", closure, after);
  }
}
