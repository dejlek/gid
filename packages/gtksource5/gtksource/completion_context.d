module gtksource.completion_context;

import gid.global;
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
import gtksource.completion_provider_mixin;
import gtksource.language;
import gtksource.types;
import gtksource.view;

/**
 * The context of a completion.
 * `GtkSourceCompletionContext` contains information about an attept to display
 * completion proposals to the user based on typed text in the class@View.
 * When typing, class@Completion may use registered
 * iface@CompletionProvider to determine if there may be results which
 * could be displayed. If so, a `GtkSourceCompletionContext` is created with
 * information that is provided to the iface@CompletionProvider to populate
 * results which might be useful to the user.
 * iface@CompletionProvider are expected to provide [gio.list_model.ListModel] with
 * iface@CompletionProposal which may be joined together in a list of
 * results for the user. They are also responsible for how the contents are
 * displayed using class@CompletionCell which allows for some level of
 * customization.
 */
class CompletionContext : ObjectG, ListModel
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_completion_context_get_type != &gidSymbolNotFound ? gtk_source_completion_context_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ListModelT!();

  /**
   * Gets the mode for which the context was activated.
   * Returns:
   */
  CompletionActivation getActivation()
  {
    GtkSourceCompletionActivation _cretval;
    _cretval = gtk_source_completion_context_get_activation(cast(GtkSourceCompletionContext*)cPtr);
    CompletionActivation _retval = cast(CompletionActivation)_cretval;
    return _retval;
  }

  /**
   * Gets the bounds for the completion, which is the beginning of the
   * current word $(LPAREN)taking break characters into account$(RPAREN) to the current
   * insertion cursor.
   * If begin is non-%NULL, it will be set to the start position of the
   * current word being completed.
   * If end is non-%NULL, it will be set to the insertion cursor for the
   * current word being completed.
   * Params:
   *   begin = a #GtkTextIter
   *   end = a #GtkTextIter
   * Returns: %TRUE if the marks are still valid and begin or end was set.
   */
  bool getBounds(out TextIter begin, out TextIter end)
  {
    bool _retval;
    GtkTextIter _begin;
    GtkTextIter _end;
    _retval = gtk_source_completion_context_get_bounds(cast(GtkSourceCompletionContext*)cPtr, &_begin, &_end);
    begin = new TextIter(cast(void*)&_begin, No.Take);
    end = new TextIter(cast(void*)&_end, No.Take);
    return _retval;
  }

  /**
   * Gets the underlying buffer used by the context.
   * This is a convenience function to get the buffer via the #GtkSourceCompletion
   * property.
   * Returns: a #GtkTextBuffer or %NULL
   */
  Buffer getBuffer()
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_completion_context_get_buffer(cast(GtkSourceCompletionContext*)cPtr);
    auto _retval = ObjectG.getDObject!Buffer(cast(GtkSourceBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the "busy" property. This is set to %TRUE while the completion
   * context is actively fetching proposals from registered
   * #GtkSourceCompletionProvider's.
   * Returns: %TRUE if the context is busy
   */
  bool getBusy()
  {
    bool _retval;
    _retval = gtk_source_completion_context_get_busy(cast(GtkSourceCompletionContext*)cPtr);
    return _retval;
  }

  /**
   * Gets the #GtkSourceCompletion that created the context.
   * Returns: an #GtkSourceCompletion or %NULL
   */
  Completion getCompletion()
  {
    GtkSourceCompletion* _cretval;
    _cretval = gtk_source_completion_context_get_completion(cast(GtkSourceCompletionContext*)cPtr);
    auto _retval = ObjectG.getDObject!Completion(cast(GtkSourceCompletion*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Checks if any proposals have been provided to the context.
   * Out of convenience, this function will return %TRUE if self is %NULL.
   * Returns: %TRUE if there are no proposals in the context
   */
  bool getEmpty()
  {
    bool _retval;
    _retval = gtk_source_completion_context_get_empty(cast(GtkSourceCompletionContext*)cPtr);
    return _retval;
  }

  /**
   * Gets the language of the underlying buffer, if any.
   * Returns: a #GtkSourceLanguage or %NULL
   */
  Language getLanguage()
  {
    GtkSourceLanguage* _cretval;
    _cretval = gtk_source_completion_context_get_language(cast(GtkSourceCompletionContext*)cPtr);
    auto _retval = ObjectG.getDObject!Language(cast(GtkSourceLanguage*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the #GListModel associated with the provider.
   * You can connect to #GtkSourceCompletionContext::model-changed to receive
   * notifications about when the model has been replaced by a new model.
   * Params:
   *   provider = a #GtkSourceCompletionProvider
   * Returns: a #GListModel or %NULL
   */
  ListModel getProposalsForProvider(CompletionProvider provider)
  {
    GListModel* _cretval;
    _cretval = gtk_source_completion_context_get_proposals_for_provider(cast(GtkSourceCompletionContext*)cPtr, provider ? cast(GtkSourceCompletionProvider*)(cast(ObjectG)provider).cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!ListModel(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the text view for the context.
   * Returns: a #GtkSourceView or %NULL
   */
  View getView()
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_completion_context_get_view(cast(GtkSourceCompletionContext*)cPtr);
    auto _retval = ObjectG.getDObject!View(cast(GtkSourceView*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the word that is being completed up to the position of the insert mark.
   * Returns: a string containing the current word
   */
  string getWord()
  {
    char* _cretval;
    _cretval = gtk_source_completion_context_get_word(cast(GtkSourceCompletionContext*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Gets the providers that are associated with the context.
   * Returns: a #GListModel of #GtkSourceCompletionProvider
   */
  ListModel listProviders()
  {
    GListModel* _cretval;
    _cretval = gtk_source_completion_context_list_providers(cast(GtkSourceCompletionContext*)cPtr);
    auto _retval = ObjectG.getDObject!ListModel(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * This function allows providers to update their results for a context
   * outside of a call to [gtksource.completion_provider.CompletionProvider.populateAsync].
   * This can be used to immediately return results for a provider while it does
   * additional asynchronous work. Doing so will allow the completions to
   * update while the operation is in progress.
   * Params:
   *   provider = an #GtkSourceCompletionProvider
   *   results = a #GListModel or %NULL
   */
  void setProposalsForProvider(CompletionProvider provider, ListModel results)
  {
    gtk_source_completion_context_set_proposals_for_provider(cast(GtkSourceCompletionContext*)cPtr, provider ? cast(GtkSourceCompletionProvider*)(cast(ObjectG)provider).cPtr(No.Dup) : null, results ? cast(GListModel*)(cast(ObjectG)results).cPtr(No.Dup) : null);
  }

  /**
   * Emitted when a provider changes a model.
   * This signal is primarily useful for #GtkSourceCompletionProvider's
   * that want to track other providers in context. For example, it can
   * be used to create a "top results" provider.
   * Params
   *   provider = a #GtkSourceCompletionProvider
   *   model = a #GListModel
   *   completionContext = the instance the signal is connected to
   */
  alias ProviderModelChangedCallbackDlg = void delegate(CompletionProvider provider, ListModel model, CompletionContext completionContext);
  alias ProviderModelChangedCallbackFunc = void function(CompletionProvider provider, ListModel model, CompletionContext completionContext);

  /**
   * Connect to ProviderModelChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectProviderModelChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ProviderModelChangedCallbackDlg) || is(T : ProviderModelChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto completionContext = getVal!CompletionContext(_paramVals);
      auto provider = getVal!CompletionProvider(&_paramVals[1]);
      auto model = getVal!ListModel(&_paramVals[2]);
      _dClosure.dlg(provider, model, completionContext);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("provider-model-changed", closure, after);
  }
}
