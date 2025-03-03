module gtksource.mark;

import gid.gid;
import gobject.object;
import gtk.text_mark;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

class Mark : gtk.text_mark.TextMark
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
   * Creates a text mark. Add it to a buffer using [gtk.text_buffer.TextBuffer.addMark].
   * If name is NULL, the mark is anonymous; otherwise, the mark can be retrieved
   * by name using [gtk.text_buffer.TextBuffer.getMark].
   * Normally marks are created using the utility function
   * [gtksource.buffer.Buffer.createSourceMark].
   * Params:
   *   name = Name of the #GtkSourceMark or %NULL
   *   category = is used to classify marks according to common characteristics
   *     $(LPAREN)e.g. all the marks representing a bookmark could belong to the "bookmark"
   *     category, or all the marks representing a compilation error could belong
   *     to "error" category$(RPAREN).
   * Returns: a new #GtkSourceMark that can be added using [gtk.text_buffer.TextBuffer.addMark].
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
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Returns the next #GtkSourceMark in the buffer or %NULL if the mark
   * was not added to a buffer. If there is no next mark, %NULL will be returned.
   * If category is %NULL, looks for marks of any category.
   * Params:
   *   category = a string specifying the mark category, or %NULL.
   * Returns: the next #GtkSourceMark, or %NULL.
   */
  gtksource.mark.Mark next(string category)
  {
    GtkSourceMark* _cretval;
    const(char)* _category = category.toCString(No.Alloc);
    _cretval = gtk_source_mark_next(cast(GtkSourceMark*)cPtr, _category);
    auto _retval = ObjectG.getDObject!(gtksource.mark.Mark)(cast(GtkSourceMark*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns the previous #GtkSourceMark in the buffer or %NULL if the mark
   * was not added to a buffer. If there is no previous mark, %NULL is returned.
   * If category is %NULL, looks for marks of any category
   * Params:
   *   category = a string specifying the mark category, or %NULL.
   * Returns: the previous #GtkSourceMark, or %NULL.
   */
  gtksource.mark.Mark prev(string category)
  {
    GtkSourceMark* _cretval;
    const(char)* _category = category.toCString(No.Alloc);
    _cretval = gtk_source_mark_prev(cast(GtkSourceMark*)cPtr, _category);
    auto _retval = ObjectG.getDObject!(gtksource.mark.Mark)(cast(GtkSourceMark*)_cretval, No.Take);
    return _retval;
  }
}
