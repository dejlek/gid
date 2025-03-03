module gtk.sort_list_model;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.section_model;
import gtk.section_model_mixin;
import gtk.sorter;
import gtk.types;

/**
 * A `GListModel` that sorts the elements of an underlying model
 * according to a `GtkSorter`.
 * The model is a stable sort. If two items compare equal according
 * to the sorter, the one that appears first in the original model will
 * also appear first after sorting.
 * Note that if you change the sorter, the previous order will have no
 * influence on the new order. If you want that, consider using a
 * `GtkMultiSorter` and appending the previous sorter to it.
 * The model can be set up to do incremental sorting, so that
 * sorting long lists doesn't block the UI. See
 * [gtk.sort_list_model.SortListModel.setIncremental] for details.
 * `GtkSortListModel` is a generic model and because of that it
 * cannot take advantage of any external knowledge when sorting.
 * If you run into performance issues with `GtkSortListModel`,
 * it is strongly recommended that you write your own sorting list
 * model.
 * `GtkSortListModel` allows sorting the items into sections. It
 * implements `GtkSectionModel` and when property@Gtk.SortListModel:section-sorter
 * is set, it will sort all items with that sorter and items comparing
 * equal with it will be put into the same section.
 * The [gtk.sort_list_model.SortListModel.Sorter] will then be used to sort items
 * inside their sections.
 */
class SortListModel : gobject.object.ObjectG, gio.list_model.ListModel, gtk.section_model.SectionModel
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_sort_list_model_get_type != &gidSymbolNotFound ? gtk_sort_list_model_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ListModelT!();
  mixin SectionModelT!();

  /**
   * Creates a new sort list model that uses the sorter to sort model.
   * Params:
   *   model = the model to sort
   *   sorter = the `GtkSorter` to sort model with,
   * Returns: a new `GtkSortListModel`
   */
  this(gio.list_model.ListModel model, gtk.sorter.Sorter sorter)
  {
    GtkSortListModel* _cretval;
    _cretval = gtk_sort_list_model_new(model ? cast(GListModel*)(cast(ObjectG)model).cPtr(Yes.Dup) : null, sorter ? cast(GtkSorter*)sorter.cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Returns whether incremental sorting is enabled.
   * See [gtk.sort_list_model.SortListModel.setIncremental].
   * Returns: %TRUE if incremental sorting is enabled
   */
  bool getIncremental()
  {
    bool _retval;
    _retval = gtk_sort_list_model_get_incremental(cast(GtkSortListModel*)cPtr);
    return _retval;
  }

  /**
   * Gets the model currently sorted or %NULL if none.
   * Returns: The model that gets sorted
   */
  gio.list_model.ListModel getModel()
  {
    GListModel* _cretval;
    _cretval = gtk_sort_list_model_get_model(cast(GtkSortListModel*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Estimates progress of an ongoing sorting operation.
   * The estimate is the number of items that would still need to be
   * sorted to finish the sorting operation if this was a linear
   * algorithm. So this number is not related to how many items are
   * already correctly sorted.
   * If you want to estimate the progress, you can use code like this:
   * ```c
   * pending \= gtk_sort_list_model_get_pending $(LPAREN)self$(RPAREN);
   * model \= gtk_sort_list_model_get_model $(LPAREN)self$(RPAREN);
   * progress \= 1.0 - pending / $(LPAREN)double$(RPAREN) MAX $(LPAREN)1, g_list_model_get_n_items $(LPAREN)model$(RPAREN)$(RPAREN);
   * ```
   * If no sort operation is ongoing - in particular when
   * [gtk.sort_list_model.SortListModel.gboolean] is %FALSE - this
   * function returns 0.
   * Returns: a progress estimate of remaining items to sort
   */
  uint getPending()
  {
    uint _retval;
    _retval = gtk_sort_list_model_get_pending(cast(GtkSortListModel*)cPtr);
    return _retval;
  }

  /**
   * Gets the section sorter that is used to sort items of self into
   * sections.
   * Returns: the sorter of #self
   */
  gtk.sorter.Sorter getSectionSorter()
  {
    GtkSorter* _cretval;
    _cretval = gtk_sort_list_model_get_section_sorter(cast(GtkSortListModel*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.sorter.Sorter)(cast(GtkSorter*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the sorter that is used to sort self.
   * Returns: the sorter of #self
   */
  gtk.sorter.Sorter getSorter()
  {
    GtkSorter* _cretval;
    _cretval = gtk_sort_list_model_get_sorter(cast(GtkSortListModel*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.sorter.Sorter)(cast(GtkSorter*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Sets the sort model to do an incremental sort.
   * When incremental sorting is enabled, the `GtkSortListModel` will not do
   * a complete sort immediately, but will instead queue an idle handler that
   * incrementally sorts the items towards their correct position. This of
   * course means that items do not instantly appear in the right place. It
   * also means that the total sorting time is a lot slower.
   * When your filter blocks the UI while sorting, you might consider
   * turning this on. Depending on your model and sorters, this may become
   * interesting around 10,000 to 100,000 items.
   * By default, incremental sorting is disabled.
   * See [gtk.sort_list_model.SortListModel.getPending] for progress information
   * about an ongoing incremental sorting operation.
   * Params:
   *   incremental = %TRUE to sort incrementally
   */
  void setIncremental(bool incremental)
  {
    gtk_sort_list_model_set_incremental(cast(GtkSortListModel*)cPtr, incremental);
  }

  /**
   * Sets the model to be sorted.
   * The model's item type must conform to the item type of self.
   * Params:
   *   model = The model to be sorted
   */
  void setModel(gio.list_model.ListModel model)
  {
    gtk_sort_list_model_set_model(cast(GtkSortListModel*)cPtr, model ? cast(GListModel*)(cast(ObjectG)model).cPtr(No.Dup) : null);
  }

  /**
   * Sets a new section sorter on self.
   * Params:
   *   sorter = the `GtkSorter` to sort model with
   */
  void setSectionSorter(gtk.sorter.Sorter sorter)
  {
    gtk_sort_list_model_set_section_sorter(cast(GtkSortListModel*)cPtr, sorter ? cast(GtkSorter*)sorter.cPtr(No.Dup) : null);
  }

  /**
   * Sets a new sorter on self.
   * Params:
   *   sorter = the `GtkSorter` to sort model with
   */
  void setSorter(gtk.sorter.Sorter sorter)
  {
    gtk_sort_list_model_set_sorter(cast(GtkSortListModel*)cPtr, sorter ? cast(GtkSorter*)sorter.cPtr(No.Dup) : null);
  }
}
