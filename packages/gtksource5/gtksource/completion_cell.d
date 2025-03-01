module gtksource.completion_cell;

import gdk.paintable;
import gdk.paintable_mixin;
import gid.global;
import gio.icon;
import gio.icon_mixin;
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
import gtksource.types;
import pango.attr_list;

/**
 * Widget for single cell of completion proposal.
 * The `GtkSourceCompletionCell` widget provides a container to display various
 * types of information with the completion display.
 * Each proposal may consist of multiple cells depending on the complexity of
 * the proposal. For example, programming language proposals may contain a cell
 * for the "left-hand-side" of an operation along with the "typed-text" for a
 * function name and "parameters". They may also optionally set an icon to
 * signify the kind of result.
 * A iface@CompletionProvider should implement the
 * vfunc@CompletionProvider.display virtual function to control
 * how to convert data from their iface@CompletionProposal to content for
 * the `GtkSourceCompletionCell`.
 */
class CompletionCell : Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_completion_cell_get_type != &gidSymbolNotFound ? gtk_source_completion_cell_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  CompletionColumn getColumn()
  {
    GtkSourceCompletionColumn _cretval;
    _cretval = gtk_source_completion_cell_get_column(cast(GtkSourceCompletionCell*)cPtr);
    CompletionColumn _retval = cast(CompletionColumn)_cretval;
    return _retval;
  }

  /**
   * Gets the child #GtkWidget, if any.
   * Returns: a #GtkWidget or %NULL
   */
  Widget getWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_completion_cell_get_widget(cast(GtkSourceCompletionCell*)cPtr);
    auto _retval = ObjectG.getDObject!Widget(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  void setGicon(Icon gicon)
  {
    gtk_source_completion_cell_set_gicon(cast(GtkSourceCompletionCell*)cPtr, gicon ? cast(GIcon*)(cast(ObjectG)gicon).cPtr(No.Dup) : null);
  }

  void setIconName(string iconName)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_source_completion_cell_set_icon_name(cast(GtkSourceCompletionCell*)cPtr, _iconName);
  }

  void setMarkup(string markup)
  {
    const(char)* _markup = markup.toCString(No.Alloc);
    gtk_source_completion_cell_set_markup(cast(GtkSourceCompletionCell*)cPtr, _markup);
  }

  void setPaintable(Paintable paintable)
  {
    gtk_source_completion_cell_set_paintable(cast(GtkSourceCompletionCell*)cPtr, paintable ? cast(GdkPaintable*)(cast(ObjectG)paintable).cPtr(No.Dup) : null);
  }

  /**
   * Sets the text for the column cell. Use %NULL to unset.
   * Params:
   *   text = the text to set or %NULL
   */
  void setText(string text)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_source_completion_cell_set_text(cast(GtkSourceCompletionCell*)cPtr, _text);
  }

  void setTextWithAttributes(string text, AttrList attrs)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_source_completion_cell_set_text_with_attributes(cast(GtkSourceCompletionCell*)cPtr, _text, attrs ? cast(PangoAttrList*)attrs.cPtr(No.Dup) : null);
  }

  void setWidget(Widget child)
  {
    gtk_source_completion_cell_set_widget(cast(GtkSourceCompletionCell*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }
}
