module gtk.separator_tool_item;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.tool_item;
import gtk.types;

/**
 * A #GtkSeparatorToolItem is a #GtkToolItem that separates groups of other
 * #GtkToolItems. Depending on the theme, a #GtkSeparatorToolItem will
 * often look like a vertical line on horizontally docked toolbars.
 * If the #GtkToolbar child property “expand” is %TRUE and the property
 * #GtkSeparatorToolItem:draw is %FALSE, a #GtkSeparatorToolItem will act as
 * a “spring” that forces other items to the ends of the toolbar.
 * Use [gtk.separator_tool_item.SeparatorToolItem.new_] to create a new #GtkSeparatorToolItem.
 * # CSS nodes
 * GtkSeparatorToolItem has a single CSS node with name separator.
 */
class SeparatorToolItem : gtk.tool_item.ToolItem
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_separator_tool_item_get_type != &gidSymbolNotFound ? gtk_separator_tool_item_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Create a new #GtkSeparatorToolItem
   * Returns: the new #GtkSeparatorToolItem
   */
  this()
  {
    GtkToolItem* _cretval;
    _cretval = gtk_separator_tool_item_new();
    this(_cretval, No.Take);
  }

  /**
   * Returns whether item is drawn as a line, or just blank.
   * See [gtk.separator_tool_item.SeparatorToolItem.setDraw].
   * Returns: %TRUE if item is drawn as a line, or just blank.
   */
  bool getDraw()
  {
    bool _retval;
    _retval = gtk_separator_tool_item_get_draw(cast(GtkSeparatorToolItem*)cPtr);
    return _retval;
  }

  /**
   * Whether item is drawn as a vertical line, or just blank.
   * Setting this to %FALSE along with [gtk.tool_item.ToolItem.setExpand] is useful
   * to create an item that forces following items to the end of the toolbar.
   * Params:
   *   draw = whether item is drawn as a vertical line
   */
  void setDraw(bool draw)
  {
    gtk_separator_tool_item_set_draw(cast(GtkSeparatorToolItem*)cPtr, draw);
  }
}
