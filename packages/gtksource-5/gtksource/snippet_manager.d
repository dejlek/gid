module gtksource.snippet_manager;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.snippet;
import gtksource.types;

/**
 * Provides access to class@Snippet.
 * `GtkSourceSnippetManager` is an object which processes snippet description
 * files and creates class@Snippet objects.
 * Use [GtkSource.SnippetManager.getDefault] to retrieve the default
 * instance of `GtkSourceSnippetManager`.
 * Use [GtkSource.SnippetManager.getSnippet] to retrieve snippets for
 * a given snippets.
 */
class SnippetManager : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_snippet_manager_get_type != &gidSymbolNotFound ? gtk_source_snippet_manager_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Returns the default #GtkSourceSnippetManager instance.
   * Returns: a #GtkSourceSnippetManager which
   *   is owned by GtkSourceView library and must not be unref'd.
   */
  static SnippetManager getDefault()
  {
    GtkSourceSnippetManager* _cretval;
    _cretval = gtk_source_snippet_manager_get_default();
    auto _retval = ObjectG.getDObject!SnippetManager(cast(GtkSourceSnippetManager*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Queries the known snippets for the first matching group, language_id,
   * and/or trigger.
   * If group or language_id are %NULL, they will be ignored.
   * Params:
   *   group = a group name or %NULL
   *   languageId = a #GtkSourceLanguage:id or %NULL
   *   trigger = the trigger for the snippet
   * Returns: a #GtkSourceSnippet or %NULL if no
   *   matching snippet was found.
   */
  Snippet getSnippet(string group, string languageId, string trigger)
  {
    GtkSourceSnippet* _cretval;
    const(char)* _group = group.toCString(No.Alloc);
    const(char)* _languageId = languageId.toCString(No.Alloc);
    const(char)* _trigger = trigger.toCString(No.Alloc);
    _cretval = gtk_source_snippet_manager_get_snippet(cast(GtkSourceSnippetManager*)cPtr, _group, _languageId, _trigger);
    auto _retval = ObjectG.getDObject!Snippet(cast(GtkSourceSnippet*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Gets a [Gio.ListModel] of all snippets.
   * This can be used to get an unfiltered list of all of the snippets
   * known to the snippet manager.
   * Returns: a [Gio.ListModel] of [GtkSource.Snippet]
   */
  ListModel listAll()
  {
    GListModel* _cretval;
    _cretval = gtk_source_snippet_manager_list_all(cast(GtkSourceSnippetManager*)cPtr);
    auto _retval = ObjectG.getDObject!ListModel(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Queries the known snippets for those matching group, language_id, and/or
   * trigger_prefix.
   * If any of these are %NULL, they will be ignored when filtering the available snippets.
   * The [Gio.ListModel] only contains information about the available snippets until
   * [Gio.ListModel.getItem] is called for a specific snippet. This helps reduce
   * the number of [GObject.ObjectG]'s that are created at runtime to those needed by
   * the calling application.
   * Params:
   *   group = a group name or %NULL
   *   languageId = a #GtkSourceLanguage:id or %NULL
   *   triggerPrefix = a prefix for a trigger to activate
   * Returns: a #GListModel of #GtkSourceSnippet.
   */
  ListModel listMatching(string group, string languageId, string triggerPrefix)
  {
    GListModel* _cretval;
    const(char)* _group = group.toCString(No.Alloc);
    const(char)* _languageId = languageId.toCString(No.Alloc);
    const(char)* _triggerPrefix = triggerPrefix.toCString(No.Alloc);
    _cretval = gtk_source_snippet_manager_list_matching(cast(GtkSourceSnippetManager*)cPtr, _group, _languageId, _triggerPrefix);
    auto _retval = ObjectG.getDObject!ListModel(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }
}
