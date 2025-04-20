/// Module for [TextCellAccessible] class
module gtk.text_cell_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.table_cell;
import atk.table_cell_mixin;
import atk.text;
import atk.text_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.renderer_cell_accessible;
import gtk.types;

/** */
class TextCellAccessible : gtk.renderer_cell_accessible.RendererCellAccessible, atk.text.Text
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
    return cast(void function())gtk_text_cell_accessible_get_type != &gidSymbolNotFound ? gtk_text_cell_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TextCellAccessible self()
  {
    return this;
  }

  mixin TextT!();
}
