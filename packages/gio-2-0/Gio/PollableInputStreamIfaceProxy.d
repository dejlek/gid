module Gio.PollableInputStreamIfaceProxy;

import GObject.ObjectG;
import Gio.PollableInputStream;
import Gio.PollableInputStreamT;

/// Proxy object for Gio.PollableInputStream interface when a GObject has no applicable D binding
class PollableInputStreamIfaceProxy : IfaceProxy, PollableInputStream
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(PollableInputStream);
  }

  mixin PollableInputStreamT!();
}
