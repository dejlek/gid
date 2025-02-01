module Gdk.VulkanContext;

import GObject.DClosure;
import Gdk.DrawContext;
import Gdk.Types;
import Gdk.c.functions;
import Gdk.c.types;
import Gid.gid;
import Gio.Initable;
import Gio.InitableT;

/**
 * `GdkVulkanContext` is an object representing the platform-specific
 * Vulkan draw context.
 * `GdkVulkanContext`s are created for a surface using
 * [Gdk.Surface.createVulkanContext], and the context will match
 * the characteristics of the surface.
 * Support for `GdkVulkanContext` is platform-specific and context creation
 * can fail, returning %NULL context.
 */
class VulkanContext : DrawContext, Initable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gdk_vulkan_context_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin InitableT!();

  /**
   * Emitted when the images managed by this context have changed.
   * Usually this means that the swapchain had to be recreated,
   * for example in response to a change of the surface size.
   *   vulkanContext = the instance the signal is connected to
   */
  alias ImagesUpdatedCallbackDlg = void delegate(VulkanContext vulkanContext);
  alias ImagesUpdatedCallbackFunc = void function(VulkanContext vulkanContext);

  /**
   * Connect to ImagesUpdated signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectImagesUpdated(T)(T callback, Flag!"After" after = No.After)
  if (is(T == ImagesUpdatedCallbackDlg) || is(T == ImagesUpdatedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto vulkanContext = getVal!VulkanContext(_paramVals);
      _dClosure.dlg(vulkanContext);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("images-updated", closure, after);
  }
}
