/// Module for [MultiFilter] class
module gtk.multi_filter;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.object;
import gobject.types;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.filter;
import gtk.types;

/**
    [gtk.multi_filter.MultiFilter] is the base class for filters that combine multiple filters.
*/
class MultiFilter : gtk.filter.Filter, gio.list_model.ListModel, gtk.buildable.Buildable
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_multi_filter_get_type != &gidSymbolNotFound ? gtk_multi_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MultiFilter self()
  {
    return this;
  }

  /**
      Get `itemType` property.
      Returns: The type of items. See [gio.list_model.ListModel.getItemType].
  */
  @property gobject.types.GType itemType()
  {
    return gobject.object.ObjectWrap.getProperty!(gobject.types.GType)("item-type");
  }

  /**
      Get `nItems` property.
      Returns: The number of items. See [gio.list_model.ListModel.getNItems].
  */
  @property uint nItems()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("n-items");
  }

  mixin ListModelT!();
  mixin BuildableT!();

  /**
      Adds a filter to self to use for matching.
  
      Params:
        filter = A new filter to use
  */
  void append(gtk.filter.Filter filter)
  {
    gtk_multi_filter_append(cast(GtkMultiFilter*)cPtr, filter ? cast(GtkFilter*)filter.cPtr(Yes.Dup) : null);
  }

  /**
      Removes the filter at the given position from the list of filters used
      by self.
      
      If position is larger than the number of filters, nothing happens and
      the function returns.
  
      Params:
        position = position of filter to remove
  */
  void remove(uint position)
  {
    gtk_multi_filter_remove(cast(GtkMultiFilter*)cPtr, position);
  }
}
