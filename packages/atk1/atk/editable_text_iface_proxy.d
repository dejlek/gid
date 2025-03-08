module atk.editable_text_iface_proxy;

import gobject.object;
import atk.editable_text;
import atk.editable_text_mixin;

/// Proxy object for Atk.EditableText interface when a GObject has no applicable D binding
class EditableTextIfaceProxy : IfaceProxy, atk.editable_text.EditableText
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(atk.editable_text.EditableText);
  }

  mixin EditableTextT!();
}
