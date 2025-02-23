module GtkSource.IndenterT;

public import GtkSource.IndenterIfaceProxy;
public import Gdk.Types;
public import Gid.gid;
public import Gtk.TextIter;
public import GtkSource.Types;
public import GtkSource.View;
public import GtkSource.c.functions;
public import GtkSource.c.types;

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
template IndenterT()
{

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
  override bool isTrigger(View view, TextIter location, ModifierType state, uint keyval)
  {
    bool _retval;
    _retval = gtk_source_indenter_is_trigger(cast(GtkSourceIndenter*)cPtr, view ? cast(GtkSourceView*)view.cPtr(No.Dup) : null, location ? cast(GtkTextIter*)location.cPtr(No.Dup) : null, state, keyval);
    return _retval;
  }
}
