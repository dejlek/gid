module gtksource.map;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;
import gtksource.view;

/** */
class Map : gtksource.view.View
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_map_get_type != &gidSymbolNotFound ? gtk_source_map_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new #GtkSourceMap.
    Returns:     a new #GtkSourceMap.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_map_new();
    this(_cretval, No.take);
  }

  /**
      Gets the #GtkSourceMap:view property, which is the view this widget is mapping.
    Returns:     a #GtkSourceView or null.
  */
  gtksource.view.View getView()
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_map_get_view(cast(GtkSourceMap*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.view.View)(cast(GtkSourceView*)_cretval, No.take);
    return _retval;
  }

  /**
      Sets the view that map will be doing the mapping to.
    Params:
      view =       a #GtkSourceView
  */
  void setView(gtksource.view.View view)
  {
    gtk_source_map_set_view(cast(GtkSourceMap*)cPtr, view ? cast(GtkSourceView*)view.cPtr(No.dup) : null);
  }
}
