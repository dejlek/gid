/// Module for [PrintOperationPreviewIfaceProxy] interface proxy object
module gtk.print_operation_preview_iface_proxy;

import gobject.object;
import gtk.print_operation_preview;
import gtk.print_operation_preview_mixin;

/// Proxy object for [Gtk.PrintOperationPreview] interface when a GObject has no applicable D binding
class PrintOperationPreviewIfaceProxy : IfaceProxy, gtk.print_operation_preview.PrintOperationPreview
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gtk.print_operation_preview.PrintOperationPreview);
  }

  mixin PrintOperationPreviewT!();
}
