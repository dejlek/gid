module gstvideo.video_direction_iface_proxy;

import gobject.object;
import gstvideo.video_direction;
import gstvideo.video_direction_mixin;

/// Proxy object for GstVideo.VideoDirection interface when a GObject has no applicable D binding
class VideoDirectionIfaceProxy : IfaceProxy, gstvideo.video_direction.VideoDirection
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gstvideo.video_direction.VideoDirection);
  }

  mixin VideoDirectionT!();
}
