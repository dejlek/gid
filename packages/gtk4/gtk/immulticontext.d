module gtk.immulticontext;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.imcontext;
import gtk.types;

/**
 * `GtkIMMulticontext` is an input method context supporting multiple,
 * switchable input methods.
 * Text widgets such as `GtkText` or `GtkTextView` use a `GtkIMMultiContext`
 * to implement their `im-module` property for switching between different
 * input methods.
 */
class IMMulticontext : IMContext
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_im_multicontext_get_type != &gidSymbolNotFound ? gtk_im_multicontext_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkIMMulticontext`.
   * Returns: a new `GtkIMMulticontext`.
   */
  this()
  {
    GtkIMContext* _cretval;
    _cretval = gtk_im_multicontext_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the id of the currently active delegate of the context.
   * Returns: the id of the currently active delegate
   */
  string getContextId()
  {
    const(char)* _cretval;
    _cretval = gtk_im_multicontext_get_context_id(cast(GtkIMMulticontext*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Sets the context id for context.
   * This causes the currently active delegate of context to be
   * replaced by the delegate corresponding to the new context id.
   * Setting this to a non-%NULL value overrides the system-wide
   * IM module setting. See the propertyGtk.Settings:gtk-im-module
   * property.
   * Params:
   *   contextId = the id to use
   */
  void setContextId(string contextId)
  {
    const(char)* _contextId = contextId.toCString(No.Alloc);
    gtk_im_multicontext_set_context_id(cast(GtkIMMulticontext*)cPtr, _contextId);
  }
}
