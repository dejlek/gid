/// Module for [Orientable] interface mixin
module gtk.orientable_mixin;

public import gtk.orientable_iface_proxy;
public import gid.gid;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    The #GtkOrientable interface is implemented by all widgets that can be
    oriented horizontally or vertically. Historically, such widgets have been
    realized as subclasses of a common base class (e.g #GtkBox/#GtkHBox/#GtkVBox
    or #GtkScale/#GtkHScale/#GtkVScale). #GtkOrientable is more flexible in that
    it allows the orientation to be changed at runtime, allowing the widgets
    to “flip”.
    
    #GtkOrientable was introduced in GTK+ 2.16.
*/
template OrientableT()
{

  /**
      Retrieves the orientation of the orientable.
      Returns: the orientation of the orientable.
  */
  override gtk.types.Orientation getOrientation()
  {
    GtkOrientation _cretval;
    _cretval = gtk_orientable_get_orientation(cast(GtkOrientable*)cPtr);
    gtk.types.Orientation _retval = cast(gtk.types.Orientation)_cretval;
    return _retval;
  }

  /**
      Sets the orientation of the orientable.
  
      Params:
        orientation = the orientable’s new orientation.
  */
  override void setOrientation(gtk.types.Orientation orientation)
  {
    gtk_orientable_set_orientation(cast(GtkOrientable*)cPtr, orientation);
  }
}
