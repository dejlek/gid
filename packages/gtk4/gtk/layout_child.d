/// Module for [LayoutChild] class
module gtk.layout_child;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_manager;
import gtk.types;
import gtk.widget;

/**
    [gtk.layout_child.LayoutChild] is the base class for objects that are meant to hold
    layout properties.
    
    If a [gtk.layout_manager.LayoutManager] has per-child properties, like their packing type,
    or the horizontal and vertical span, or the icon name, then the layout
    manager should use a [gtk.layout_child.LayoutChild] implementation to store those properties.
    
    A [gtk.layout_child.LayoutChild] instance is only ever valid while a widget is part
    of a layout.
*/
class LayoutChild : gobject.object.ObjectWrap
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
    return cast(void function())gtk_layout_child_get_type != &gidSymbolNotFound ? gtk_layout_child_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LayoutChild self()
  {
    return this;
  }

  /**
      Retrieves the [gtk.widget.Widget] associated to the given layout_child.
      Returns: a [gtk.widget.Widget]
  */
  gtk.widget.Widget getChildWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_layout_child_get_child_widget(cast(GtkLayoutChild*)cPtr);
    auto _retval = gobject.object.ObjectWrap.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the [gtk.layout_manager.LayoutManager] instance that created the
      given layout_child.
      Returns: a [gtk.layout_manager.LayoutManager]
  */
  gtk.layout_manager.LayoutManager getLayoutManager()
  {
    GtkLayoutManager* _cretval;
    _cretval = gtk_layout_child_get_layout_manager(cast(GtkLayoutChild*)cPtr);
    auto _retval = gobject.object.ObjectWrap.getDObject!(gtk.layout_manager.LayoutManager)(cast(GtkLayoutManager*)_cretval, No.Take);
    return _retval;
  }
}
