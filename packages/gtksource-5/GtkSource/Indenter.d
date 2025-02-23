module GtkSource.Indenter;

public import GtkSource.IndenterIfaceProxy;
import Gdk.Types;
import Gid.gid;
import Gtk.TextIter;
import GtkSource.Types;
import GtkSource.View;
import GtkSource.c.functions;
import GtkSource.c.types;

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
 * [Gdk.KEY_Return] or [Gdk.KEY_KP_Enter] without %GDK_SHIFT_MASK set.
 * vfunc@Indenter.indent is called after text has been
 * inserted into class@Buffer when
 * vfunc@Indenter.is_trigger returned %TRUE. The [Gtk.TextIter]
 * is placed directly after the inserted character or characters.
 * It may be beneficial to move the insertion mark using
 * [Gtk.TextBuffer.selectRange] depending on how the indenter changes
 * the indentation.
 * All changes are encapsulated within a single user action so that the
 * user may undo them using standard undo/redo accelerators.
 */
interface Indenter
{

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_indenter_get_type != &gidSymbolNotFound ? gtk_source_indenter_get_type() : cast(GType)0;
  }

  /**
   * This function is used to determine if a key pressed should cause the
   * indenter to automatically indent.
   * The default implementation of this virtual method will check to see
   * if keyval is [Gdk.KEY_Return] or [Gdk.KEY_KP_Enter] and state does
   * not have %GDK_SHIFT_MASK set. This is to allow the user to avoid
   * indentation when Shift+Return is pressed. Other indenters may want
   * to copy this behavior to provide a consistent experience to users.
   * Params:
   *   view = a #GtkSourceView
   *   location = the location where ch is to be inserted
   *   state = modifier state for the insertion
   *   keyval = the keyval pressed such as [Gdk.KEY_Return]
   * Returns: %TRUE if indentation should be automatically triggered;
   *   otherwise %FALSE and no indentation will be performed.
   */
  bool isTrigger(View view, TextIter location, ModifierType state, uint keyval);
}
