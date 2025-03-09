module adw.squeezer;

import adw.c.functions;
import adw.c.types;
import adw.squeezer_page;
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
import gtk.selection_model;
import gtk.widget;

/**
    A best fit container.
  
  <picture>
    <source srcset="squeezer-wide-dark.png" media="(prefers-color-scheme: dark)">
    <img src="squeezer-wide.png" alt="squeezer-wide">
  </picture>
  <picture>
    <source srcset="squeezer-narrow-dark.png" media="(prefers-color-scheme: dark)">
    <img src="squeezer-narrow.png" alt="squeezer-narrow">
  </picture>
  
  The [adw.squeezer.Squeezer] widget is a container which only shows the first of its
  children that fits in the available size. It is convenient to offer different
  widgets to represent the same data with different levels of detail, making
  the widget seem to squeeze itself to fit in the available space.
  
  Transitions between children can be animated as fades. This can be controlled
  with `property@Squeezer:transition-type`.
  
  ## CSS nodes
  
  [adw.squeezer.Squeezer] has a single CSS node with name `squeezer`.

  Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
*/
class Squeezer : gtk.widget.Widget, gtk.orientable.Orientable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_squeezer_get_type != &gidSymbolNotFound ? adw_squeezer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin OrientableT!();

  /**
      Creates a new [adw.squeezer.Squeezer].
    Returns:     the newly created [adw.squeezer.Squeezer]
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_squeezer_new();
    this(_cretval, No.Take);
  }

  /**
      Adds a child to self.
    Params:
      child =       the widget to add
    Returns:     the `classSqueezerPage` for child
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  adw.squeezer_page.SqueezerPage add(gtk.widget.Widget child)
  {
    AdwSqueezerPage* _cretval;
    _cretval = adw_squeezer_add(cast(AdwSqueezer*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(adw.squeezer_page.SqueezerPage)(cast(AdwSqueezerPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether to allow squeezing beyond the last child's minimum size.
    Returns:     whether self allows squeezing beyond the last child
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  bool getAllowNone()
  {
    bool _retval;
    _retval = adw_squeezer_get_allow_none(cast(AdwSqueezer*)cPtr);
    return _retval;
  }

  /**
      Gets whether all children have the same size for the opposite orientation.
    Returns:     whether self is homogeneous
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  bool getHomogeneous()
  {
    bool _retval;
    _retval = adw_squeezer_get_homogeneous(cast(AdwSqueezer*)cPtr);
    return _retval;
  }

  /**
      Gets whether self interpolates its size when changing the visible child.
    Returns:     whether the size is interpolated
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  bool getInterpolateSize()
  {
    bool _retval;
    _retval = adw_squeezer_get_interpolate_size(cast(AdwSqueezer*)cPtr);
    return _retval;
  }

  /**
      Returns the `classSqueezerPage` object for child.
    Params:
      child =       a child of self
    Returns:     the page object for child
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  adw.squeezer_page.SqueezerPage getPage(gtk.widget.Widget child)
  {
    AdwSqueezerPage* _cretval;
    _cretval = adw_squeezer_get_page(cast(AdwSqueezer*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(adw.squeezer_page.SqueezerPage)(cast(AdwSqueezerPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a [gio.list_model.ListModel] that contains the pages of self.
    
    This can be used to keep an up-to-date view. The model also implements
    [gtk.selection_model.SelectionModel] and can be used to track the visible page.
    Returns:     a [gtk.selection_model.SelectionModel] for the squeezer's children
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  gtk.selection_model.SelectionModel getPages()
  {
    GtkSelectionModel* _cretval;
    _cretval = adw_squeezer_get_pages(cast(AdwSqueezer*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.selection_model.SelectionModel)(cast(GtkSelectionModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the switch threshold policy for self.
    Returns:     the fold threshold policy
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  adw.types.FoldThresholdPolicy getSwitchThresholdPolicy()
  {
    AdwFoldThresholdPolicy _cretval;
    _cretval = adw_squeezer_get_switch_threshold_policy(cast(AdwSqueezer*)cPtr);
    adw.types.FoldThresholdPolicy _retval = cast(adw.types.FoldThresholdPolicy)_cretval;
    return _retval;
  }

  /**
      Gets the transition animation duration for self.
    Returns:     the transition duration, in milliseconds
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  uint getTransitionDuration()
  {
    uint _retval;
    _retval = adw_squeezer_get_transition_duration(cast(AdwSqueezer*)cPtr);
    return _retval;
  }

  /**
      Gets whether a transition is currently running for self.
    
    If a transition is impossible, the property value will be set to `TRUE` and
    then immediately to `FALSE`, so it's possible to rely on its notifications
    to know that a transition has happened.
    Returns:     whether a transition is currently running
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  bool getTransitionRunning()
  {
    bool _retval;
    _retval = adw_squeezer_get_transition_running(cast(AdwSqueezer*)cPtr);
    return _retval;
  }

  /**
      Gets the type of animation used for transitions between children in self.
    Returns:     the current transition type of self
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  adw.types.SqueezerTransitionType getTransitionType()
  {
    AdwSqueezerTransitionType _cretval;
    _cretval = adw_squeezer_get_transition_type(cast(AdwSqueezer*)cPtr);
    adw.types.SqueezerTransitionType _retval = cast(adw.types.SqueezerTransitionType)_cretval;
    return _retval;
  }

  /**
      Gets the currently visible child of self.
    Returns:     the visible child
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  gtk.widget.Widget getVisibleChild()
  {
    GtkWidget* _cretval;
    _cretval = adw_squeezer_get_visible_child(cast(AdwSqueezer*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the horizontal alignment, from 0 (start) to 1 (end).
    Returns:     the alignment value
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  float getXalign()
  {
    float _retval;
    _retval = adw_squeezer_get_xalign(cast(AdwSqueezer*)cPtr);
    return _retval;
  }

  /**
      Gets the vertical alignment, from 0 (top) to 1 (bottom).
    Returns:     the alignment value
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  float getYalign()
  {
    float _retval;
    _retval = adw_squeezer_get_yalign(cast(AdwSqueezer*)cPtr);
    return _retval;
  }

  /**
      Removes a child widget from self.
    Params:
      child =       the child to remove
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  void remove(gtk.widget.Widget child)
  {
    adw_squeezer_remove(cast(AdwSqueezer*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
      Sets whether to allow squeezing beyond the last child's minimum size.
    
    If set to `TRUE`, the squeezer can shrink to the point where no child can be
    shown. This is functionally equivalent to appending a widget with 0×0 minimum
    size.
    Params:
      allowNone =       whether self allows squeezing beyond the last child
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  void setAllowNone(bool allowNone)
  {
    adw_squeezer_set_allow_none(cast(AdwSqueezer*)cPtr, allowNone);
  }

  /**
      Sets whether all children have the same size for the opposite orientation.
    
    For example, if a squeezer is horizontal and is homogeneous, it will request
    the same height for all its children. If it isn't, the squeezer may change
    size when a different child becomes visible.
    Params:
      homogeneous =       whether self is homogeneous
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  void setHomogeneous(bool homogeneous)
  {
    adw_squeezer_set_homogeneous(cast(AdwSqueezer*)cPtr, homogeneous);
  }

  /**
      Sets whether self interpolates its size when changing the visible child.
    
    If `TRUE`, the squeezer will interpolate its size between the one of the
    previous visible child and the one of the new visible child, according to the
    set transition duration and the orientation, e.g. if the squeezer is
    horizontal, it will interpolate the its height.
    Params:
      interpolateSize =       whether to interpolate the size
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  void setInterpolateSize(bool interpolateSize)
  {
    adw_squeezer_set_interpolate_size(cast(AdwSqueezer*)cPtr, interpolateSize);
  }

  /**
      Sets the switch threshold policy for self.
    
    Determines when the squeezer will switch children.
    
    If set to [adw.types.FoldThresholdPolicy.Minimum], it will only switch when the
    visible child cannot fit anymore. With [adw.types.FoldThresholdPolicy.Natural],
    it will switch as soon as the visible child doesn't get their natural size.
    
    This can be useful if you have a long ellipsizing label and want to let it
    ellipsize instead of immediately switching.
    Params:
      policy =       the policy to use
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  void setSwitchThresholdPolicy(adw.types.FoldThresholdPolicy policy)
  {
    adw_squeezer_set_switch_threshold_policy(cast(AdwSqueezer*)cPtr, policy);
  }

  /**
      Sets the transition animation duration for self.
    Params:
      duration =       the new duration, in milliseconds
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  void setTransitionDuration(uint duration)
  {
    adw_squeezer_set_transition_duration(cast(AdwSqueezer*)cPtr, duration);
  }

  /**
      Sets the type of animation used for transitions between children in self.
    Params:
      transition =       the new transition type
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  void setTransitionType(adw.types.SqueezerTransitionType transition)
  {
    adw_squeezer_set_transition_type(cast(AdwSqueezer*)cPtr, transition);
  }

  /**
      Sets the horizontal alignment, from 0 (start) to 1 (end).
    
    This affects the children allocation during transitions, when they exceed the
    size of the squeezer.
    
    For example, 0.5 means the child will be centered, 0 means it will keep the
    start side aligned and overflow the end side, and 1 means the opposite.
    Params:
      xalign =       the new alignment value
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  void setXalign(float xalign)
  {
    adw_squeezer_set_xalign(cast(AdwSqueezer*)cPtr, xalign);
  }

  /**
      Sets the vertical alignment, from 0 (top) to 1 (bottom).
    
    This affects the children allocation during transitions, when they exceed the
    size of the squeezer.
    
    For example, 0.5 means the child will be centered, 0 means it will keep the
    top side aligned and overflow the bottom side, and 1 means the opposite.
    Params:
      yalign =       the new alignment value
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  void setYalign(float yalign)
  {
    adw_squeezer_set_yalign(cast(AdwSqueezer*)cPtr, yalign);
  }
}
