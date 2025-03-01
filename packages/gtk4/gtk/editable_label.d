module gtk.editable_label;

import gid.global;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.editable;
import gtk.editable_mixin;
import gtk.types;
import gtk.widget;

/**
 * A `GtkEditableLabel` is a label that allows users to
 * edit the text by switching to an “edit mode”.
 * ![An example GtkEditableLabel](editable-label.png)
 * `GtkEditableLabel` does not have API of its own, but it
 * implements the [gtk.editable.Editable] interface.
 * The default bindings for activating the edit mode is
 * to click or press the Enter key. The default bindings
 * for leaving the edit mode are the Enter key $(LPAREN)to save
 * the results$(RPAREN) or the Escape key $(LPAREN)to cancel the editing$(RPAREN).
 * # CSS nodes
 * ```
 * editablelabel[.editing]
 * ╰── stack
 * ├── label
 * ╰── text
 * ```
 * `GtkEditableLabel` has a main node with the name editablelabel.
 * When the entry is in editing mode, it gets the .editing style
 * class.
 * For all the subnodes added to the text node in various situations,
 * see [gtk.text.Text].
 */
class EditableLabel : Widget, Editable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_editable_label_get_type != &gidSymbolNotFound ? gtk_editable_label_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin EditableT!();

  /**
   * Creates a new `GtkEditableLabel` widget.
   * Params:
   *   str = the text for the label
   * Returns: the new `GtkEditableLabel`
   */
  this(string str)
  {
    GtkWidget* _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    _cretval = gtk_editable_label_new(_str);
    this(_cretval, No.Take);
  }

  /**
   * Returns whether the label is currently in “editing mode”.
   * Returns: %TRUE if self is currently in editing mode
   */
  bool getEditing()
  {
    bool _retval;
    _retval = gtk_editable_label_get_editing(cast(GtkEditableLabel*)cPtr);
    return _retval;
  }

  /**
   * Switches the label into “editing mode”.
   */
  void startEditing()
  {
    gtk_editable_label_start_editing(cast(GtkEditableLabel*)cPtr);
  }

  /**
   * Switches the label out of “editing mode”.
   * If commit is %TRUE, the resulting text is kept as the
   * [gtk.editable.Editable.utf8] property value, otherwise the
   * resulting text is discarded and the label will keep its
   * previous [gtk.editable.Editable.utf8] property value.
   * Params:
   *   commit = whether to set the edited text on the label
   */
  void stopEditing(bool commit)
  {
    gtk_editable_label_stop_editing(cast(GtkEditableLabel*)cPtr, commit);
  }
}
