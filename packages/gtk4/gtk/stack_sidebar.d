/// Module for [StackSidebar] class
module gtk.stack_sidebar;

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
import gtk.stack;
import gtk.types;
import gtk.widget;

/**
    A [gtk.stack_sidebar.StackSidebar] uses a sidebar to switch between [gtk.stack.Stack] pages.
    
    In order to use a [gtk.stack_sidebar.StackSidebar], you simply use a [gtk.stack.Stack] to
    organize your UI flow, and add the sidebar to your sidebar area. You
    can use [gtk.stack_sidebar.StackSidebar.setStack] to connect the [gtk.stack_sidebar.StackSidebar]
    to the [gtk.stack.Stack].
    
    # CSS nodes
    
    [gtk.stack_sidebar.StackSidebar] has a single CSS node with name stacksidebar and
    style class .sidebar.
    
    When circumstances require it, [gtk.stack_sidebar.StackSidebar] adds the
    .needs-attention style class to the widgets representing the stack
    pages.
*/
class StackSidebar : gtk.widget.Widget
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
    return cast(void function())gtk_stack_sidebar_get_type != &gidSymbolNotFound ? gtk_stack_sidebar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override StackSidebar self()
  {
    return this;
  }

  /**
      Creates a new [gtk.stack_sidebar.StackSidebar].
      Returns: the new [gtk.stack_sidebar.StackSidebar]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_stack_sidebar_new();
    this(_cretval, No.Take);
  }

  /**
      Retrieves the stack.
      Returns: the associated [gtk.stack.Stack] or
          null if none has been set explicitly
  */
  gtk.stack.Stack getStack()
  {
    GtkStack* _cretval;
    _cretval = gtk_stack_sidebar_get_stack(cast(GtkStackSidebar*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.stack.Stack)(cast(GtkStack*)_cretval, No.Take);
    return _retval;
  }

  /**
      Set the [gtk.stack.Stack] associated with this [gtk.stack_sidebar.StackSidebar].
      
      The sidebar widget will automatically update according to
      the order and items within the given [gtk.stack.Stack].
  
      Params:
        stack = a [gtk.stack.Stack]
  */
  void setStack(gtk.stack.Stack stack)
  {
    gtk_stack_sidebar_set_stack(cast(GtkStackSidebar*)cPtr, stack ? cast(GtkStack*)stack.cPtr(No.Dup) : null);
  }
}
