/// Module for [ClampLayout] class
module adw.clamp_layout;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gtk.layout_manager;
import gtk.orientable;
import gtk.orientable_mixin;

/**
    A layout manager constraining its children to a given size.
    
    <picture>
      <source srcset="clamp-wide-dark.png" media="(prefers-color-scheme: dark)">
      <img src="clamp-wide.png" alt="clamp-wide">
    </picture>
    <picture>
      <source srcset="clamp-narrow-dark.png" media="(prefers-color-scheme: dark)">
      <img src="clamp-narrow.png" alt="clamp-narrow">
    </picture>
    
    [adw.clamp_layout.ClampLayout] constraints the size of the widgets it contains to a given
    maximum size. It will constrain the width if it is horizontal, or the height
    if it is vertical. The expansion of the children from their minimum to their
    maximum size is eased out for a smooth transition.
    
    If a child requires more than the requested maximum size, it will be
    allocated the minimum size it can fit in instead.
    
    [adw.clamp_layout.ClampLayout] can scale with the text scale factor, use the
    `property@ClampLayout:unit` property to enable that behavior.
    
    See also: `class@Clamp`, `class@ClampScrollable`.
*/
class ClampLayout : gtk.layout_manager.LayoutManager, gtk.orientable.Orientable
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
    return cast(void function())adw_clamp_layout_get_type != &gidSymbolNotFound ? adw_clamp_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override ClampLayout self()
  {
    return this;
  }

  mixin OrientableT!();

  /**
      Creates a new [adw.clamp_layout.ClampLayout].
      Returns: the newly created [adw.clamp_layout.ClampLayout]
  */
  this()
  {
    GtkLayoutManager* _cretval;
    _cretval = adw_clamp_layout_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets the maximum size allocated to the children.
      Returns: the maximum size to allocate to the children
  */
  int getMaximumSize()
  {
    int _retval;
    _retval = adw_clamp_layout_get_maximum_size(cast(AdwClampLayout*)cPtr);
    return _retval;
  }

  /**
      Gets the size above which the children are clamped.
      Returns: the size above which the children are clamped
  */
  int getTighteningThreshold()
  {
    int _retval;
    _retval = adw_clamp_layout_get_tightening_threshold(cast(AdwClampLayout*)cPtr);
    return _retval;
  }

  /**
      Gets the length unit for maximum size and tightening threshold.
      Returns: the length unit
  */
  adw.types.LengthUnit getUnit()
  {
    AdwLengthUnit _cretval;
    _cretval = adw_clamp_layout_get_unit(cast(AdwClampLayout*)cPtr);
    adw.types.LengthUnit _retval = cast(adw.types.LengthUnit)_cretval;
    return _retval;
  }

  /**
      Sets the maximum size allocated to the children.
      
      It is the width if the layout is horizontal, or the height if it is vertical.
  
      Params:
        maximumSize = the maximum size
  */
  void setMaximumSize(int maximumSize)
  {
    adw_clamp_layout_set_maximum_size(cast(AdwClampLayout*)cPtr, maximumSize);
  }

  /**
      Sets the size above which the children are clamped.
      
      Starting from this size, the layout will tighten its grip on the children,
      slowly allocating less and less of the available size up to the maximum
      allocated size. Below that threshold and below the maximum size, the children
      will be allocated all the available size.
      
      If the threshold is greater than the maximum size to allocate to the
      children, they will be allocated the whole size up to the maximum. If the
      threshold is lower than the minimum size to allocate to the children, that
      size will be used as the tightening threshold.
      
      Effectively, tightening the grip on a child before it reaches its maximum
      size makes transitions to and from the maximum size smoother when resizing.
  
      Params:
        tighteningThreshold = the tightening threshold
  */
  void setTighteningThreshold(int tighteningThreshold)
  {
    adw_clamp_layout_set_tightening_threshold(cast(AdwClampLayout*)cPtr, tighteningThreshold);
  }

  /**
      Sets the length unit for maximum size and tightening threshold.
      
      Allows the sizes to vary depending on the text scale factor.
  
      Params:
        unit = the length unit
  */
  void setUnit(adw.types.LengthUnit unit)
  {
    adw_clamp_layout_set_unit(cast(AdwClampLayout*)cPtr, unit);
  }
}
