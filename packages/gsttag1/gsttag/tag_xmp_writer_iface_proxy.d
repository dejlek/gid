module gsttag.tag_xmp_writer_iface_proxy;

import gobject.object;
import gsttag.tag_xmp_writer;
import gsttag.tag_xmp_writer_mixin;

/// Proxy object for GstTag.TagXmpWriter interface when a GObject has no applicable D binding
class TagXmpWriterIfaceProxy : IfaceProxy, gsttag.tag_xmp_writer.TagXmpWriter
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gsttag.tag_xmp_writer.TagXmpWriter);
  }

  mixin TagXmpWriterT!();
}
