module atk.editable_text_iface_proxy;

import gobject.object;
import atk.editable_text;
import atk.editable_text_mixin;

/// Proxy object for Atk.EditableText interface when a GObject has no applicable D binding
class EditableTextIfaceProxy : IfaceProxy, EditableText
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(EditableText);
  }

  mixin EditableTextT!();
}
