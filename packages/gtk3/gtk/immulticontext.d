module gtk.immulticontext;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.imcontext;
import gtk.menu_shell;
import gtk.types;

/** */
class IMMulticontext : gtk.imcontext.IMContext
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_im_multicontext_get_type != &gidSymbolNotFound ? gtk_im_multicontext_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new #GtkIMMulticontext.
    Returns:     a new #GtkIMMulticontext.
  */
  this()
  {
    GtkIMContext* _cretval;
    _cretval = gtk_im_multicontext_new();
    this(_cretval, Yes.take);
  }

  /**
      Add menuitems for various available input methods to a menu;
    the menuitems, when selected, will switch the input method
    for the context and the global default input method.
    Params:
      menushell =       a #GtkMenuShell
  
    Deprecated:     It is better to use the system-wide input
          method framework for changing input methods. Modern
          desktop shells offer on-screen displays for this that
          can triggered with a keyboard shortcut, e.g. Super-Space.
  */
  void appendMenuitems(gtk.menu_shell.MenuShell menushell)
  {
    gtk_im_multicontext_append_menuitems(cast(GtkIMMulticontext*)cPtr, menushell ? cast(GtkMenuShell*)menushell.cPtr(No.dup) : null);
  }

  /**
      Gets the id of the currently active slave of the context.
    Returns:     the id of the currently active slave
  */
  string getContextId()
  {
    const(char)* _cretval;
    _cretval = gtk_im_multicontext_get_context_id(cast(GtkIMMulticontext*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Sets the context id for context.
    
    This causes the currently active slave of context to be
    replaced by the slave corresponding to the new context id.
    Params:
      contextId =       the id to use
  */
  void setContextId(string contextId)
  {
    const(char)* _contextId = contextId.toCString(No.alloc);
    gtk_im_multicontext_set_context_id(cast(GtkIMMulticontext*)cPtr, _contextId);
  }
}
