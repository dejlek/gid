module GtkSource.CompletionWords;

import GObject.ObjectG;
import Gid.gid;
import Gtk.TextBuffer;
import GtkSource.CompletionProvider;
import GtkSource.CompletionProviderT;
import GtkSource.Types;
import GtkSource.c.functions;
import GtkSource.c.types;

/**
 * A iface@CompletionProvider for the completion of words.
 * The `GtkSourceCompletionWords` is an example of an implementation of
 * the iface@CompletionProvider interface. The proposals are words
 * appearing in the registered [Gtk.TextBuffer]s.
 */
class CompletionWords : ObjectG, CompletionProvider
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_completion_words_get_type != &gidSymbolNotFound ? gtk_source_completion_words_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin CompletionProviderT!();

  this(string title)
  {
    GtkSourceCompletionWords* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_source_completion_words_new(_title);
    this(_cretval, Yes.Take);
  }

  /**
   * Registers buffer in the words provider.
   * Params:
   *   buffer = a #GtkTextBuffer
   */
  void register(TextBuffer buffer)
  {
    gtk_source_completion_words_register(cast(GtkSourceCompletionWords*)cPtr, buffer ? cast(GtkTextBuffer*)buffer.cPtr(No.Dup) : null);
  }

  /**
   * Unregisters buffer from the words provider.
   * Params:
   *   buffer = a #GtkTextBuffer
   */
  void unregister(TextBuffer buffer)
  {
    gtk_source_completion_words_unregister(cast(GtkSourceCompletionWords*)cPtr, buffer ? cast(GtkTextBuffer*)buffer.cPtr(No.Dup) : null);
  }
}
