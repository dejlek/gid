/// Module for [CompletionSnippets] class
module gtksource.completion_snippets;

import gid.gid;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.completion_provider;
import gtksource.completion_provider_mixin;
import gtksource.types;

/**
    A `iface@CompletionProvider` for the completion of snippets.
    
    The [gtksource.completion_snippets.CompletionSnippets] is an example of an implementation of
    the `iface@CompletionProvider` interface. The proposals are snippets
    registered with the `class@SnippetManager`.
*/
class CompletionSnippets : gobject.object.ObjectG, gtksource.completion_provider.CompletionProvider
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
    return cast(void function())gtk_source_completion_snippets_get_type != &gidSymbolNotFound ? gtk_source_completion_snippets_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override CompletionSnippets self()
  {
    return this;
  }

  mixin CompletionProviderT!();

  /** */
  this()
  {
    GtkSourceCompletionSnippets* _cretval;
    _cretval = gtk_source_completion_snippets_new();
    this(_cretval, Yes.Take);
  }
}
