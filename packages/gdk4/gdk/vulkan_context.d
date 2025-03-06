module gdk.vulkan_context;

import gdk.c.functions;
import gdk.c.types;
import gdk.draw_context;
import gdk.types;
import gid.gid;
import gio.initable;
import gio.initable_mixin;
import gobject.dclosure;

/**
    [gdk.vulkan_context.VulkanContext] is an object representing the platform-specific
  Vulkan draw context.
  
  [gdk.vulkan_context.VulkanContext]s are created for a surface using
  [gdk.surface.Surface.createVulkanContext], and the context will match
  the characteristics of the surface.
  
  Support for [gdk.vulkan_context.VulkanContext] is platform-specific and context creation
  can fail, returning null context.
*/
class VulkanContext : gdk.draw_context.DrawContext, gio.initable.Initable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_vulkan_context_get_type != &gidSymbolNotFound ? gdk_vulkan_context_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin InitableT!();

  /**
      Emitted when the images managed by this context have changed.
    
    Usually this means that the swapchain had to be recreated,
    for example in response to a change of the surface size.
  
    ## Parameters
    $(LIST
      * $(B vulkanContext) the instance the signal is connected to
    )
  */
  alias ImagesUpdatedCallbackDlg = void delegate(gdk.vulkan_context.VulkanContext vulkanContext);

  /** ditto */
  alias ImagesUpdatedCallbackFunc = void function(gdk.vulkan_context.VulkanContext vulkanContext);

  /**
    Connect to ImagesUpdated signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectImagesUpdated(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ImagesUpdatedCallbackDlg) || is(T : ImagesUpdatedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto vulkanContext = getVal!(gdk.vulkan_context.VulkanContext)(_paramVals);
      _dClosure.dlg(vulkanContext);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("images-updated", closure, after);
  }
}
