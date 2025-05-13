/// Module for [CompletionWords] class
module gtksource.completion_words;

import gid.gid;
import gobject.object;
import gtk.text_buffer;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.completion_provider;
import gtksource.completion_provider_mixin;
import gtksource.types;

/**
    A `iface@CompletionProvider` for the completion of words.
    
    The [gtksource.completion_words.CompletionWords] is an example of an implementation of
    the `iface@CompletionProvider` interface. The proposals are words
    appearing in the registered [gtk.text_buffer.TextBuffer]s.
*/
class CompletionWords : gobject.object.ObjectWrap, gtksource.completion_provider.CompletionProvider
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
    return cast(void function())gtk_source_completion_words_get_type != &gidSymbolNotFound ? gtk_source_completion_words_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CompletionWords self()
  {
    return this;
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
  this(string title = null)
  {
    GtkSourceCompletionWords* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_source_completion_words_new(_title);
    this(_cretval, Yes.Take);
  }

  /**
      Registers buffer in the words provider.
  
      Params:
        buffer = a #GtkTextBuffer
  */
  void register(gtk.text_buffer.TextBuffer buffer)
  {
    gtk_source_completion_words_register(cast(GtkSourceCompletionWords*)this._cPtr, buffer ? cast(GtkTextBuffer*)buffer._cPtr(No.Dup) : null);
  }

  /**
      Unregisters buffer from the words provider.
  
      Params:
        buffer = a #GtkTextBuffer
  */
  void unregister(gtk.text_buffer.TextBuffer buffer)
  {
    gtk_source_completion_words_unregister(cast(GtkSourceCompletionWords*)this._cPtr, buffer ? cast(GtkTextBuffer*)buffer._cPtr(No.Dup) : null);
  }
}
