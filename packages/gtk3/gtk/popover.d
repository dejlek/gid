module gtk.popover;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.rectangle;
import gid.gid;
import gio.menu_model;
import gobject.dclosure;
import gobject.object;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
 * GtkPopover is a bubble-like context window, primarily meant to
 * provide context-dependent information or options. Popovers are
 * attached to a widget, passed at construction time on [gtk.popover.Popover.new_],
 * or updated afterwards through [gtk.popover.Popover.setRelativeTo], by
 * default they will point to the whole widget area, although this
 * behavior can be changed through [gtk.popover.Popover.setPointingTo].
 * The position of a popover relative to the widget it is attached to
 * can also be changed through [gtk.popover.Popover.setPosition].
 * By default, #GtkPopover performs a GTK+ grab, in order to ensure
 * input events get redirected to it while it is shown, and also so
 * the popover is dismissed in the expected situations $(LPAREN)clicks outside
 * the popover, or the Esc key being pressed$(RPAREN). If no such modal behavior
 * is desired on a popover, [gtk.popover.Popover.setModal] may be called on it
 * to tweak its behavior.
 * ## GtkPopover as menu replacement
 * GtkPopover is often used to replace menus. To facilitate this, it
 * supports being populated from a #GMenuModel, using
 * [gtk.popover.Popover.newFromModel]. In addition to all the regular menu
 * model features, this function supports rendering sections in the
 * model in a more compact form, as a row of icon buttons instead of
 * menu items.
 * To use this rendering, set the ”display-hint” attribute of the
 * section to ”horizontal-buttons” and set the icons of your items
 * with the ”verb-icon” attribute.
 * |[
 * <section>
 * <attribute name\="display-hint">horizontal-buttons</attribute>
 * <item>
 * <attribute name\="label">Cut</attribute>
 * <attribute name\="action">app.cut</attribute>
 * <attribute name\="verb-icon">edit-cut-symbolic</attribute>
 * </item>
 * <item>
 * <attribute name\="label">Copy</attribute>
 * <attribute name\="action">app.copy</attribute>
 * <attribute name\="verb-icon">edit-copy-symbolic</attribute>
 * </item>
 * <item>
 * <attribute name\="label">Paste</attribute>
 * <attribute name\="action">app.paste</attribute>
 * <attribute name\="verb-icon">edit-paste-symbolic</attribute>
 * </item>
 * </section>
 * ]|
 * # CSS nodes
 * GtkPopover has a single css node called popover. It always gets the
 * .background style class and it gets the .menu style class if it is
 * menu-like $(LPAREN)e.g. #GtkPopoverMenu or created using [gtk.popover.Popover.newFromModel].
 * Particular uses of GtkPopover, such as touch selection popups
 * or magnifiers in #GtkEntry or #GtkTextView get style classes
 * like .touch-selection or .magnifier to differentiate from
 * plain popovers.
 */
class Popover : gtk.bin.Bin
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_popover_get_type != &gidSymbolNotFound ? gtk_popover_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new popover to point to relative_to
   * Params:
   *   relativeTo = #GtkWidget the popover is related to
   * Returns: a new #GtkPopover
   */
  this(gtk.widget.Widget relativeTo)
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_new(relativeTo ? cast(GtkWidget*)relativeTo.cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
   * Creates a #GtkPopover and populates it according to
   * model. The popover is pointed to the relative_to widget.
   * The created buttons are connected to actions found in the
   * #GtkApplicationWindow to which the popover belongs - typically
   * by means of being attached to a widget that is contained within
   * the #GtkApplicationWindows widget hierarchy.
   * Actions can also be added using [gtk.widget.Widget.insertActionGroup]
   * on the menus attach widget or on any of its parent widgets.
   * Params:
   *   relativeTo = #GtkWidget the popover is related to
   *   model = a #GMenuModel
   * Returns: the new #GtkPopover
   */
  static gtk.popover.Popover newFromModel(gtk.widget.Widget relativeTo, gio.menu_model.MenuModel model)
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_new_from_model(relativeTo ? cast(GtkWidget*)relativeTo.cPtr(No.Dup) : null, model ? cast(GMenuModel*)model.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.popover.Popover)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Establishes a binding between a #GtkPopover and a #GMenuModel.
   * The contents of popover are removed and then refilled with menu items
   * according to model.  When model changes, popover is updated.
   * Calling this function twice on popover with different model will
   * cause the first binding to be replaced with a binding to the new
   * model. If model is %NULL then any previous binding is undone and
   * all children are removed.
   * If action_namespace is non-%NULL then the effect is as if all
   * actions mentioned in the model have their names prefixed with the
   * namespace, plus a dot.  For example, if the action “quit” is
   * mentioned and action_namespace is “app” then the effective action
   * name is “app.quit”.
   * This function uses #GtkActionable to define the action name and
   * target values on the created menu items.  If you want to use an
   * action group other than “app” and “win”, or if you want to use a
   * #GtkMenuShell outside of a #GtkApplicationWindow, then you will need
   * to attach your own action group to the widget hierarchy using
   * [gtk.widget.Widget.insertActionGroup].  As an example, if you created a
   * group with a “quit” action and inserted it with the name “mygroup”
   * then you would use the action name “mygroup.quit” in your
   * #GMenuModel.
   * Params:
   *   model = the #GMenuModel to bind to or %NULL to remove
   *     binding
   *   actionNamespace = the namespace for actions in model
   */
  void bindModel(gio.menu_model.MenuModel model, string actionNamespace)
  {
    const(char)* _actionNamespace = actionNamespace.toCString(No.Alloc);
    gtk_popover_bind_model(cast(GtkPopover*)cPtr, model ? cast(GMenuModel*)model.cPtr(No.Dup) : null, _actionNamespace);
  }

  /**
   * Returns the constraint for placing this popover.
   * See [gtk.popover.Popover.setConstrainTo].
   * Returns: the constraint for placing this popover.
   */
  gtk.types.PopoverConstraint getConstrainTo()
  {
    GtkPopoverConstraint _cretval;
    _cretval = gtk_popover_get_constrain_to(cast(GtkPopover*)cPtr);
    gtk.types.PopoverConstraint _retval = cast(gtk.types.PopoverConstraint)_cretval;
    return _retval;
  }

  /**
   * Gets the widget that should be set as the default while
   * the popover is shown.
   * Returns: the default widget,
   *   or %NULL if there is none
   */
  gtk.widget.Widget getDefaultWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_get_default_widget(cast(GtkPopover*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns whether the popover is modal, see gtk_popover_set_modal to
   * see the implications of this.
   * Returns: #TRUE if popover is modal
   */
  bool getModal()
  {
    bool _retval;
    _retval = gtk_popover_get_modal(cast(GtkPopover*)cPtr);
    return _retval;
  }

  /**
   * If a rectangle to point to has been set, this function will
   * return %TRUE and fill in rect with such rectangle, otherwise
   * it will return %FALSE and fill in rect with the attached
   * widget width and height if a widget exists, otherwise it will zero-out rect.
   * Params:
   *   rect = location to store the rectangle
   * Returns: %TRUE if a rectangle to point to was set.
   */
  bool getPointingTo(out gdk.rectangle.Rectangle rect)
  {
    bool _retval;
    GdkRectangle _rect;
    _retval = gtk_popover_get_pointing_to(cast(GtkPopover*)cPtr, &_rect);
    rect = new gdk.rectangle.Rectangle(cast(void*)&_rect, No.Take);
    return _retval;
  }

  /**
   * Returns the preferred position of popover.
   * Returns: The preferred position.
   */
  gtk.types.PositionType getPosition()
  {
    GtkPositionType _cretval;
    _cretval = gtk_popover_get_position(cast(GtkPopover*)cPtr);
    gtk.types.PositionType _retval = cast(gtk.types.PositionType)_cretval;
    return _retval;
  }

  /**
   * Returns the widget popover is currently attached to
   * Returns: a #GtkWidget
   */
  gtk.widget.Widget getRelativeTo()
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_get_relative_to(cast(GtkPopover*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns whether show/hide transitions are enabled on this popover.
   * Returns: #TRUE if the show and hide transitions of the given
   *   popover are enabled, #FALSE otherwise.

   * Deprecated: You can show or hide the popover without transitions
   *   using [gtk.widget.Widget.show] and [gtk.widget.Widget.hide] while [gtk.popover.Popover.popup]
   *   and [gtk.popover.Popover.popdown] will use transitions.
   */
  bool getTransitionsEnabled()
  {
    bool _retval;
    _retval = gtk_popover_get_transitions_enabled(cast(GtkPopover*)cPtr);
    return _retval;
  }

  /**
   * Pops popover down.This is different than a [gtk.widget.Widget.hide] call
   * in that it shows the popover with a transition. If you want to hide
   * the popover without a transition, use [gtk.widget.Widget.hide].
   */
  void popdown()
  {
    gtk_popover_popdown(cast(GtkPopover*)cPtr);
  }

  /**
   * Pops popover up. This is different than a [gtk.widget.Widget.show] call
   * in that it shows the popover with a transition. If you want to show
   * the popover without a transition, use [gtk.widget.Widget.show].
   */
  void popup()
  {
    gtk_popover_popup(cast(GtkPopover*)cPtr);
  }

  /**
   * Sets a constraint for positioning this popover.
   * Note that not all platforms support placing popovers freely,
   * and may already impose constraints.
   * Params:
   *   constraint = the new constraint
   */
  void setConstrainTo(gtk.types.PopoverConstraint constraint)
  {
    gtk_popover_set_constrain_to(cast(GtkPopover*)cPtr, constraint);
  }

  /**
   * Sets the widget that should be set as default widget while
   * the popover is shown $(LPAREN)see [gtk.window.Window.setDefault]$(RPAREN). #GtkPopover
   * remembers the previous default widget and reestablishes it
   * when the popover is dismissed.
   * Params:
   *   widget = the new default widget, or %NULL
   */
  void setDefaultWidget(gtk.widget.Widget widget)
  {
    gtk_popover_set_default_widget(cast(GtkPopover*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
  }

  /**
   * Sets whether popover is modal, a modal popover will grab all input
   * within the toplevel and grab the keyboard focus on it when being
   * displayed. Clicking outside the popover area or pressing Esc will
   * dismiss the popover and ungrab input.
   * Params:
   *   modal = #TRUE to make popover claim all input within the toplevel
   */
  void setModal(bool modal)
  {
    gtk_popover_set_modal(cast(GtkPopover*)cPtr, modal);
  }

  /**
   * Sets the rectangle that popover will point to, in the
   * coordinate space of the widget popover is attached to,
   * see [gtk.popover.Popover.setRelativeTo].
   * Params:
   *   rect = rectangle to point to
   */
  void setPointingTo(gdk.rectangle.Rectangle rect)
  {
    gtk_popover_set_pointing_to(cast(GtkPopover*)cPtr, rect ? cast(const(GdkRectangle)*)rect.cPtr(No.Dup) : null);
  }

  /**
   * Sets the preferred position for popover to appear. If the popover
   * is currently visible, it will be immediately updated.
   * This preference will be respected where possible, although
   * on lack of space $(LPAREN)eg. if close to the window edges$(RPAREN), the
   * #GtkPopover may choose to appear on the opposite side
   * Params:
   *   position = preferred popover position
   */
  void setPosition(gtk.types.PositionType position)
  {
    gtk_popover_set_position(cast(GtkPopover*)cPtr, position);
  }

  /**
   * Sets a new widget to be attached to popover. If popover is
   * visible, the position will be updated.
   * Note: the ownership of popovers is always given to their relative_to
   * widget, so if relative_to is set to %NULL on an attached popover, it
   * will be detached from its previous widget, and consequently destroyed
   * unless extra references are kept.
   * Params:
   *   relativeTo = a #GtkWidget
   */
  void setRelativeTo(gtk.widget.Widget relativeTo)
  {
    gtk_popover_set_relative_to(cast(GtkPopover*)cPtr, relativeTo ? cast(GtkWidget*)relativeTo.cPtr(No.Dup) : null);
  }

  /**
   * Sets whether show/hide transitions are enabled on this popover
   * Params:
   *   transitionsEnabled = Whether transitions are enabled

   * Deprecated: You can show or hide the popover without transitions
   *   using [gtk.widget.Widget.show] and [gtk.widget.Widget.hide] while [gtk.popover.Popover.popup]
   *   and [gtk.popover.Popover.popdown] will use transitions.
   */
  void setTransitionsEnabled(bool transitionsEnabled)
  {
    gtk_popover_set_transitions_enabled(cast(GtkPopover*)cPtr, transitionsEnabled);
  }

  /**
   * This signal is emitted when the popover is dismissed either through
   * API or user interaction.
   *   popover = the instance the signal is connected to
   */
  alias ClosedCallbackDlg = void delegate(gtk.popover.Popover popover);
  alias ClosedCallbackFunc = void function(gtk.popover.Popover popover);

  /**
   * Connect to Closed signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectClosed(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ClosedCallbackDlg) || is(T : ClosedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto popover = getVal!(gtk.popover.Popover)(_paramVals);
      _dClosure.dlg(popover);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("closed", closure, after);
  }
}
