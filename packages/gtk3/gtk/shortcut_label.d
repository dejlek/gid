module gtk.shortcut_label;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;

/**
    #GtkShortcutLabel is a widget that represents a single keyboard shortcut or gesture
  in the user interface.
*/
class ShortcutLabel : gtk.box.Box
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_shortcut_label_get_type != &gidSymbolNotFound ? gtk_shortcut_label_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new #GtkShortcutLabel with accelerator set.
    Params:
      accelerator =       the initial accelerator
    Returns:     a newly-allocated #GtkShortcutLabel
  */
  this(string accelerator)
  {
    GtkWidget* _cretval;
    const(char)* _accelerator = accelerator.toCString(No.alloc);
    _cretval = gtk_shortcut_label_new(_accelerator);
    this(_cretval, Yes.take);
  }

  /**
      Retrieves the current accelerator of self.
    Returns:     the current accelerator.
  */
  string getAccelerator()
  {
    const(char)* _cretval;
    _cretval = gtk_shortcut_label_get_accelerator(cast(GtkShortcutLabel*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Retrieves the text that is displayed when no accelerator is set.
    Returns:     the current text displayed when no
      accelerator is set.
  */
  string getDisabledText()
  {
    const(char)* _cretval;
    _cretval = gtk_shortcut_label_get_disabled_text(cast(GtkShortcutLabel*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Sets the accelerator to be displayed by self.
    Params:
      accelerator =       the new accelerator
  */
  void setAccelerator(string accelerator)
  {
    const(char)* _accelerator = accelerator.toCString(No.alloc);
    gtk_shortcut_label_set_accelerator(cast(GtkShortcutLabel*)cPtr, _accelerator);
  }

  /**
      Sets the text to be displayed by self when no accelerator is set.
    Params:
      disabledText =       the text to be displayed when no accelerator is set
  */
  void setDisabledText(string disabledText)
  {
    const(char)* _disabledText = disabledText.toCString(No.alloc);
    gtk_shortcut_label_set_disabled_text(cast(GtkShortcutLabel*)cPtr, _disabledText);
  }
}
