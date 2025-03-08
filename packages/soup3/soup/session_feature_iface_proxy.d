module soup.session_feature_iface_proxy;

import gobject.object;
import soup.session_feature;
import soup.session_feature_mixin;

/// Proxy object for Soup.SessionFeature interface when a GObject has no applicable D binding
class SessionFeatureIfaceProxy : IfaceProxy, soup.session_feature.SessionFeature
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(soup.session_feature.SessionFeature);
  }

  mixin SessionFeatureT!();
}
