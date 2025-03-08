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
    The collection of tags in a [gtk.text_buffer.TextBuffer]
  
  You may wish to begin by reading the
  [text widget conceptual overview](section-text-widget.html),
  which gives an overview of all the objects and data types
  related to the text widget and how they work together.
  
  # GtkTextTagTables as GtkBuildable
  
  The [gtk.text_tag_table.TextTagTable] implementation of the [gtk.buildable.Buildable] interface
  supports adding tags by specifying “tag” as the “type” attribute
  of a `<child>` element.
  
  An example of a UI definition fragment specifying tags:
  ```xml
  <object class="GtkTextTagTable">
   <child type="tag">
     <object class="GtkTextTag"/>
   </child>
  </object>
  ```
*/
class TextTagTable : gobject.object.ObjectG, gtk.buildable.Buildable
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_text_tag_table_get_type != &gidSymbolNotFound ? gtk_text_tag_table_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin BuildableT!();

  /**
      Creates a new [gtk.text_tag_table.TextTagTable].
    
    The table contains no tags by default.
    Returns:     a new [gtk.text_tag_table.TextTagTable]
  */
  this()
  {
    GtkTextTagTable* _cretval;
    _cretval = gtk_text_tag_table_new();
    this(_cretval, Yes.take);
  }

  /**
      Add a tag to the table.
    
    The tag is assigned the highest priority in the table.
    
    tag must not be in a tag table already, and may not have
    the same name as an already-added tag.
    Params:
      tag =       a [gtk.text_tag.TextTag]
    Returns:     true on success.
  */
  bool add(gtk.text_tag.TextTag tag)
  {
    bool _retval;
    _retval = gtk_text_tag_table_add(cast(GtkTextTagTable*)cPtr, tag ? cast(GtkTextTag*)tag.cPtr(No.dup) : null);
    return _retval;
  }

  /**
      Calls func on each tag in table, with user data data.
    
    Note that the table may not be modified while iterating
    over it (you can’t add/remove tags).
    Params:
      func =       a function to call on each tag
  */
  void foreach_(gtk.types.TextTagTableForeach func)
  {
    extern(C) void _funcCallback(GtkTextTag* tag, void* data)
    {
      auto _dlg = cast(gtk.types.TextTagTableForeach*)data;

      (*_dlg)(ObjectG.getDObject!(gtk.text_tag.TextTag)(cast(void*)tag, No.take));
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? cast(void*)&(func) : null;
    gtk_text_tag_table_foreach(cast(GtkTextTagTable*)cPtr, _funcCB, _func);
  }

  /**
      Returns the size of the table (number of tags)
    Returns:     number of tags in table
  */
  int getSize()
  {
    int _retval;
    _retval = gtk_text_tag_table_get_size(cast(GtkTextTagTable*)cPtr);
    return _retval;
  }

  /**
      Look up a named tag.
    Params:
      name =       name of a tag
    Returns:     The tag
  */
  gtk.text_tag.TextTag lookup(string name)
  {
    GtkTextTag* _cretval;
    const(char)* _name = name.toCString(No.alloc);
    _cretval = gtk_text_tag_table_lookup(cast(GtkTextTagTable*)cPtr, _name);
    auto _retval = ObjectG.getDObject!(gtk.text_tag.TextTag)(cast(GtkTextTag*)_cretval, No.take);
    return _retval;
  }

  /**
      Remove a tag from the table.
    
    If a [gtk.text_buffer.TextBuffer] has table as its tag table, the tag is
    removed from the buffer. The table’s reference to the tag is
    removed, so the tag will end up destroyed if you don’t have
    a reference to it.
    Params:
      tag =       a [gtk.text_tag.TextTag]
  */
  void remove(gtk.text_tag.TextTag tag)
  {
    gtk_text_tag_table_remove(cast(GtkTextTagTable*)cPtr, tag ? cast(GtkTextTag*)tag.cPtr(No.dup) : null);
  }

  /**
      Emitted every time a new tag is added in the [gtk.text_tag_table.TextTagTable].
  
    ## Parameters
    $(LIST
      * $(B tag)       the added tag.
      * $(B textTagTable) the instance the signal is connected to
    )
  */
  alias TagAddedCallbackDlg = void delegate(gtk.text_tag.TextTag tag, gtk.text_tag_table.TextTagTable textTagTable);

  /** ditto */
  alias TagAddedCallbackFunc = void function(gtk.text_tag.TextTag tag, gtk.text_tag_table.TextTagTable textTagTable);

  /**
    Connect to TagAdded signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectTagAdded(T)(T callback, Flag!"after" after = No.after)
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

  /**
      Emitted every time a tag in the [gtk.text_tag_table.TextTagTable] changes.
  
    ## Parameters
    $(LIST
      * $(B tag)       the changed tag.
      * $(B sizeChanged)       whether the change affects the [gtk.text_view.TextView] layout.
      * $(B textTagTable) the instance the signal is connected to
    )
  */
  alias TagChangedCallbackDlg = void delegate(gtk.text_tag.TextTag tag, bool sizeChanged, gtk.text_tag_table.TextTagTable textTagTable);

  /** ditto */
  alias TagChangedCallbackFunc = void function(gtk.text_tag.TextTag tag, bool sizeChanged, gtk.text_tag_table.TextTagTable textTagTable);

  /**
    Connect to TagChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectTagChanged(T)(T callback, Flag!"after" after = No.after)
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

  /**
      Emitted every time a tag is removed from the [gtk.text_tag_table.TextTagTable].
    
    The tag is still valid by the time the signal is emitted, but
    it is not associated with a tag table any more.
  
    ## Parameters
    $(LIST
      * $(B tag)       the removed tag.
      * $(B textTagTable) the instance the signal is connected to
    )
  */
  alias TagRemovedCallbackDlg = void delegate(gtk.text_tag.TextTag tag, gtk.text_tag_table.TextTagTable textTagTable);

  /** ditto */
  alias TagRemovedCallbackFunc = void function(gtk.text_tag.TextTag tag, gtk.text_tag_table.TextTagTable textTagTable);

  /**
    Connect to TagRemoved signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectTagRemoved(T)(T callback, Flag!"after" after = No.after)
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
