module adw.view_stack_pages;

import adw.c.functions;
import adw.c.types;
import adw.types;
import adw.view_stack_page;
import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.object;
import gtk.selection_model;
import gtk.selection_model_mixin;

/**
    An auxiliary class used by `class@ViewStack`.
  
  See `property@ViewStack:pages`.
*/
class ViewStackPages : gobject.object.ObjectG, gio.list_model.ListModel, gtk.selection_model.SelectionModel
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_view_stack_pages_get_type != &gidSymbolNotFound ? adw_view_stack_pages_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin ListModelT!();
  mixin SelectionModelT!();

  /**
      Gets the `classViewStackPage` for the visible child of a view stack
    
    Gets the `classViewStackPage` for the visible child of the associated stack.
    
    Returns `NULL` if there's no selected page.
    Returns:     the stack page
  */
  adw.view_stack_page.ViewStackPage getSelectedPage()
  {
    AdwViewStackPage* _cretval;
    _cretval = adw_view_stack_pages_get_selected_page(cast(AdwViewStackPages*)cPtr);
    auto _retval = ObjectG.getDObject!(adw.view_stack_page.ViewStackPage)(cast(AdwViewStackPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the visible child in the associated `classViewStack`.
    
    See `propertyViewStack:visible-child`.
    Params:
      page =       a stack page within the associated stack
  */
  void setSelectedPage(adw.view_stack_page.ViewStackPage page)
  {
    adw_view_stack_pages_set_selected_page(cast(AdwViewStackPages*)cPtr, page ? cast(AdwViewStackPage*)page.cPtr(No.Dup) : null);
  }
}
