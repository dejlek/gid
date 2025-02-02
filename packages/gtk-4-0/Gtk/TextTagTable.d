module Gtk.TextTagTable;

import GObject.DClosure;
import GObject.ObjectG;
import Gid.gid;
import Gtk.Buildable;
import Gtk.BuildableT;
import Gtk.TextTag;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * The collection of tags in a `GtkTextBuffer`
 * You may wish to begin by reading the
 * [text widget conceptual overview](section-text-widget.html),
 * which gives an overview of all the objects and data types
 * related to the text widget and how they work together.
 * # GtkTextTagTables as GtkBuildable
 * The `GtkTextTagTable` implementation of the `GtkBuildable` interface
 * supports adding tags by specifying “tag” as the “type” attribute
 * of a `<child>` element.
 * An example of a UI definition fragment specifying tags:
 * ```xml
 * <object class\="GtkTextTagTable">
 * <child type\="tag">
 * <object class\="GtkTextTag"/>
 * </child>
 * </object>
 * ```
 */
class TextTagTable : ObjectG, Buildable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gtk_text_tag_table_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin BuildableT!();

  /**
   * Creates a new `GtkTextTagTable`.
   * The table contains no tags by default.
   * Returns: a new `GtkTextTagTable`
   */
  this()
  {
    GtkTextTagTable* _cretval;
    _cretval = gtk_text_tag_table_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Add a tag to the table.
   * The tag is assigned the highest priority in the table.
   * tag must not be in a tag table already, and may not have
   * the same name as an already-added tag.
   * Params:
   *   tag = a `GtkTextTag`
   * Returns: %TRUE on success.
   */
  bool add(TextTag tag)
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
  void foreach_(TextTagTableForeach func)
  {
    extern(C) void _funcCallback(GtkTextTag* tag, void* data)
    {
      auto _dlg = cast(TextTagTableForeach*)data;

      (*_dlg)(ObjectG.getDObject!TextTag(cast(void*)tag, No.Take));
    }

    auto _func = cast(void*)&func;
    gtk_text_tag_table_foreach(cast(GtkTextTagTable*)cPtr, &_funcCallback, _func);
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
   * Returns: The tag
   */
  TextTag lookup(string name)
  {
    GtkTextTag* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_text_tag_table_lookup(cast(GtkTextTagTable*)cPtr, _name);
    auto _retval = ObjectG.getDObject!TextTag(cast(GtkTextTag*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Remove a tag from the table.
   * If a `GtkTextBuffer` has table as its tag table, the tag is
   * removed from the buffer. The table’s reference to the tag is
   * removed, so the tag will end up destroyed if you don’t have
   * a reference to it.
   * Params:
   *   tag = a `GtkTextTag`
   */
  void remove(TextTag tag)
  {
    gtk_text_tag_table_remove(cast(GtkTextTagTable*)cPtr, tag ? cast(GtkTextTag*)tag.cPtr(No.Dup) : null);
  }

  /**
   * Emitted every time a new tag is added in the `GtkTextTagTable`.
   * Params
   *   tag = the added tag.
   *   textTagTable = the instance the signal is connected to
   */
  alias TagAddedCallbackDlg = void delegate(TextTag tag, TextTagTable textTagTable);
  alias TagAddedCallbackFunc = void function(TextTag tag, TextTagTable textTagTable);

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
      auto textTagTable = getVal!TextTagTable(_paramVals);
      auto tag = getVal!TextTag(&_paramVals[1]);
      _dClosure.dlg(tag, textTagTable);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("tag-added", closure, after);
  }

  /**
   * Emitted every time a tag in the `GtkTextTagTable` changes.
   * Params
   *   tag = the changed tag.
   *   sizeChanged = whether the change affects the `GtkTextView` layout.
   *   textTagTable = the instance the signal is connected to
   */
  alias TagChangedCallbackDlg = void delegate(TextTag tag, bool sizeChanged, TextTagTable textTagTable);
  alias TagChangedCallbackFunc = void function(TextTag tag, bool sizeChanged, TextTagTable textTagTable);

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
      auto textTagTable = getVal!TextTagTable(_paramVals);
      auto tag = getVal!TextTag(&_paramVals[1]);
      auto sizeChanged = getVal!bool(&_paramVals[2]);
      _dClosure.dlg(tag, sizeChanged, textTagTable);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("tag-changed", closure, after);
  }

  /**
   * Emitted every time a tag is removed from the `GtkTextTagTable`.
   * The tag is still valid by the time the signal is emitted, but
   * it is not associated with a tag table any more.
   * Params
   *   tag = the removed tag.
   *   textTagTable = the instance the signal is connected to
   */
  alias TagRemovedCallbackDlg = void delegate(TextTag tag, TextTagTable textTagTable);
  alias TagRemovedCallbackFunc = void function(TextTag tag, TextTagTable textTagTable);

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
      auto textTagTable = getVal!TextTagTable(_paramVals);
      auto tag = getVal!TextTag(&_paramVals[1]);
      _dClosure.dlg(tag, textTagTable);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("tag-removed", closure, after);
  }
}
