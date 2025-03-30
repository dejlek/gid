/// Module for [ContainerCellAccessible] class
module gtk.container_cell_accessible;

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
import gtk.types;

/** */
class ContainerCellAccessible : gtk.cell_accessible.CellAccessible
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
    return cast(void function())gtk_container_cell_accessible_get_type != &gidSymbolNotFound ? gtk_container_cell_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override ContainerCellAccessible self()
  {
    return this;
  }

  /** */
  this()
  {
    GtkContainerCellAccessible* _cretval;
    _cretval = gtk_container_cell_accessible_new();
    this(_cretval, Yes.Take);
  }

  /** */
  void addChild(gtk.cell_accessible.CellAccessible child)
  {
    gtk_container_cell_accessible_add_child(cast(GtkContainerCellAccessible*)cPtr, child ? cast(GtkCellAccessible*)child.cPtr(No.Dup) : null);
  }

  /**
      Get a list of children.
      Returns: 
  */
  gtk.cell_accessible.CellAccessible[] getChildren()
  {
    GList* _cretval;
    _cretval = gtk_container_cell_accessible_get_children(cast(GtkContainerCellAccessible*)cPtr);
    auto _retval = gListToD!(gtk.cell_accessible.CellAccessible, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  void removeChild(gtk.cell_accessible.CellAccessible child)
  {
    gtk_container_cell_accessible_remove_child(cast(GtkContainerCellAccessible*)cPtr, child ? cast(GtkCellAccessible*)child.cPtr(No.Dup) : null);
  }
}
