module gtksource.indenter;

public import gtksource.indenter_iface_proxy;
import gdk.types;
import gid.global;
import gtk.text_iter;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;
import gtksource.view;

/**
 * Auto-indentation interface.
 * By default, class@View can auto-indent as you type when
 * property@View:auto-indent is enabled. The indentation simply copies the
 * previous lines indentation.
 * This can be changed by implementing `GtkSourceIndenter` and setting the
 * property@View:indenter property.
 * Implementors of this interface should implement both
 * vfunc@Indenter.is_trigger and vfunc@Indenter.indent.
 * vfunc@Indenter.is_trigger is called upon key-press to
 * determine of the key press should trigger an indentation.  The default
 * implementation of the interface checks to see if the key was
 * [gdk.int] or [gdk.int] without %GDK_SHIFT_MASK set.
 * vfunc@Indenter.indent is called after text has been
 * inserted into class@Buffer when
 * vfunc@Indenter.is_trigger returned %TRUE. The [gtk.text_iter.TextIter]
 * is placed directly after the inserted character or characters.
 * It may be beneficial to move the insertion mark using
 * [gtk.text_buffer.TextBuffer.selectRange] depending on how the indenter changes
 * the indentation.
 * All changes are encapsulated within a single user action so that the
 * user may undo them using standard undo/redo accelerators.
 */
interface Indenter
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_indenter_get_type != &gidSymbolNotFound ? gtk_source_indenter_get_type() : cast(GType)0;
  }

  /**
   * This function should be implemented to alter the indentation of text
   * within the view.
   * view is provided so that the indenter may retrieve settings such as indentation and tab widths.
   * iter is the location where the indentation was requested. This typically
   * is after having just inserted a newline $(LPAREN)\n$(RPAREN) character but can be other
   * situations such as a manually requested indentation or reformatting.
   * See ifaceIndenter.is_trigger for how to trigger indentation on
   * various characters inserted into the buffer.
   * The implementor of this function is expected to keep iter valid across
   * calls to the function and should contain the location of the insert mark
   * after calling this function.
   * The default implementation for this virtual function will copy the
   * indentation of the previous line.
   * Params:
   *   view = a #GtkSourceView
   *   iter = the location of the indentation request
   */
  void indent(View view, TextIter iter);

  /**
   * This function is used to determine if a key pressed should cause the
   * indenter to automatically indent.
   * The default implementation of this virtual method will check to see
   * if keyval is [gdk.int] or [gdk.int] and state does
   * not have %GDK_SHIFT_MASK set. This is to allow the user to avoid
   * indentation when Shift+Return is pressed. Other indenters may want
   * to copy this behavior to provide a consistent experience to users.
   * Params:
   *   view = a #GtkSourceView
   *   location = the location where ch is to be inserted
   *   state = modifier state for the insertion
   *   keyval = the keyval pressed such as [gdk.int]
   * Returns: %TRUE if indentation should be automatically triggered;
   *   otherwise %FALSE and no indentation will be performed.
   */
  bool isTrigger(View view, TextIter location, ModifierType state, uint keyval);
}
