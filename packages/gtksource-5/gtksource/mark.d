module gtksource.mark;

import gid.gid;
import gobject.object;
import gtk.text_mark;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/**
 * Mark object for class@Buffer.
 * A `GtkSourceMark` marks a position in the text where you want to display
 * additional info. It is based on [Gtk.TextMark] and thus is still valid after
 * the text has changed though its position may change.
 * `GtkSourceMark`s are organized in categories which you have to set
 * when you create the mark. Each category can have a priority, a pixbuf and
 * other associated attributes. See [GtkSource.View.setMarkAttributes].
 * The pixbuf will be displayed in the margin at the line where the mark
 * residents if the property@View:show-line-marks property is set to %TRUE. If
 * there are multiple marks in the same line, the pixbufs will be drawn on top
 * of each other. The mark with the highest priority will be drawn on top.
 */
class Mark : TextMark
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_mark_get_type != &gidSymbolNotFound ? gtk_source_mark_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a text mark.
   * Add it to a buffer using [Gtk.TextBuffer.addMark].
   * If name is NULL, the mark is anonymous; otherwise, the mark can be retrieved
   * by name using [Gtk.TextBuffer.getMark].
   * Normally marks are created using the utility function
   * [GtkSource.Buffer.createSourceMark].
   * Params:
   *   name = Name of the #GtkSourceMark or %NULL
   *   category = is used to classify marks according to common characteristics
   *     $(LPAREN)e.g. all the marks representing a bookmark could belong to the "bookmark"
   *     category, or all the marks representing a compilation error could belong
   *     to "error" category$(RPAREN).
   * Returns: a new #GtkSourceMark that can be added using [Gtk.TextBuffer.addMark].
   */
  this(string name, string category)
  {
    GtkSourceMark* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _category = category.toCString(No.Alloc);
    _cretval = gtk_source_mark_new(_name, _category);
    this(_cretval, Yes.Take);
  }

  /**
   * Returns the mark category.
   * Returns: the category of the #GtkSourceMark.
   */
  string getCategory()
  {
    const(char)* _cretval;
    _cretval = gtk_source_mark_get_category(cast(GtkSourceMark*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Returns the next `GtkSourceMark` in the buffer or %NULL if the mark
   * was not added to a buffer.
   * If there is no next mark, %NULL will be returned.
   * If category is %NULL, looks for marks of any category.
   * Params:
   *   category = a string specifying the mark category, or %NULL.
   * Returns: the next #GtkSourceMark, or %NULL.
   */
  Mark next(string category)
  {
    GtkSourceMark* _cretval;
    const(char)* _category = category.toCString(No.Alloc);
    _cretval = gtk_source_mark_next(cast(GtkSourceMark*)cPtr, _category);
    auto _retval = ObjectG.getDObject!Mark(cast(GtkSourceMark*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns the previous `GtkSourceMark` in the buffer or %NULL if the mark
   * was not added to a buffer.
   * If there is no previous mark, %NULL is returned.
   * If category is %NULL, looks for marks of any category
   * Params:
   *   category = a string specifying the mark category, or %NULL.
   * Returns: the previous #GtkSourceMark, or %NULL.
   */
  Mark prev(string category)
  {
    GtkSourceMark* _cretval;
    const(char)* _category = category.toCString(No.Alloc);
    _cretval = gtk_source_mark_prev(cast(GtkSourceMark*)cPtr, _category);
    auto _retval = ObjectG.getDObject!Mark(cast(GtkSourceMark*)_cretval, No.Take);
    return _retval;
  }
}
