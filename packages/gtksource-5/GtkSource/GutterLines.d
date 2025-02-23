module GtkSource.GutterLines;

import GLib.Types;
import GObject.ObjectG;
import Gid.gid;
import Gtk.TextBuffer;
import Gtk.TextIter;
import Gtk.TextView;
import GtkSource.Types;
import GtkSource.c.functions;
import GtkSource.c.types;

/**
 * Collected information about visible lines.
 * The `GtkSourceGutterLines` object is used to collect information about
 * visible lines.
 * Use this from your signal@GutterRenderer::query-data to collect the
 * necessary information on visible lines. Doing so reduces the number of
 * passes through the text btree allowing GtkSourceView to reach more
 * frames-per-second while performing kinetic scrolling.
 */
class GutterLines : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_gutter_lines_get_type != &gidSymbolNotFound ? gtk_source_gutter_lines_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Adds the class name to line.
   * name will be converted to a [GLib.Quark] as part of this process. A
   * faster version of this function is available via
   * [GtkSource.GutterLines.addQclass] for situations where the [GLib.Quark] is
   * known ahead of time.
   * Params:
   *   line = a line number starting from zero
   *   name = a class name
   */
  void addClass(uint line, string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_source_gutter_lines_add_class(cast(GtkSourceGutterLines*)cPtr, line, _name);
  }

  /**
   * Adds the class denoted by qname to line.
   * You may check if a line has qname by calling
   * [GtkSource.GutterLines.hasQclass].
   * You can remove qname by calling
   * [GtkSource.GutterLines.removeQclass].
   * Params:
   *   line = a line number starting from zero
   *   qname = a class name as a #GQuark
   */
  void addQclass(uint line, Quark qname)
  {
    gtk_source_gutter_lines_add_qclass(cast(GtkSourceGutterLines*)cPtr, line, qname);
  }

  /**
   * Gets the [Gtk.TextBuffer] that the `GtkSourceGutterLines` represents.
   * Returns: a #GtkTextBuffer
   */
  TextBuffer getBuffer()
  {
    GtkTextBuffer* _cretval;
    _cretval = gtk_source_gutter_lines_get_buffer(cast(GtkSourceGutterLines*)cPtr);
    auto _retval = ObjectG.getDObject!TextBuffer(cast(GtkTextBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the line number $(LPAREN)starting from 0$(RPAREN) for the first line that is
   * user visible.
   * Returns: a line number starting from 0
   */
  uint getFirst()
  {
    uint _retval;
    _retval = gtk_source_gutter_lines_get_first(cast(GtkSourceGutterLines*)cPtr);
    return _retval;
  }

  /**
   * Gets a #GtkTextIter for the current buffer at line
   * Params:
   *   iter = a location for a #GtkTextIter
   *   line = the line number
   */
  void getIterAtLine(out TextIter iter, uint line)
  {
    GtkTextIter _iter;
    gtk_source_gutter_lines_get_iter_at_line(cast(GtkSourceGutterLines*)cPtr, &_iter, line);
    iter = new TextIter(cast(void*)&_iter, No.Take);
  }

  /**
   * Gets the line number $(LPAREN)starting from 0$(RPAREN) for the last line that is
   * user visible.
   * Returns: a line number starting from 0
   */
  uint getLast()
  {
    uint _retval;
    _retval = gtk_source_gutter_lines_get_last(cast(GtkSourceGutterLines*)cPtr);
    return _retval;
  }

  /**
   * Gets the Y range for a line based on mode.
   * The value for y is relative to the renderers widget coordinates.
   * Params:
   *   line = a line number starting from zero
   *   mode = a #GtkSourceGutterRendererAlignmentMode
   *   y = a location for the Y position in widget coordinates
   *   height = the line height based on mode
   */
  void getLineYrange(uint line, GutterRendererAlignmentMode mode, out int y, out int height)
  {
    gtk_source_gutter_lines_get_line_yrange(cast(GtkSourceGutterLines*)cPtr, line, mode, cast(int*)&y, cast(int*)&height);
  }

  /**
   * Gets the [Gtk.TextView] that the `GtkSourceGutterLines` represents.
   * Returns: a #GtkTextView
   */
  TextView getView()
  {
    GtkTextView* _cretval;
    _cretval = gtk_source_gutter_lines_get_view(cast(GtkSourceGutterLines*)cPtr);
    auto _retval = ObjectG.getDObject!TextView(cast(GtkTextView*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Checks to see if the line has any GQuark classes set. This can be
   * used to help renderer implementations avoid work if nothing has
   * been set on the class.
   * Params:
   *   line = a line contained within lines
   * Returns: %TRUE if any quark was set for the line
   */
  bool hasAnyClass(uint line)
  {
    bool _retval;
    _retval = gtk_source_gutter_lines_has_any_class(cast(GtkSourceGutterLines*)cPtr, line);
    return _retval;
  }

  /**
   * Checks to see if [GtkSource.GutterLines.addClass] was called with
   * the name for line.
   * A faster version of this function is provided via
   * [GtkSource.GutterLines.hasQclass] for situations where the quark
   * is known ahead of time.
   * Params:
   *   line = a line number starting from zero
   *   name = a class name that may be converted, to a #GQuark
   * Returns: %TRUE if line contains name
   */
  bool hasClass(uint line, string name)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = gtk_source_gutter_lines_has_class(cast(GtkSourceGutterLines*)cPtr, line, _name);
    return _retval;
  }

  /**
   * Checks to see if [GtkSource.GutterLines.addQclass] was called with
   * the quark denoted by qname for line.
   * Params:
   *   line = a line number starting from zero
   *   qname = a #GQuark containing the class name
   * Returns: %TRUE if line contains qname
   */
  bool hasQclass(uint line, Quark qname)
  {
    bool _retval;
    _retval = gtk_source_gutter_lines_has_qclass(cast(GtkSourceGutterLines*)cPtr, line, qname);
    return _retval;
  }

  /**
   * Checks to see if line contains the insertion cursor.
   * Params:
   *   line = a line number starting from zero
   * Returns: %TRUE if the insertion cursor is on line
   */
  bool isCursor(uint line)
  {
    bool _retval;
    _retval = gtk_source_gutter_lines_is_cursor(cast(GtkSourceGutterLines*)cPtr, line);
    return _retval;
  }

  /**
   * Checks to see if line is marked as prelit. Generally, this means
   * the mouse pointer is over the line within the gutter.
   * Params:
   *   line = a line number starting from zero
   * Returns: %TRUE if the line is prelit
   */
  bool isPrelit(uint line)
  {
    bool _retval;
    _retval = gtk_source_gutter_lines_is_prelit(cast(GtkSourceGutterLines*)cPtr, line);
    return _retval;
  }

  /**
   * Checks to see if the view had a selection and if that selection overlaps
   * line in some way.
   * Params:
   *   line = a line number starting from zero
   * Returns: %TRUE if the line contains a selection
   */
  bool isSelected(uint line)
  {
    bool _retval;
    _retval = gtk_source_gutter_lines_is_selected(cast(GtkSourceGutterLines*)cPtr, line);
    return _retval;
  }

  /**
   * Removes the class matching name from line.
   * A faster version of this function is available via
   * [GtkSource.GutterLines.removeQclass] for situations where the
   * #GQuark is known ahead of time.
   * Params:
   *   line = a line number starting from zero
   *   name = a class name
   */
  void removeClass(uint line, string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_source_gutter_lines_remove_class(cast(GtkSourceGutterLines*)cPtr, line, _name);
  }

  /**
   * Reverses a call to [GtkSource.GutterLines.addQclass] by removing
   * the [GLib.Quark] matching qname.
   * Params:
   *   line = a line number starting from zero
   *   qname = a #GQuark to remove from line
   */
  void removeQclass(uint line, Quark qname)
  {
    gtk_source_gutter_lines_remove_qclass(cast(GtkSourceGutterLines*)cPtr, line, qname);
  }
}
