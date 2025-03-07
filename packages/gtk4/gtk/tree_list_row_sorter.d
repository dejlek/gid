module gtk.tree_list_row_sorter;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.sorter;
import gtk.types;

/**
    [gtk.tree_list_row_sorter.TreeListRowSorter] is a special-purpose sorter that will apply a given
  sorter to the levels in a tree.
  
  Here is an example for setting up a column view with a tree model and
  a `GtkTreeListSorter`:
  
  ```c
  column_sorter = gtk_column_view_get_sorter (view);
  sorter = gtk_tree_list_row_sorter_new (g_object_ref (column_sorter));
  sort_model = gtk_sort_list_model_new (tree_model, sorter);
  selection = gtk_single_selection_new (sort_model);
  gtk_column_view_set_model (view, G_LIST_MODEL (selection));
  ```
*/
class TreeListRowSorter : gtk.sorter.Sorter
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_tree_list_row_sorter_get_type != &gidSymbolNotFound ? gtk_tree_list_row_sorter_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Create a special-purpose sorter that applies the sorting
    of sorter to the levels of a [gtk.tree_list_model.TreeListModel].
    
    Note that this sorter relies on [gtk.tree_list_model.TreeListModel.gboolean]
    being false as it can only sort [gtk.tree_list_row.TreeListRow]s.
    Params:
      sorter =       a [gtk.sorter.Sorter]
    Returns:     a new [gtk.tree_list_row_sorter.TreeListRowSorter]
  */
  this(gtk.sorter.Sorter sorter = null)
  {
    GtkTreeListRowSorter* _cretval;
    _cretval = gtk_tree_list_row_sorter_new(sorter ? cast(GtkSorter*)sorter.cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Returns the sorter used by self.
    Returns:     the sorter used
  */
  gtk.sorter.Sorter getSorter()
  {
    GtkSorter* _cretval;
    _cretval = gtk_tree_list_row_sorter_get_sorter(cast(GtkTreeListRowSorter*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.sorter.Sorter)(cast(GtkSorter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the sorter to use for items with the same parent.
    
    This sorter will be passed the [gtk.tree_list_row.TreeListRow.GObject.Object] of
    the tree list rows passed to self.
    Params:
      sorter =       The sorter to use
  */
  void setSorter(gtk.sorter.Sorter sorter = null)
  {
    gtk_tree_list_row_sorter_set_sorter(cast(GtkTreeListRowSorter*)cPtr, sorter ? cast(GtkSorter*)sorter.cPtr(No.Dup) : null);
  }
}
