module gio.converter_iface_proxy;

import gobject.object;
import gio.converter;
import gio.converter_mixin;

/// Proxy object for Gio.Converter interface when a GObject has no applicable D binding
class ConverterIfaceProxy : IfaceProxy, Converter
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Converter);
  }

  mixin ConverterT!();
}
