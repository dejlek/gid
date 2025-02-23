module GtkSource.GutterRendererText;

import Gid.gid;
import Gtk.Accessible;
import Gtk.AccessibleT;
import Gtk.Buildable;
import Gtk.BuildableT;
import Gtk.ConstraintTarget;
import Gtk.ConstraintTargetT;
import GtkSource.GutterRenderer;
import GtkSource.Types;
import GtkSource.c.functions;
import GtkSource.c.types;

/**
 * Renders text in the gutter.
 * A `GtkSourceGutterRendererText` can be used to render text in a cell of
 * class@Gutter.
 */
class GutterRendererText : GutterRenderer
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_gutter_renderer_text_get_type != &gidSymbolNotFound ? gtk_source_gutter_renderer_text_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Create a new #GtkSourceGutterRendererText.
   * Returns: A #GtkSourceGutterRenderer
   */
  this()
  {
    GtkSourceGutterRenderer* _cretval;
    _cretval = gtk_source_gutter_renderer_text_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Measures the pango markup provided using the pango layout used by the
   * #GtkSourceGutterRendererText.
   * Params:
   *   markup = the pango markup to measure.
   *   width = location to store the width of the text in pixels,
   *     or %NULL.
   *   height = location to store the height of the text in
   *     pixels, or %NULL.
   */
  void measureMarkup(string markup, out int width, out int height)
  {
    const(char)* _markup = markup.toCString(No.Alloc);
    gtk_source_gutter_renderer_text_measure_markup(cast(GtkSourceGutterRendererText*)cPtr, _markup, cast(int*)&width, cast(int*)&height);
  }

  void setMarkup(string markup, int length)
  {
    const(char)* _markup = markup.toCString(No.Alloc);
    gtk_source_gutter_renderer_text_set_markup(cast(GtkSourceGutterRendererText*)cPtr, _markup, length);
  }

  void setText(string text, int length)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_source_gutter_renderer_text_set_text(cast(GtkSourceGutterRendererText*)cPtr, _text, length);
  }
}
