module gio.pollable_output_stream_iface_proxy;

import gobject.object;
import gio.pollable_output_stream;
import gio.pollable_output_stream_mixin;

/// Proxy object for Gio.PollableOutputStream interface when a GObject has no applicable D binding
class PollableOutputStreamIfaceProxy : IfaceProxy, gio.pollable_output_stream.PollableOutputStream
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gio.pollable_output_stream.PollableOutputStream);
  }

  mixin PollableOutputStreamT!();
}
