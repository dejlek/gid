module GtkSource.StyleSchemeChooserIfaceProxy;

import GObject.ObjectG;
import GtkSource.StyleSchemeChooser;
import GtkSource.StyleSchemeChooserT;

/// Proxy object for GtkSource.StyleSchemeChooser interface when a GObject has no applicable D binding
class StyleSchemeChooserIfaceProxy : IfaceProxy, StyleSchemeChooser
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(StyleSchemeChooser);
  }

  mixin StyleSchemeChooserT!();
}
