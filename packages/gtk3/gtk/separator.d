/// Module for [Separator] class
module gtk.separator;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/**
    GtkSeparator is a horizontal or vertical separator widget, depending on the
    value of the #GtkOrientable:orientation property, used to group the widgets
    within a window. It displays a line with a shadow to make it appear sunken
    into the interface.
    
    # CSS nodes
    
    GtkSeparator has a single CSS node with name separator. The node
    gets one of the .horizontal or .vertical style classes.
*/
class Separator : gtk.widget.Widget, gtk.orientable.Orientable
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_separator_get_type != &gidSymbolNotFound ? gtk_separator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Separator self()
  {
    return this;
  }

  mixin OrientableT!();

  /**
      Creates a new #GtkSeparator with the given orientation.
  
      Params:
        orientation = the separator’s orientation.
      Returns: a new #GtkSeparator.
  */
  this(gtk.types.Orientation orientation)
  {
    GtkWidget* _cretval;
    _cretval = gtk_separator_new(orientation);
    this(_cretval, No.Take);
  }
}
