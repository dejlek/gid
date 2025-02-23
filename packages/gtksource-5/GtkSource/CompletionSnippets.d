module GtkSource.CompletionSnippets;

import GObject.ObjectG;
import Gid.gid;
import GtkSource.CompletionProvider;
import GtkSource.CompletionProviderT;
import GtkSource.Types;
import GtkSource.c.functions;
import GtkSource.c.types;

/**
 * A iface@CompletionProvider for the completion of snippets.
 * The `GtkSourceCompletionSnippets` is an example of an implementation of
 * the iface@CompletionProvider interface. The proposals are snippets
 * registered with the class@SnippetManager.
 */
class CompletionSnippets : ObjectG, CompletionProvider
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_completion_snippets_get_type != &gidSymbolNotFound ? gtk_source_completion_snippets_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin CompletionProviderT!();

  this()
  {
    GtkSourceCompletionSnippets* _cretval;
    _cretval = gtk_source_completion_snippets_new();
    this(_cretval, Yes.Take);
  }
}
