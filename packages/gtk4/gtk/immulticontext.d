/// Module for [IMMulticontext] class
module gtk.immulticontext;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.imcontext;
import gtk.types;

/**
    [gtk.immulticontext.IMMulticontext] is an input method context supporting multiple,
    switchable input methods.
    
    Text widgets such as [gtk.text.Text] or [gtk.text_view.TextView] use a `GtkIMMultiContext`
    to implement their `im-module` property for switching between different
    input methods.
*/
class IMMulticontext : gtk.imcontext.IMContext
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
    return cast(void function())gtk_im_multicontext_get_type != &gidSymbolNotFound ? gtk_im_multicontext_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override IMMulticontext self()
  {
    return this;
  }

  /**
      Creates a new [gtk.immulticontext.IMMulticontext].
      Returns: a new [gtk.immulticontext.IMMulticontext].
  */
  this()
  {
    GtkIMContext* _cretval;
    _cretval = gtk_im_multicontext_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets the id of the currently active delegate of the context.
      Returns: the id of the currently active delegate
  */
  string getContextId()
  {
    const(char)* _cretval;
    _cretval = gtk_im_multicontext_get_context_id(cast(GtkIMMulticontext*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets the context id for context.
      
      This causes the currently active delegate of context to be
      replaced by the delegate corresponding to the new context id.
      
      Setting this to a non-null value overrides the system-wide
      IM module setting. See the `propertyGtk.Settings:gtk-im-module`
      property.
  
      Params:
        contextId = the id to use
  */
  void setContextId(string contextId = null)
  {
    const(char)* _contextId = contextId.toCString(No.Alloc);
    gtk_im_multicontext_set_context_id(cast(GtkIMMulticontext*)cPtr, _contextId);
  }
}
