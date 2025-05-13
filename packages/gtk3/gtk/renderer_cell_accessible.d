/// Module for [RendererCellAccessible] class
module gtk.renderer_cell_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.table_cell;
import atk.table_cell_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_accessible;
import gtk.cell_renderer;
import gtk.types;

/** */
class RendererCellAccessible : gtk.cell_accessible.CellAccessible
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_renderer_cell_accessible_get_type != &gidSymbolNotFound ? gtk_renderer_cell_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RendererCellAccessible self()
  {
    return this;
  }

  /** */
  this(gtk.cell_renderer.CellRenderer renderer)
  {
    AtkObject* _cretval;
    _cretval = gtk_renderer_cell_accessible_new(renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
