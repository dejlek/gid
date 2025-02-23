module gtksource.completion_provider_mixin;

public import gtksource.completion_provider_iface_proxy;
public import gdk.types;
public import gid.gid;
public import gio.async_result;
public import gio.async_result_mixin;
public import gio.cancellable;
public import gio.list_model;
public import gio.list_model_mixin;
public import gio.types;
public import glib.error;
public import gobject.object;
public import gtk.text_iter;
public import gtksource.c.functions;
public import gtksource.c.types;
public import gtksource.completion_cell;
public import gtksource.completion_context;
public import gtksource.completion_proposal;
public import gtksource.completion_proposal_mixin;
public import gtksource.types;

/**
 * Completion provider interface.
 * You must implement this interface to provide proposals to class@Completion.
 * In most cases, implementations of this interface will want to use
 * vfunc@CompletionProvider.populate_async to asynchronously populate the results
 * to avoid blocking the main loop.
 */
template CompletionProviderT()
{

  /**
   * This function requests proposal to be activated by the
   * #GtkSourceCompletionProvider.
   * What the provider does to activate the proposal is specific to that
   * provider. Many providers may choose to insert a #GtkSourceSnippet with
   * edit points the user may cycle through.
   * See also: classSnippet, classSnippetChunk, [GtkSource.View.pushSnippet]
   * Params:
   *   context = a #GtkSourceCompletionContext
   *   proposal = a #GtkSourceCompletionProposal
   */
  override void activate(CompletionContext context, CompletionProposal proposal)
  {
    gtk_source_completion_provider_activate(cast(GtkSourceCompletionProvider*)cPtr, context ? cast(GtkSourceCompletionContext*)context.cPtr(No.Dup) : null, proposal ? cast(GtkSourceCompletionProposal*)(cast(ObjectG)proposal).cPtr(No.Dup) : null);
  }

  /**
   * This function requests that the #GtkSourceCompletionProvider prepares
   * cell to display the contents of proposal.
   * Based on cells column type, you may want to display different information.
   * This allows for columns of information among completion proposals
   * resulting in better alignment of similar content $(LPAREN)icons, return types,
   * method names, and parameter lists$(RPAREN).
   * Params:
   *   context = a #GtkSourceCompletionContext
   *   proposal = a #GtkSourceCompletionProposal
   *   cell = a #GtkSourceCompletionCell
   */
  override void display(CompletionContext context, CompletionProposal proposal, CompletionCell cell)
  {
    gtk_source_completion_provider_display(cast(GtkSourceCompletionProvider*)cPtr, context ? cast(GtkSourceCompletionContext*)context.cPtr(No.Dup) : null, proposal ? cast(GtkSourceCompletionProposal*)(cast(ObjectG)proposal).cPtr(No.Dup) : null, cell ? cast(GtkSourceCompletionCell*)cell.cPtr(No.Dup) : null);
  }

  /**
   * This function should return the priority of self in context.
   * The priority is used to sort groups of completion proposals by
   * provider so that higher priority providers results are shown
   * above lower priority providers.
   * Higher value indicates higher priority.
   * Params:
   *   context = a #GtkSourceCompletionContext
   * Returns:
   */
  override int getPriority(CompletionContext context)
  {
    int _retval;
    _retval = gtk_source_completion_provider_get_priority(cast(GtkSourceCompletionProvider*)cPtr, context ? cast(GtkSourceCompletionContext*)context.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Gets the title of the completion provider, if any.
   * Currently, titles are not displayed in the completion results, but may be
   * at some point in the future when non-%NULL.
   * Returns: a title for the provider or %NULL
   */
  override string getTitle()
  {
    char* _cretval;
    _cretval = gtk_source_completion_provider_get_title(cast(GtkSourceCompletionProvider*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  /**
   * This function is used to determine if a character inserted into the text
   * editor should cause a new completion request to be triggered.
   * An example would be period '.' which might indicate that the user wants
   * to complete method or field names of an object.
   * This method will only trigger when text is inserted into the #GtkTextBuffer
   * while the completion list is visible and a proposal is selected. Incremental
   * key-presses $(LPAREN)like shift, control, or alt$(RPAREN) are not triggerable.
   * Params:
   *   iter = a #GtkTextIter
   *   ch = a #gunichar of the character inserted
   * Returns:
   */
  override bool isTrigger(TextIter iter, dchar ch)
  {
    bool _retval;
    _retval = gtk_source_completion_provider_is_trigger(cast(GtkSourceCompletionProvider*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null, ch);
    return _retval;
  }

  /**
   * This function is used to determine if a key typed by the user should
   * activate proposal $(LPAREN)resulting in committing the text to the editor$(RPAREN).
   * This is useful when using languages where convention may lead to less
   * typing by the user. One example may be the use of "." or "-" to expand
   * a field access in the C programming language.
   * Params:
   *   context = a #GtkSourceCompletionContext
   *   proposal = a #GtkSourceCompletionProposal
   *   keyval = a keyval such as [Gdk.KEY_period]
   *   state = a #GdkModifierType or 0
   * Returns:
   */
  override bool keyActivates(CompletionContext context, CompletionProposal proposal, uint keyval, ModifierType state)
  {
    bool _retval;
    _retval = gtk_source_completion_provider_key_activates(cast(GtkSourceCompletionProvider*)cPtr, context ? cast(GtkSourceCompletionContext*)context.cPtr(No.Dup) : null, proposal ? cast(GtkSourceCompletionProposal*)(cast(ObjectG)proposal).cPtr(No.Dup) : null, keyval, state);
    return _retval;
  }

  /**
   * Providers should return a list of alternates to proposal or %NULL if
   * there are no alternates available.
   * This can be used by the completion view to allow the user to move laterally
   * through similar proposals, such as overrides of methods by the same name.
   * Params:
   *   context = a #GtkSourceCompletionContext
   *   proposal = a #GtkSourceCompletionProposal
   * Returns: a #GPtrArray of #GtkSourceCompletionProposal or %NULL.
   */
  override CompletionProposal[] listAlternates(CompletionContext context, CompletionProposal proposal)
  {
    GPtrArray* _cretval;
    _cretval = gtk_source_completion_provider_list_alternates(cast(GtkSourceCompletionProvider*)cPtr, context ? cast(GtkSourceCompletionContext*)context.cPtr(No.Dup) : null, proposal ? cast(GtkSourceCompletionProposal*)(cast(ObjectG)proposal).cPtr(No.Dup) : null);
    auto _retval = gPtrArrayToD!(CompletionProposal, GidOwnership.Full)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /**
   * Asynchronously requests that the provider populates the completion
   * results for context.
   * For providers that would like to populate a [Gio.ListModel] while those
   * results are displayed to the user,
   * [GtkSource.CompletionContext.setProposalsForProvider] may be used
   * to reduce latency until the user sees results.
   * Params:
   *   context = a #GtkSourceCompletionContext
   *   cancellable = a #GCancellable or %NULL
   *   callback = a callback to execute upon completion
   */
  override void populateAsync(CompletionContext context, Cancellable cancellable, AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!ObjectG(cast(void*)sourceObject, No.Take), ObjectG.getDObject!AsyncResult(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_source_completion_provider_populate_async(cast(GtkSourceCompletionProvider*)cPtr, context ? cast(GtkSourceCompletionContext*)context.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Completes an asynchronous operation to populate a completion provider.
   * Params:
   *   result = a #GAsyncResult provided to callback
   * Returns: a #GListModel of #GtkSourceCompletionProposal
   */
  override ListModel populateFinish(AsyncResult result)
  {
    GListModel* _cretval;
    GError *_err;
    _cretval = gtk_source_completion_provider_populate_finish(cast(GtkSourceCompletionProvider*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!ListModel(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * This function can be used to filter results previously provided to
   * the classCompletionContext by the #GtkSourceCompletionProvider.
   * This can happen as the user types additional text onto the word so
   * that previously matched items may be removed from the list instead of
   * generating new [Gio.ListModel] of results.
   * Params:
   *   context = a #GtkSourceCompletionContext
   *   model = a #GListModel
   */
  override void refilter(CompletionContext context, ListModel model)
  {
    gtk_source_completion_provider_refilter(cast(GtkSourceCompletionProvider*)cPtr, context ? cast(GtkSourceCompletionContext*)context.cPtr(No.Dup) : null, model ? cast(GListModel*)(cast(ObjectG)model).cPtr(No.Dup) : null);
  }
}
