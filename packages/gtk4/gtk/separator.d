/// Module for [Separator] class
module gtk.separator;

import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.separator.Separator] is a horizontal or vertical separator widget.
    
    ![An example GtkSeparator](separator.png)
    
    A [gtk.separator.Separator] can be used to group the widgets within a window.
    It displays a line with a shadow to make it appear sunken into the
    interface.
    
    # CSS nodes
    
    [gtk.separator.Separator] has a single CSS node with name separator. The node
    gets one of the .horizontal or .vertical style classes.
    
    # Accessibility
    
    [gtk.separator.Separator] uses the [gtk.types.AccessibleRole.Separator] role.
*/
class Separator : gtk.widget.Widget, gtk.orientable.Orientable
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
    return cast(void function())gtk_separator_get_type != &gidSymbolNotFound ? gtk_separator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Separator self()
  {
    return this;
  }

  mixin OrientableT!();

  /**
      Creates a new [gtk.separator.Separator] with the given orientation.
  
      Params:
        orientation = the separator’s orientation.
      Returns: a new [gtk.separator.Separator].
  */
  this(gtk.types.Orientation orientation)
  {
    GtkWidget* _cretval;
    _cretval = gtk_separator_new(orientation);
    this(_cretval, No.Take);
  }
}
