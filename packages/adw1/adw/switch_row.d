module adw.switch_row;

import adw.action_row;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;

/**
    A [gtk.list_box_row.ListBoxRow] used to represent two states.
  
  <picture>
    <source srcset="switch-row-dark.png" media="(prefers-color-scheme: dark)">
    <img src="switch-row.png" alt="switch-row">
  </picture>
  
  The [adw.switch_row.SwitchRow] widget contains a [gtk.switch_.Switch] that allows the user
  to select between two states: "on" or "off". When activated, the row will
  invert its active state.
  
  The user can control the switch by activating the row or by dragging on the
  switch handle.
  
  See [gtk.switch_.Switch] for details.
  
  Example of an [adw.switch_row.SwitchRow] UI definition:
  ```xml
  <object class="AdwSwitchRow">
    <property name="title" translatable="yes">Switch Row</property>
    <signal name="notify::active" handler="switch_row_notify_active_cb"/>
  </object>
  ```
  
  The `property@SwitchRow:active` property should be connected to in order to
  monitor changes to the active state.
  
  ## Accessibility
  
  [adw.switch_row.SwitchRow] uses the [gtk.types.AccessibleRole.Switch] role.
*/
class SwitchRow : adw.action_row.ActionRow
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_switch_row_get_type != &gidSymbolNotFound ? adw_switch_row_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override SwitchRow self()
  {
    return this;
  }

  /**
      Creates a new [adw.switch_row.SwitchRow].
    Returns:     the newly created [adw.switch_row.SwitchRow]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_switch_row_new();
    this(_cretval, No.Take);
  }

  /**
      Gets whether self is in its "on" or "off" position.
    Returns:     whether self is active or not
  */
  bool getActive()
  {
    bool _retval;
    _retval = adw_switch_row_get_active(cast(AdwSwitchRow*)cPtr);
    return _retval;
  }

  /**
      Sets whether self is in its "on" or "off" position
    Params:
      isActive =       whether self should be active
  */
  void setActive(bool isActive)
  {
    adw_switch_row_set_active(cast(AdwSwitchRow*)cPtr, isActive);
  }
}
