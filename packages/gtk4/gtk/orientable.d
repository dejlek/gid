module gtk.orientable;

public import gtk.orientable_iface_proxy;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    The [gtk.orientable.Orientable] interface is implemented by all widgets that can be
  oriented horizontally or vertically.
  
  [gtk.orientable.Orientable] is more flexible in that it allows the orientation to be
  changed at runtime, allowing the widgets to “flip”.
  
  ## CSS nodes
  
  [gtk.widget.Widget] types implementing the [gtk.orientable.Orientable] interface will
  automatically acquire the `horizontal` or `vertical` CSS class depending on
  the value of the [gtk.orientable.Orientable.Orientation] property.
*/
interface Orientable
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_orientable_get_type != &gidSymbolNotFound ? gtk_orientable_get_type() : cast(GType)0;
  }

  /**
      Retrieves the orientation of the orientable.
    Returns:     the orientation of the orientable
  */
  gtk.types.Orientation getOrientation();

  /**
      Sets the orientation of the orientable.
    Params:
      orientation =       the orientable’s new orientation
  */
  void setOrientation(gtk.types.Orientation orientation);
}
