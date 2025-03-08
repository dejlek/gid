module gtk.stack_sidebar;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.stack;
import gtk.types;

/**
    A GtkStackSidebar enables you to quickly and easily provide a
  consistent "sidebar" object for your user interface.
  
  In order to use a GtkStackSidebar, you simply use a GtkStack to
  organize your UI flow, and add the sidebar to your sidebar area. You
  can use [gtk.stack_sidebar.StackSidebar.setStack] to connect the #GtkStackSidebar
  to the #GtkStack.
  
  # CSS nodes
  
  GtkStackSidebar has a single CSS node with name stacksidebar and
  style class .sidebar.
  
  When circumstances require it, GtkStackSidebar adds the
  .needs-attention style class to the widgets representing the stack
  pages.
*/
class StackSidebar : gtk.bin.Bin
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_stack_sidebar_get_type != &gidSymbolNotFound ? gtk_stack_sidebar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new sidebar.
    Returns:     the new #GtkStackSidebar
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_stack_sidebar_new();
    this(_cretval, No.Take);
  }

  /**
      Retrieves the stack.
    See [gtk.stack_sidebar.StackSidebar.setStack].
    Returns:     the associated #GtkStack or
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
      Set the #GtkStack associated with this #GtkStackSidebar.
    
    The sidebar widget will automatically update according to the order
    (packing) and items within the given #GtkStack.
    Params:
      stack =       a #GtkStack
  */
  void setStack(gtk.stack.Stack stack)
  {
    gtk_stack_sidebar_set_stack(cast(GtkStackSidebar*)cPtr, stack ? cast(GtkStack*)stack.cPtr(No.Dup) : null);
  }
}
