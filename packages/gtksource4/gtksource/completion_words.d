module gtksource.completion_words;

import gdkpixbuf.pixbuf;
import gid.gid;
import gobject.object;
import gtk.text_buffer;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.completion_provider;
import gtksource.completion_provider_mixin;
import gtksource.types;

/** */
class CompletionWords : gobject.object.ObjectG, gtksource.completion_provider.CompletionProvider
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_completion_words_get_type != &gidSymbolNotFound ? gtk_source_completion_words_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin CompletionProviderT!();

  /** */
  this(string name = null, gdkpixbuf.pixbuf.Pixbuf icon = null)
  {
    GtkSourceCompletionWords* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_source_completion_words_new(_name, icon ? cast(PixbufC*)icon.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Registers buffer in the words provider.
    Params:
      buffer =       a #GtkTextBuffer
  */
  void register(gtk.text_buffer.TextBuffer buffer)
  {
    gtk_source_completion_words_register(cast(GtkSourceCompletionWords*)cPtr, buffer ? cast(GtkTextBuffer*)buffer.cPtr(No.Dup) : null);
  }

  /**
      Unregisters buffer from the words provider.
    Params:
      buffer =       a #GtkTextBuffer
  */
  void unregister(gtk.text_buffer.TextBuffer buffer)
  {
    gtk_source_completion_words_unregister(cast(GtkSourceCompletionWords*)cPtr, buffer ? cast(GtkTextBuffer*)buffer.cPtr(No.Dup) : null);
  }
}
