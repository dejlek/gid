/// Module for [VideoOrientationIfaceProxy] interface proxy object
module gstvideo.video_orientation_iface_proxy;

import gobject.object;
import gstvideo.video_orientation;
import gstvideo.video_orientation_mixin;

/// Proxy object for [GstVideo.VideoOrientation] interface when a GObject has no applicable D binding
class VideoOrientationIfaceProxy : IfaceProxy, gstvideo.video_orientation.VideoOrientation
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gstvideo.video_orientation.VideoOrientation);
  }

  mixin VideoOrientationT!();
}
