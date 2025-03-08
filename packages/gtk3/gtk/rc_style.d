module gtk.rc_style;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    The #GtkRcStyle-struct is used to represent a set
  of information about the appearance of a widget.
  This can later be composited together with other
  #GtkRcStyle-struct<!-- -->s to form a #GtkStyle.
*/
class RcStyle : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_rc_style_get_type != &gidSymbolNotFound ? gtk_rc_style_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new #GtkRcStyle with no fields set and
    a reference count of 1.
    Returns:     the newly-created #GtkRcStyle
  
    Deprecated:     Use #GtkCssProvider instead.
  */
  this()
  {
    GtkRcStyle* _cretval;
    _cretval = gtk_rc_style_new();
    this(_cretval, Yes.take);
  }

  /**
      Makes a copy of the specified #GtkRcStyle. This function
    will correctly copy an RC style that is a member of a class
    derived from #GtkRcStyle.
    Returns:     the resulting #GtkRcStyle
  
    Deprecated:     Use #GtkCssProvider instead.
  */
  gtk.rc_style.RcStyle copy()
  {
    GtkRcStyle* _cretval;
    _cretval = gtk_rc_style_copy(cast(GtkRcStyle*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.rc_style.RcStyle)(cast(GtkRcStyle*)_cretval, Yes.take);
    return _retval;
  }
}
