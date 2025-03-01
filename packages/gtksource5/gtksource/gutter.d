module gtksource.gutter;

import gid.global;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.gutter_renderer;
import gtksource.types;
import gtksource.view;

/**
 * Gutter object for class@View.
 * The `GtkSourceGutter` object represents the left or right gutter of the text
 * view. It is used by class@View to draw the line numbers and
 * class@Marks that might be present on a line. By packing
 * additional class@GutterRenderer objects in the gutter, you can extend the
 * gutter with your own custom drawings.
 * To get a `GtkSourceGutter`, use the [gtksource.view.View.getGutter] function.
 * The gutter works very much the same way as cells rendered in a [gtk.tree_view.TreeView].
 * The concept is similar, with the exception that the gutter does not have an
 * underlying [gtk.tree_model.TreeModel]. The builtin line number renderer is at position
 * %GTK_SOURCE_VIEW_GUTTER_POSITION_LINES $(LPAREN)-30$(RPAREN) and the marks renderer is at
 * %GTK_SOURCE_VIEW_GUTTER_POSITION_MARKS $(LPAREN)-20$(RPAREN). The gutter sorts the renderers
 * in ascending order, from left to right. So the marks are displayed on the
 * right of the line numbers.
 */
class Gutter : Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_gutter_get_type != &gidSymbolNotFound ? gtk_source_gutter_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  View getView()
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_gutter_get_view(cast(GtkSourceGutter*)cPtr);
    auto _retval = ObjectG.getDObject!View(cast(GtkSourceView*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Insert renderer into the gutter. If renderer is yet unowned then gutter
   * claims its ownership. Otherwise just increases renderer's reference count.
   * renderer cannot be already inserted to another gutter.
   * Params:
   *   renderer = a gutter renderer $(LPAREN)must inherit from #GtkSourceGutterRenderer$(RPAREN).
   *   position = the renderer position.
   * Returns: %TRUE if operation succeeded. Otherwise %FALSE.
   */
  bool insert(GutterRenderer renderer, int position)
  {
    bool _retval;
    _retval = gtk_source_gutter_insert(cast(GtkSourceGutter*)cPtr, renderer ? cast(GtkSourceGutterRenderer*)renderer.cPtr(No.Dup) : null, position);
    return _retval;
  }

  void remove(GutterRenderer renderer)
  {
    gtk_source_gutter_remove(cast(GtkSourceGutter*)cPtr, renderer ? cast(GtkSourceGutterRenderer*)renderer.cPtr(No.Dup) : null);
  }

  /**
   * Reorders renderer in gutter to new position.
   * Params:
   *   renderer = a #GtkCellRenderer.
   *   position = the new renderer position.
   */
  void reorder(GutterRenderer renderer, int position)
  {
    gtk_source_gutter_reorder(cast(GtkSourceGutter*)cPtr, renderer ? cast(GtkSourceGutterRenderer*)renderer.cPtr(No.Dup) : null, position);
  }
}
