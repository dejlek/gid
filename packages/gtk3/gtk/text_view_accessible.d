/// Module for [TextViewAccessible] class
module gtk.text_view_accessible;

import atk.component;
import atk.component_mixin;
import atk.editable_text;
import atk.editable_text_mixin;
import atk.streamable_content;
import atk.streamable_content_mixin;
import atk.text;
import atk.text_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class TextViewAccessible : gtk.container_accessible.ContainerAccessible, atk.editable_text.EditableText, atk.streamable_content.StreamableContent, atk.text.Text
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_text_view_accessible_get_type != &gidSymbolNotFound ? gtk_text_view_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TextViewAccessible self()
  {
    return this;
  }

  mixin EditableTextT!();
  mixin StreamableContentT!();
  mixin TextT!();
}
