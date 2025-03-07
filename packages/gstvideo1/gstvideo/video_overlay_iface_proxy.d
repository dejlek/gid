module gstvideo.video_overlay_iface_proxy;

import gobject.object;
import gstvideo.video_overlay;
import gstvideo.video_overlay_mixin;

/// Proxy object for GstVideo.VideoOverlay interface when a GObject has no applicable D binding
class VideoOverlayIfaceProxy : IfaceProxy, gstvideo.video_overlay.VideoOverlay
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gstvideo.video_overlay.VideoOverlay);
  }

  mixin VideoOverlayT!();
}
