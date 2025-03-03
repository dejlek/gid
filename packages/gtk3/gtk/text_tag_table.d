module gtk.text_tag_table;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.text_tag;
import gtk.types;

/**
 * You may wish to begin by reading the
 * [text widget conceptual overview](TextWidget.html)
 * which gives an overview of all the objects and
 * data types related to the text widget and how they work together.
 * # GtkTextTagTables as GtkBuildable
 * The GtkTextTagTable implementation of the GtkBuildable interface
 * supports adding tags by specifying “tag” as the “type” attribute
 * of a `<child>` element.
 * An example of a UI definition fragment specifying tags:
 * |[<!-- language\="xml" -->
 * <object class\="GtkTextTagTable">
 * <child type\="tag">
 * <object class\="GtkTextTag"/>
 * </child>
 * </object>
 * ]|
 */
class TextTagTable : gobject.object.ObjectG, gtk.buildable.Buildable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_text_tag_table_get_type != &gidSymbolNotFound ? gtk_text_tag_table_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin BuildableT!();

  /**
   * Creates a new #GtkTextTagTable. The table contains no tags by
   * default.
   * Returns: a new #GtkTextTagTable
   */
  this()
  {
    GtkTextTagTable* _cretval;
    _cretval = gtk_text_tag_table_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Add a tag to the table. The tag is assigned the highest priority
   * in the table.
   * tag must not be in a tag table already, and may not have
   * the same name as an already-added tag.
   * Params:
   *   tag = a #GtkTextTag
   * Returns: %TRUE on success.
   */
  bool add(gtk.text_tag.TextTag tag)
  {
    bool _retval;
    _retval = gtk_text_tag_table_add(cast(GtkTextTagTable*)cPtr, tag ? cast(GtkTextTag*)tag.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Calls func on each tag in table, with user data data.
   * Note that the table may not be modified while iterating
   * over it $(LPAREN)you can’t add/remove tags$(RPAREN).
   * Params:
   *   func = a function to call on each tag
   */
  void foreach_(gtk.types.TextTagTableForeach func)
  {
    extern(C) void _funcCallback(GtkTextTag* tag, void* data)
    {
      auto _dlg = cast(gtk.types.TextTagTableForeach*)data;

      (*_dlg)(ObjectG.getDObject!(gtk.text_tag.TextTag)(cast(void*)tag, No.Take));
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? cast(void*)&(func) : null;
    gtk_text_tag_table_foreach(cast(GtkTextTagTable*)cPtr, _funcCB, _func);
  }

  /**
   * Returns the size of the table $(LPAREN)number of tags$(RPAREN)
   * Returns: number of tags in table
   */
  int getSize()
  {
    int _retval;
    _retval = gtk_text_tag_table_get_size(cast(GtkTextTagTable*)cPtr);
    return _retval;
  }

  /**
   * Look up a named tag.
   * Params:
   *   name = name of a tag
   * Returns: The tag, or %NULL if none by that
   *   name is in the table.
   */
  gtk.text_tag.TextTag lookup(string name)
  {
    GtkTextTag* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_text_tag_table_lookup(cast(GtkTextTagTable*)cPtr, _name);
    auto _retval = ObjectG.getDObject!(gtk.text_tag.TextTag)(cast(GtkTextTag*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Remove a tag from the table. If a #GtkTextBuffer has table as its tag table,
   * the tag is removed from the buffer. The table’s reference to the tag is
   * removed, so the tag will end up destroyed if you don’t have a reference to
   * it.
   * Params:
   *   tag = a #GtkTextTag
   */
  void remove(gtk.text_tag.TextTag tag)
  {
    gtk_text_tag_table_remove(cast(GtkTextTagTable*)cPtr, tag ? cast(GtkTextTag*)tag.cPtr(No.Dup) : null);
  }

  alias TagAddedCallbackDlg = void delegate(gtk.text_tag.TextTag tag, gtk.text_tag_table.TextTagTable textTagTable);
  alias TagAddedCallbackFunc = void function(gtk.text_tag.TextTag tag, gtk.text_tag_table.TextTagTable textTagTable);

  /**
   * Connect to TagAdded signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectTagAdded(T)(T callback, Flag!"After" after = No.After)
  if (is(T : TagAddedCallbackDlg) || is(T : TagAddedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto textTagTable = getVal!(gtk.text_tag_table.TextTagTable)(_paramVals);
      auto tag = getVal!(gtk.text_tag.TextTag)(&_paramVals[1]);
      _dClosure.dlg(tag, textTagTable);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("tag-added", closure, after);
  }

  alias TagChangedCallbackDlg = void delegate(gtk.text_tag.TextTag tag, bool sizeChanged, gtk.text_tag_table.TextTagTable textTagTable);
  alias TagChangedCallbackFunc = void function(gtk.text_tag.TextTag tag, bool sizeChanged, gtk.text_tag_table.TextTagTable textTagTable);

  /**
   * Connect to TagChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectTagChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : TagChangedCallbackDlg) || is(T : TagChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto textTagTable = getVal!(gtk.text_tag_table.TextTagTable)(_paramVals);
      auto tag = getVal!(gtk.text_tag.TextTag)(&_paramVals[1]);
      auto sizeChanged = getVal!(bool)(&_paramVals[2]);
      _dClosure.dlg(tag, sizeChanged, textTagTable);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("tag-changed", closure, after);
  }

  alias TagRemovedCallbackDlg = void delegate(gtk.text_tag.TextTag tag, gtk.text_tag_table.TextTagTable textTagTable);
  alias TagRemovedCallbackFunc = void function(gtk.text_tag.TextTag tag, gtk.text_tag_table.TextTagTable textTagTable);

  /**
   * Connect to TagRemoved signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectTagRemoved(T)(T callback, Flag!"After" after = No.After)
  if (is(T : TagRemovedCallbackDlg) || is(T : TagRemovedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto textTagTable = getVal!(gtk.text_tag_table.TextTagTable)(_paramVals);
      auto tag = getVal!(gtk.text_tag.TextTag)(&_paramVals[1]);
      _dClosure.dlg(tag, textTagTable);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("tag-removed", closure, after);
  }
}
