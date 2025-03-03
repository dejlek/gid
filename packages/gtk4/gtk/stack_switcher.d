module gtk.stack_switcher;

import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.stack;
import gtk.types;
import gtk.widget;

/**
 * The `GtkStackSwitcher` shows a row of buttons to switch between `GtkStack`
 * pages.
 * ![An example GtkStackSwitcher](stackswitcher.png)
 * It acts as a controller for the associated `GtkStack`.
 * All the content for the buttons comes from the properties of the stacks
 * [gtk.stack_page.StackPage] objects; the button visibility in a `GtkStackSwitcher`
 * widget is controlled by the visibility of the child in the `GtkStack`.
 * It is possible to associate multiple `GtkStackSwitcher` widgets
 * with the same `GtkStack` widget.
 * # CSS nodes
 * `GtkStackSwitcher` has a single CSS node named stackswitcher and
 * style class .stack-switcher.
 * When circumstances require it, `GtkStackSwitcher` adds the
 * .needs-attention style class to the widgets representing the
 * stack pages.
 * # Accessibility
 * `GtkStackSwitcher` uses the %GTK_ACCESSIBLE_ROLE_TAB_LIST role
 * and uses the %GTK_ACCESSIBLE_ROLE_TAB for its buttons.
 * # Orientable
 * Since GTK 4.4, `GtkStackSwitcher` implements `GtkOrientable` allowing
 * the stack switcher to be made vertical with
 * `[gtk.orientable.Orientable.setOrientation]`.
 */
class StackSwitcher : gtk.widget.Widget, gtk.orientable.Orientable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_stack_switcher_get_type != &gidSymbolNotFound ? gtk_stack_switcher_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin OrientableT!();

  /**
   * Create a new `GtkStackSwitcher`.
   * Returns: a new `GtkStackSwitcher`.
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_stack_switcher_new();
    this(_cretval, No.Take);
  }

  /**
   * Retrieves the stack.
   * Returns: the stack
   */
  gtk.stack.Stack getStack()
  {
    GtkStack* _cretval;
    _cretval = gtk_stack_switcher_get_stack(cast(GtkStackSwitcher*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.stack.Stack)(cast(GtkStack*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Sets the stack to control.
   * Params:
   *   stack = a `GtkStack`
   */
  void setStack(gtk.stack.Stack stack)
  {
    gtk_stack_switcher_set_stack(cast(GtkStackSwitcher*)cPtr, stack ? cast(GtkStack*)stack.cPtr(No.Dup) : null);
  }
}
