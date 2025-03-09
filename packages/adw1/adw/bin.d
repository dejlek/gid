module adw.bin;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A widget with one child.
  
  <picture>
    <source srcset="bin-dark.png" media="(prefers-color-scheme: dark)">
    <img src="bin.png" alt="bin">
  </picture>
  
  The [adw.bin.Bin] widget has only one child, set with the `property@Bin:child`
  property.
  
  It is useful for deriving subclasses, since it provides common code needed
  for handling a single child widget.
*/
class Bin : gtk.widget.Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_bin_get_type != &gidSymbolNotFound ? adw_bin_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new [adw.bin.Bin].
    Returns:     the new created [adw.bin.Bin]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_bin_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the child widget of self.
    Returns:     the child widget of self
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = adw_bin_get_child(cast(AdwBin*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the child widget of self.
    Params:
      child =       the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    adw_bin_set_child(cast(AdwBin*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }
}
