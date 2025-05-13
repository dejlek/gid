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
class CompletionSnippets : gobject.object.ObjectWrap, gtksource.completion_provider.CompletionProvider
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_completion_snippets_get_type != &gidSymbolNotFound ? gtk_source_completion_snippets_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CompletionSnippets self()
  {
    return this;
  }

  /** */
  @property int priority()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("priority");
  }

  /** */
  @property void priority(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("priority", propval);
  }

  /** */
  @property string title()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("title");
  }

  /** */
  @property void title(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("title", propval);
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
