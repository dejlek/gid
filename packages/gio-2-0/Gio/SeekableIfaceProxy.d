module Gio.SeekableIfaceProxy;

import GObject.ObjectG;
import Gio.Seekable;
import Gio.SeekableT;

/// Proxy object for Gio.Seekable interface when a GObject has no applicable D binding
class SeekableIfaceProxy : IfaceProxy, Seekable
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Seekable);
  }

  mixin SeekableT!();
}
