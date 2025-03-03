module gio.pollable_input_stream_iface_proxy;

import gobject.object;
import gio.pollable_input_stream;
import gio.pollable_input_stream_mixin;

/// Proxy object for Gio.PollableInputStream interface when a GObject has no applicable D binding
class PollableInputStreamIfaceProxy : IfaceProxy, gio.pollable_input_stream.PollableInputStream
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gio.pollable_input_stream.PollableInputStream);
  }

  mixin PollableInputStreamT!();
}
