module adw.clamp_scrollable;

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
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtk.widget;

/**
    A scrollable `class@Clamp`.
  
  [adw.clamp_scrollable.ClampScrollable] is a variant of `class@Clamp` that implements the
  [gtk.scrollable.Scrollable] interface.
  
  The primary use case for [adw.clamp_scrollable.ClampScrollable] is clamping
  [gtk.list_view.ListView].
  
  See also: `class@ClampLayout`.
*/
class ClampScrollable : gtk.widget.Widget, gtk.orientable.Orientable, gtk.scrollable.Scrollable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_clamp_scrollable_get_type != &gidSymbolNotFound ? adw_clamp_scrollable_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override ClampScrollable self()
  {
    return this;
  }

  mixin OrientableT!();
  mixin ScrollableT!();

  /**
      Creates a new [adw.clamp_scrollable.ClampScrollable].
    Returns:     the newly created [adw.clamp_scrollable.ClampScrollable]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_clamp_scrollable_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the child widget of self.
    Returns:     the child widget of self
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = adw_clamp_scrollable_get_child(cast(AdwClampScrollable*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the maximum size allocated to the child.
    Returns:     the maximum size to allocate to the child
  */
  int getMaximumSize()
  {
    int _retval;
    _retval = adw_clamp_scrollable_get_maximum_size(cast(AdwClampScrollable*)cPtr);
    return _retval;
  }

  /**
      Gets the size above which the child is clamped.
    Returns:     the size above which the child is clamped
  */
  int getTighteningThreshold()
  {
    int _retval;
    _retval = adw_clamp_scrollable_get_tightening_threshold(cast(AdwClampScrollable*)cPtr);
    return _retval;
  }

  /**
      Gets the length unit for maximum size and tightening threshold.
    Returns:     the length unit
  */
  adw.types.LengthUnit getUnit()
  {
    AdwLengthUnit _cretval;
    _cretval = adw_clamp_scrollable_get_unit(cast(AdwClampScrollable*)cPtr);
    adw.types.LengthUnit _retval = cast(adw.types.LengthUnit)_cretval;
    return _retval;
  }

  /**
      Sets the child widget of self.
    Params:
      child =       the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    adw_clamp_scrollable_set_child(cast(AdwClampScrollable*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
      Sets the maximum size allocated to the child.
    
    It is the width if the clamp is horizontal, or the height if it is vertical.
    Params:
      maximumSize =       the maximum size
  */
  void setMaximumSize(int maximumSize)
  {
    adw_clamp_scrollable_set_maximum_size(cast(AdwClampScrollable*)cPtr, maximumSize);
  }

  /**
      Sets the size above which the child is clamped.
    
    Starting from this size, the clamp will tighten its grip on the child, slowly
    allocating less and less of the available size up to the maximum allocated
    size. Below that threshold and below the maximum width, the child will be
    allocated all the available size.
    
    If the threshold is greater than the maximum size to allocate to the child,
    the child will be allocated all the width up to the maximum. If the threshold
    is lower than the minimum size to allocate to the child, that size will be
    used as the tightening threshold.
    
    Effectively, tightening the grip on the child before it reaches its maximum
    size makes transitions to and from the maximum size smoother when resizing.
    Params:
      tighteningThreshold =       the tightening threshold
  */
  void setTighteningThreshold(int tighteningThreshold)
  {
    adw_clamp_scrollable_set_tightening_threshold(cast(AdwClampScrollable*)cPtr, tighteningThreshold);
  }

  /**
      Sets the length unit for maximum size and tightening threshold.
    
    Allows the sizes to vary depending on the text scale factor.
    Params:
      unit =       the length unit
  */
  void setUnit(adw.types.LengthUnit unit)
  {
    adw_clamp_scrollable_set_unit(cast(AdwClampScrollable*)cPtr, unit);
  }
}
