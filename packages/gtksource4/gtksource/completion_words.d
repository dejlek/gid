/// Module for [CompletionWords] class
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
class CompletionWords : gobject.object.ObjectWrap, gtksource.completion_provider.CompletionProvider
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
    return cast(void function())gtk_source_completion_words_get_type != &gidSymbolNotFound ? gtk_source_completion_words_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CompletionWords self()
  {
    return this;
  }

  /**
      Get `activation` property.
      Returns: The type of activation.
  */
  @property gtksource.types.CompletionActivation activation()
  {
    return gobject.object.ObjectWrap.getProperty!(gtksource.types.CompletionActivation)("activation");
  }

  /**
      Set `activation` property.
      Params:
        propval = The type of activation.
  */
  @property void activation(gtksource.types.CompletionActivation propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtksource.types.CompletionActivation)("activation", propval);
  }

  /** */
  @property gdkpixbuf.pixbuf.Pixbuf icon()
  {
    return gobject.object.ObjectWrap.getProperty!(gdkpixbuf.pixbuf.Pixbuf)("icon");
  }

  /** */
  @property void icon(gdkpixbuf.pixbuf.Pixbuf propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdkpixbuf.pixbuf.Pixbuf)("icon", propval);
  }

  /** */
  @property int interactiveDelay()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("interactive-delay");
  }

  /** */
  @property void interactiveDelay(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("interactive-delay", propval);
  }

  /** */
  @property uint minimumWordSize()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("minimum-word-size");
  }

  /** */
  @property void minimumWordSize(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("minimum-word-size", propval);
  }

  /** */
  @property string name()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("name");
  }

  /** */
  @property void name(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("name", propval);
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
  @property uint proposalsBatchSize()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("proposals-batch-size");
  }

  /** */
  @property void proposalsBatchSize(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("proposals-batch-size", propval);
  }

  /** */
  @property uint scanBatchSize()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("scan-batch-size");
  }

  /** */
  @property void scanBatchSize(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("scan-batch-size", propval);
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
        buffer = a #GtkTextBuffer
  */
  void register(gtk.text_buffer.TextBuffer buffer)
  {
    gtk_source_completion_words_register(cast(GtkSourceCompletionWords*)cPtr, buffer ? cast(GtkTextBuffer*)buffer.cPtr(No.Dup) : null);
  }

  /**
      Unregisters buffer from the words provider.
  
      Params:
        buffer = a #GtkTextBuffer
  */
  void unregister(gtk.text_buffer.TextBuffer buffer)
  {
    gtk_source_completion_words_unregister(cast(GtkSourceCompletionWords*)cPtr, buffer ? cast(GtkTextBuffer*)buffer.cPtr(No.Dup) : null);
  }
}
