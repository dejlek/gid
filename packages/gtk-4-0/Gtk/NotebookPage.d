module Gtk.NotebookPage;

import GObject.ObjectG;
import Gid.gid;
import Gtk.Types;
import Gtk.Widget;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkNotebookPage` is an auxiliary object used by `GtkNotebook`.
 */
class NotebookPage : ObjectG
{

  this()
  {
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gtk_notebook_page_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Returns the notebook child to which page belongs.
   * Returns: the child to which page belongs
   */
  Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_notebook_page_get_child(cast(GtkNotebookPage*)cPtr);
    auto _retval = ObjectG.getDObject!Widget(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }
}
