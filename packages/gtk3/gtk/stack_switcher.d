module gtk.stack_switcher;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.stack;
import gtk.types;

/**
    The GtkStackSwitcher widget acts as a controller for a
  #GtkStack; it shows a row of buttons to switch between
  the various pages of the associated stack widget.
  
  All the content for the buttons comes from the child properties
  of the #GtkStack; the button visibility in a #GtkStackSwitcher
  widget is controlled by the visibility of the child in the
  #GtkStack.
  
  It is possible to associate multiple #GtkStackSwitcher widgets
  with the same #GtkStack widget.
  
  The GtkStackSwitcher widget was added in 3.10.
  
  # CSS nodes
  
  GtkStackSwitcher has a single CSS node named stackswitcher and
  style class .stack-switcher.
  
  When circumstances require it, GtkStackSwitcher adds the
  .needs-attention style class to the widgets representing the
  stack pages.
*/
class StackSwitcher : gtk.box.Box
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_stack_switcher_get_type != &gidSymbolNotFound ? gtk_stack_switcher_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Create a new #GtkStackSwitcher.
    Returns:     a new #GtkStackSwitcher.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_stack_switcher_new();
    this(_cretval, No.Take);
  }

  /**
      Retrieves the stack.
    See [gtk.stack_switcher.StackSwitcher.setStack].
    Returns:     the stack, or null if
         none has been set explicitly.
  */
  gtk.stack.Stack getStack()
  {
    GtkStack* _cretval;
    _cretval = gtk_stack_switcher_get_stack(cast(GtkStackSwitcher*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.stack.Stack)(cast(GtkStack*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the stack to control.
    Params:
      stack =       a #GtkStack
  */
  void setStack(gtk.stack.Stack stack = null)
  {
    gtk_stack_switcher_set_stack(cast(GtkStackSwitcher*)cPtr, stack ? cast(GtkStack*)stack.cPtr(No.Dup) : null);
  }
}
