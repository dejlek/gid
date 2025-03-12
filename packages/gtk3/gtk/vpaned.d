module gtk.vpaned;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.paned;
import gtk.types;

/**
    The VPaned widget is a container widget with two
  children arranged vertically. The division between
  the two panes is adjustable by the user by dragging
  a handle. See #GtkPaned for details.
  
  GtkVPaned has been deprecated, use #GtkPaned instead.
*/
class VPaned : gtk.paned.Paned
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_vpaned_get_type != &gidSymbolNotFound ? gtk_vpaned_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override VPaned self()
  {
    return this;
  }

  /**
      Create a new #GtkVPaned
    Returns:     the new #GtkVPaned
  
    Deprecated:     Use [gtk.paned.Paned.new_] with [gtk.types.Orientation.Vertical] instead
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_vpaned_new();
    this(_cretval, No.Take);
  }
}
