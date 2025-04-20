/// Module for [StackSwitcher] class
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
    The [gtk.stack_switcher.StackSwitcher] shows a row of buttons to switch between [gtk.stack.Stack]
    pages.
    
    ![An example GtkStackSwitcher](stackswitcher.png)
    
    It acts as a controller for the associated [gtk.stack.Stack].
    
    All the content for the buttons comes from the properties of the stacks
    [gtk.stack_page.StackPage] objects; the button visibility in a [gtk.stack_switcher.StackSwitcher]
    widget is controlled by the visibility of the child in the [gtk.stack.Stack].
    
    It is possible to associate multiple [gtk.stack_switcher.StackSwitcher] widgets
    with the same [gtk.stack.Stack] widget.
    
    # CSS nodes
    
    [gtk.stack_switcher.StackSwitcher] has a single CSS node named stackswitcher and
    style class .stack-switcher.
    
    When circumstances require it, [gtk.stack_switcher.StackSwitcher] adds the
    .needs-attention style class to the widgets representing the
    stack pages.
    
    # Accessibility
    
    [gtk.stack_switcher.StackSwitcher] uses the [gtk.types.AccessibleRole.TabList] role
    and uses the [gtk.types.AccessibleRole.Tab] for its buttons.
    
    # Orientable
    
    Since GTK 4.4, [gtk.stack_switcher.StackSwitcher] implements [gtk.orientable.Orientable] allowing
    the stack switcher to be made vertical with
    `[gtk.orientable.Orientable.setOrientation]`.
*/
class StackSwitcher : gtk.widget.Widget, gtk.orientable.Orientable
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
    return cast(void function())gtk_stack_switcher_get_type != &gidSymbolNotFound ? gtk_stack_switcher_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StackSwitcher self()
  {
    return this;
  }

  /**
      Get `stack` property.
      Returns: The stack.
  */
  @property gtk.stack.Stack stack()
  {
    return getStack();
  }

  /**
      Set `stack` property.
      Params:
        propval = The stack.
  */
  @property void stack(gtk.stack.Stack propval)
  {
    return setStack(propval);
  }

  mixin OrientableT!();

  /**
      Create a new [gtk.stack_switcher.StackSwitcher].
      Returns: a new [gtk.stack_switcher.StackSwitcher].
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_stack_switcher_new();
    this(_cretval, No.Take);
  }

  /**
      Retrieves the stack.
      Returns: the stack
  */
  gtk.stack.Stack getStack()
  {
    GtkStack* _cretval;
    _cretval = gtk_stack_switcher_get_stack(cast(GtkStackSwitcher*)cPtr);
    auto _retval = gobject.object.ObjectWrap.getDObject!(gtk.stack.Stack)(cast(GtkStack*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the stack to control.
  
      Params:
        stack = a [gtk.stack.Stack]
  */
  void setStack(gtk.stack.Stack stack = null)
  {
    gtk_stack_switcher_set_stack(cast(GtkStackSwitcher*)cPtr, stack ? cast(GtkStack*)stack.cPtr(No.Dup) : null);
  }
}
