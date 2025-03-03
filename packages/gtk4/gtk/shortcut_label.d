module gtk.shortcut_label;

import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
 * `GtkShortcutLabel` displays a single keyboard shortcut or gesture.
 * The main use case for `GtkShortcutLabel` is inside a [gtk.shortcuts_window.ShortcutsWindow].
 */
class ShortcutLabel : gtk.widget.Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_shortcut_label_get_type != &gidSymbolNotFound ? gtk_shortcut_label_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkShortcutLabel` with accelerator set.
   * Params:
   *   accelerator = the initial accelerator
   * Returns: a newly-allocated `GtkShortcutLabel`
   */
  this(string accelerator)
  {
    GtkWidget* _cretval;
    const(char)* _accelerator = accelerator.toCString(No.Alloc);
    _cretval = gtk_shortcut_label_new(_accelerator);
    this(_cretval, No.Take);
  }

  /**
   * Retrieves the current accelerator of self.
   * Returns: the current accelerator.
   */
  string getAccelerator()
  {
    const(char)* _cretval;
    _cretval = gtk_shortcut_label_get_accelerator(cast(GtkShortcutLabel*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Retrieves the text that is displayed when no accelerator is set.
   * Returns: the current text displayed when no
   *   accelerator is set.
   */
  string getDisabledText()
  {
    const(char)* _cretval;
    _cretval = gtk_shortcut_label_get_disabled_text(cast(GtkShortcutLabel*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Sets the accelerator to be displayed by self.
   * Params:
   *   accelerator = the new accelerator
   */
  void setAccelerator(string accelerator)
  {
    const(char)* _accelerator = accelerator.toCString(No.Alloc);
    gtk_shortcut_label_set_accelerator(cast(GtkShortcutLabel*)cPtr, _accelerator);
  }

  /**
   * Sets the text to be displayed by self when no accelerator is set.
   * Params:
   *   disabledText = the text to be displayed when no accelerator is set
   */
  void setDisabledText(string disabledText)
  {
    const(char)* _disabledText = disabledText.toCString(No.Alloc);
    gtk_shortcut_label_set_disabled_text(cast(GtkShortcutLabel*)cPtr, _disabledText);
  }
}
