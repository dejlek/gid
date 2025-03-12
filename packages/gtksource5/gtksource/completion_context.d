module gtksource.completion_context;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.dclosure;
import gobject.object;
import gtk.text_iter;
import gtksource.buffer;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.completion;
import gtksource.completion_provider;
import gtksource.language;
import gtksource.types;
import gtksource.view;

/**
    The context of a completion.
  
  [gtksource.completion_context.CompletionContext] contains information about an attept to display
  completion proposals to the user based on typed text in the `class@View`.
  
  When typing, `class@Completion` may use registered
  `iface@CompletionProvider` to determine if there may be results which
  could be displayed. If so, a [gtksource.completion_context.CompletionContext] is created with
  information that is provided to the `iface@CompletionProvider` to populate
  results which might be useful to the user.
  
  `iface@CompletionProvider` are expected to provide [gio.list_model.ListModel] with
  `iface@CompletionProposal` which may be joined together in a list of
  results for the user. They are also responsible for how the contents are
  displayed using `class@CompletionCell` which allows for some level of
  customization.
*/
class CompletionContext : gobject.object.ObjectG, gio.list_model.ListModel
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_completion_context_get_type != &gidSymbolNotFound ? gtk_source_completion_context_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override CompletionContext self()
  {
    return this;
  }

  mixin ListModelT!();

  /**
      Gets the mode for which the context was activated.
    Returns: 
  */
  gtksource.types.CompletionActivation getActivation()
  {
    GtkSourceCompletionActivation _cretval;
    _cretval = gtk_source_completion_context_get_activation(cast(GtkSourceCompletionContext*)cPtr);
    gtksource.types.CompletionActivation _retval = cast(gtksource.types.CompletionActivation)_cretval;
    return _retval;
  }

  /**
      Gets the bounds for the completion, which is the beginning of the
    current word (taking break characters into account) to the current
    insertion cursor.
    
    If begin is non-null, it will be set to the start position of the
    current word being completed.
    
    If end is non-null, it will be set to the insertion cursor for the
    current word being completed.
    Params:
      begin =       a #GtkTextIter
      end =       a #GtkTextIter
    Returns:     true if the marks are still valid and begin or end was set.
  */
  bool getBounds(out gtk.text_iter.TextIter begin, out gtk.text_iter.TextIter end)
  {
    bool _retval;
    GtkTextIter _begin;
    GtkTextIter _end;
    _retval = gtk_source_completion_context_get_bounds(cast(GtkSourceCompletionContext*)cPtr, &_begin, &_end);
    begin = new gtk.text_iter.TextIter(cast(void*)&_begin, No.Take);
    end = new gtk.text_iter.TextIter(cast(void*)&_end, No.Take);
    return _retval;
  }

  /**
      Gets the underlying buffer used by the context.
    
    This is a convenience function to get the buffer via the #GtkSourceCompletion
    property.
    Returns:     a #GtkTextBuffer or null
  */
  gtksource.buffer.Buffer getBuffer()
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_completion_context_get_buffer(cast(GtkSourceCompletionContext*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.buffer.Buffer)(cast(GtkSourceBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the "busy" property. This is set to true while the completion
    context is actively fetching proposals from registered
    #GtkSourceCompletionProvider's.
    Returns:     true if the context is busy
  */
  bool getBusy()
  {
    bool _retval;
    _retval = gtk_source_completion_context_get_busy(cast(GtkSourceCompletionContext*)cPtr);
    return _retval;
  }

  /**
      Gets the #GtkSourceCompletion that created the context.
    Returns:     an #GtkSourceCompletion or null
  */
  gtksource.completion.Completion getCompletion()
  {
    GtkSourceCompletion* _cretval;
    _cretval = gtk_source_completion_context_get_completion(cast(GtkSourceCompletionContext*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.completion.Completion)(cast(GtkSourceCompletion*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if any proposals have been provided to the context.
    
    Out of convenience, this function will return true if self is null.
    Returns:     true if there are no proposals in the context
  */
  bool getEmpty()
  {
    bool _retval;
    _retval = gtk_source_completion_context_get_empty(cast(GtkSourceCompletionContext*)cPtr);
    return _retval;
  }

  /**
      Gets the language of the underlying buffer, if any.
    Returns:     a #GtkSourceLanguage or null
  */
  gtksource.language.Language getLanguage()
  {
    GtkSourceLanguage* _cretval;
    _cretval = gtk_source_completion_context_get_language(cast(GtkSourceCompletionContext*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.language.Language)(cast(GtkSourceLanguage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GListModel associated with the provider.
    
    You can connect to #GtkSourceCompletionContext::model-changed to receive
    notifications about when the model has been replaced by a new model.
    Params:
      provider =       a #GtkSourceCompletionProvider
    Returns:     a #GListModel or null
  */
  gio.list_model.ListModel getProposalsForProvider(gtksource.completion_provider.CompletionProvider provider)
  {
    GListModel* _cretval;
    _cretval = gtk_source_completion_context_get_proposals_for_provider(cast(GtkSourceCompletionContext*)cPtr, provider ? cast(GtkSourceCompletionProvider*)(cast(ObjectG)provider).cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the text view for the context.
    Returns:     a #GtkSourceView or null
  */
  gtksource.view.View getView()
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_completion_context_get_view(cast(GtkSourceCompletionContext*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.view.View)(cast(GtkSourceView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the word that is being completed up to the position of the insert mark.
    Returns:     a string containing the current word
  */
  string getWord()
  {
    char* _cretval;
    _cretval = gtk_source_completion_context_get_word(cast(GtkSourceCompletionContext*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the providers that are associated with the context.
    Returns:     a #GListModel of #GtkSourceCompletionProvider
  */
  gio.list_model.ListModel listProviders()
  {
    GListModel* _cretval;
    _cretval = gtk_source_completion_context_list_providers(cast(GtkSourceCompletionContext*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This function allows providers to update their results for a context
    outside of a call to [gtksource.completion_provider.CompletionProvider.populateAsync].
    
    This can be used to immediately return results for a provider while it does
    additional asynchronous work. Doing so will allow the completions to
    update while the operation is in progress.
    Params:
      provider =       an #GtkSourceCompletionProvider
      results =       a #GListModel or null
  */
  void setProposalsForProvider(gtksource.completion_provider.CompletionProvider provider, gio.list_model.ListModel results = null)
  {
    gtk_source_completion_context_set_proposals_for_provider(cast(GtkSourceCompletionContext*)cPtr, provider ? cast(GtkSourceCompletionProvider*)(cast(ObjectG)provider).cPtr(No.Dup) : null, results ? cast(GListModel*)(cast(ObjectG)results).cPtr(No.Dup) : null);
  }

  /**
      Emitted when a provider changes a model.
    
    This signal is primarily useful for #GtkSourceCompletionProvider's
    that want to track other providers in context. For example, it can
    be used to create a "top results" provider.
  
    ## Parameters
    $(LIST
      * $(B provider)       a #GtkSourceCompletionProvider
      * $(B model)       a #GListModel
      * $(B completionContext) the instance the signal is connected to
    )
  */
  alias ProviderModelChangedCallbackDlg = void delegate(gtksource.completion_provider.CompletionProvider provider, gio.list_model.ListModel model, gtksource.completion_context.CompletionContext completionContext);

  /** ditto */
  alias ProviderModelChangedCallbackFunc = void function(gtksource.completion_provider.CompletionProvider provider, gio.list_model.ListModel model, gtksource.completion_context.CompletionContext completionContext);

  /**
    Connect to ProviderModelChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectProviderModelChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ProviderModelChangedCallbackDlg) || is(T : ProviderModelChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto completionContext = getVal!(gtksource.completion_context.CompletionContext)(_paramVals);
      auto provider = getVal!(gtksource.completion_provider.CompletionProvider)(&_paramVals[1]);
      auto model = getVal!(gio.list_model.ListModel)(&_paramVals[2]);
      _dClosure.dlg(provider, model, completionContext);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("provider-model-changed", closure, after);
  }
}
