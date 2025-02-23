module GtkSource.CompletionProvider;

public import GtkSource.CompletionProviderIfaceProxy;
import GLib.ErrorG;
import GObject.ObjectG;
import Gdk.Types;
import Gid.gid;
import Gio.AsyncResult;
import Gio.AsyncResultT;
import Gio.Cancellable;
import Gio.ListModel;
import Gio.ListModelT;
import Gio.Types;
import Gtk.TextIter;
import GtkSource.CompletionCell;
import GtkSource.CompletionContext;
import GtkSource.CompletionProposal;
import GtkSource.CompletionProposalT;
import GtkSource.Types;
import GtkSource.c.functions;
import GtkSource.c.types;

/**
 * Completion provider interface.
 * You must implement this interface to provide proposals to class@Completion.
 * In most cases, implementations of this interface will want to use
 * vfunc@CompletionProvider.populate_async to asynchronously populate the results
 * to avoid blocking the main loop.
 */
interface CompletionProvider
{

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_completion_provider_get_type != &gidSymbolNotFound ? gtk_source_completion_provider_get_type() : cast(GType)0;
  }

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
  void activate(CompletionContext context, CompletionProposal proposal);

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
  void display(CompletionContext context, CompletionProposal proposal, CompletionCell cell);

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
  int getPriority(CompletionContext context);

  /**
   * Gets the title of the completion provider, if any.
   * Currently, titles are not displayed in the completion results, but may be
   * at some point in the future when non-%NULL.
   * Returns: a title for the provider or %NULL
   */
  string getTitle();

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
  bool isTrigger(TextIter iter, dchar ch);

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
  bool keyActivates(CompletionContext context, CompletionProposal proposal, uint keyval, ModifierType state);

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
  CompletionProposal[] listAlternates(CompletionContext context, CompletionProposal proposal);

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
  void populateAsync(CompletionContext context, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Completes an asynchronous operation to populate a completion provider.
   * Params:
   *   result = a #GAsyncResult provided to callback
   * Returns: a #GListModel of #GtkSourceCompletionProposal
   */
  ListModel populateFinish(AsyncResult result);

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
  void refilter(CompletionContext context, ListModel model);
}
