module gtk.window_group;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window;

/**
 * `GtkWindowGroup` makes group of windows behave like separate applications.
 * It achieves this by limiting the effect of GTK grabs and modality
 * to windows in the same group.
 * A window can be a member in at most one window group at a time.
 * Windows that have not been explicitly assigned to a group are
 * implicitly treated like windows of the default window group.
 * `GtkWindowGroup` objects are referenced by each window in the group,
 * so once you have added all windows to a `GtkWindowGroup`, you can drop
 * the initial reference to the window group with [GObject.ObjectG.unref]. If the
 * windows in the window group are subsequently destroyed, then they will
 * be removed from the window group and drop their references on the window
 * group; when all window have been removed, the window group will be
 * freed.
 */
class WindowGroup : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_window_group_get_type != &gidSymbolNotFound ? gtk_window_group_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkWindowGroup` object.
   * Modality of windows only affects windows
   * within the same `GtkWindowGroup`.
   * Returns: a new `GtkWindowGroup`.
   */
  this()
  {
    GtkWindowGroup* _cretval;
    _cretval = gtk_window_group_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Adds a window to a `GtkWindowGroup`.
   * Params:
   *   window = the `GtkWindow` to add
   */
  void addWindow(Window window)
  {
    gtk_window_group_add_window(cast(GtkWindowGroup*)cPtr, window ? cast(GtkWindow*)window.cPtr(No.Dup) : null);
  }

  /**
   * Returns a list of the `GtkWindows` that belong to window_group.
   * Returns: A
   *   newly-allocated list of windows inside the group.
   */
  Window[] listWindows()
  {
    GList* _cretval;
    _cretval = gtk_window_group_list_windows(cast(GtkWindowGroup*)cPtr);
    auto _retval = gListToD!(Window, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
   * Removes a window from a `GtkWindowGroup`.
   * Params:
   *   window = the `GtkWindow` to remove
   */
  void removeWindow(Window window)
  {
    gtk_window_group_remove_window(cast(GtkWindowGroup*)cPtr, window ? cast(GtkWindow*)window.cPtr(No.Dup) : null);
  }
}
