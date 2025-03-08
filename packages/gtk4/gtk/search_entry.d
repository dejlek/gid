module gtk.search_entry;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.editable;
import gtk.editable_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.search_entry.SearchEntry] is an entry widget that has been tailored for use
  as a search entry.
  
  The main API for interacting with a [gtk.search_entry.SearchEntry] as entry
  is the [gtk.editable.Editable] interface.
  
  ![An example GtkSearchEntry](search-entry.png)
  
  It will show an inactive symbolic “find” icon when the search
  entry is empty, and a symbolic “clear” icon when there is text.
  Clicking on the “clear” icon will empty the search entry.
  
  To make filtering appear more reactive, it is a good idea to
  not react to every change in the entry text immediately, but
  only after a short delay. To support this, [gtk.search_entry.SearchEntry]
  emits the `signal@Gtk.SearchEntry::search-changed` signal which
  can be used instead of the [gtk.editable.Editable.changed] signal.
  
  The `signal@Gtk.SearchEntry::previous-match`,
  `signal@Gtk.SearchEntry::next-match` and
  `signal@Gtk.SearchEntry::stop-search` signals can be used to
  implement moving between search results and ending the search.
  
  Often, [gtk.search_entry.SearchEntry] will be fed events by means of being
  placed inside a [gtk.search_bar.SearchBar]. If that is not the case,
  you can use [gtk.search_entry.SearchEntry.setKeyCaptureWidget] to
  let it capture key input from another widget.
  
  [gtk.search_entry.SearchEntry] provides only minimal API and should be used with
  the [gtk.editable.Editable] API.
  
  ## CSS Nodes
  
  ```
  entry.search
  ╰── text
  ```
  
  [gtk.search_entry.SearchEntry] has a single CSS node with name entry that carries
  a `.search` style class, and the text node is a child of that.
  
  ## Accessibility
  
  [gtk.search_entry.SearchEntry] uses the [gtk.types.AccessibleRole.SearchBox] role.
*/
class SearchEntry : gtk.widget.Widget, gtk.editable.Editable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_search_entry_get_type != &gidSymbolNotFound ? gtk_search_entry_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin EditableT!();

  /**
      Creates a [gtk.search_entry.SearchEntry].
    Returns:     a new [gtk.search_entry.SearchEntry]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_search_entry_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the input purpose for entry.
    Returns:     The input hints
  */
  gtk.types.InputHints getInputHints()
  {
    GtkInputHints _cretval;
    _cretval = gtk_search_entry_get_input_hints(cast(GtkSearchEntry*)cPtr);
    gtk.types.InputHints _retval = cast(gtk.types.InputHints)_cretval;
    return _retval;
  }

  /**
      Gets the input purpose of entry.
    Returns:     The input hints
  */
  gtk.types.InputPurpose getInputPurpose()
  {
    GtkInputPurpose _cretval;
    _cretval = gtk_search_entry_get_input_purpose(cast(GtkSearchEntry*)cPtr);
    gtk.types.InputPurpose _retval = cast(gtk.types.InputPurpose)_cretval;
    return _retval;
  }

  /**
      Gets the widget that entry is capturing key events from.
    Returns:     The key capture widget.
  */
  gtk.widget.Widget getKeyCaptureWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_search_entry_get_key_capture_widget(cast(GtkSearchEntry*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the placeholder text associated with entry.
    Returns:     The placeholder text.
  */
  string getPlaceholderText()
  {
    const(char)* _cretval;
    _cretval = gtk_search_entry_get_placeholder_text(cast(GtkSearchEntry*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the delay to be used between the last keypress and the
    `signalGtk.SearchEntry::search-changed` signal being emitted.
    Returns:     a delay in milliseconds.
  */
  uint getSearchDelay()
  {
    uint _retval;
    _retval = gtk_search_entry_get_search_delay(cast(GtkSearchEntry*)cPtr);
    return _retval;
  }

  /**
      Sets the input hints for entry.
    Params:
      hints =       the new input hints
  */
  void setInputHints(gtk.types.InputHints hints)
  {
    gtk_search_entry_set_input_hints(cast(GtkSearchEntry*)cPtr, hints);
  }

  /**
      Sets the input purpose of entry.
    Params:
      purpose =       the new input purpose
  */
  void setInputPurpose(gtk.types.InputPurpose purpose)
  {
    gtk_search_entry_set_input_purpose(cast(GtkSearchEntry*)cPtr, purpose);
  }

  /**
      Sets widget as the widget that entry will capture key
    events from.
    
    Key events are consumed by the search entry to start or
    continue a search.
    
    If the entry is part of a [gtk.search_bar.SearchBar], it is preferable
    to call [gtk.search_bar.SearchBar.setKeyCaptureWidget] instead,
    which will reveal the entry in addition to triggering the
    search entry.
    
    Note that despite the name of this function, the events
    are only 'captured' in the bubble phase, which means that
    editable child widgets of widget will receive text input
    before it gets captured. If that is not desired, you can
    capture and forward the events yourself with
    [gtk.event_controller_key.EventControllerKey.forward].
    Params:
      widget =       a [gtk.widget.Widget]
  */
  void setKeyCaptureWidget(gtk.widget.Widget widget = null)
  {
    gtk_search_entry_set_key_capture_widget(cast(GtkSearchEntry*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
  }

  /**
      Sets the placeholder text associated with entry.
    Params:
      text =       the text to set as a placeholder
  */
  void setPlaceholderText(string text = null)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_search_entry_set_placeholder_text(cast(GtkSearchEntry*)cPtr, _text);
  }

  /**
      Set the delay to be used between the last keypress and the
    `signalGtk.SearchEntry::search-changed` signal being emitted.
    Params:
      delay =       a delay in milliseconds
  */
  void setSearchDelay(uint delay)
  {
    gtk_search_entry_set_search_delay(cast(GtkSearchEntry*)cPtr, delay);
  }

  /**
      Emitted when the entry is activated.
    
    The keybindings for this signal are all forms of the Enter key.
  
    ## Parameters
    $(LIST
      * $(B searchEntry) the instance the signal is connected to
    )
  */
  alias ActivateCallbackDlg = void delegate(gtk.search_entry.SearchEntry searchEntry);

  /** ditto */
  alias ActivateCallbackFunc = void function(gtk.search_entry.SearchEntry searchEntry);

  /**
    Connect to Activate signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateCallbackDlg) || is(T : ActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto searchEntry = getVal!(gtk.search_entry.SearchEntry)(_paramVals);
      _dClosure.dlg(searchEntry);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Emitted when the user initiates a move to the next match
    for the current search string.
    
    This is a [keybinding signal](class.SignalAction.html).
    
    Applications should connect to it, to implement moving
    between matches.
    
    The default bindings for this signal is Ctrl-g.
  
    ## Parameters
    $(LIST
      * $(B searchEntry) the instance the signal is connected to
    )
  */
  alias NextMatchCallbackDlg = void delegate(gtk.search_entry.SearchEntry searchEntry);

  /** ditto */
  alias NextMatchCallbackFunc = void function(gtk.search_entry.SearchEntry searchEntry);

  /**
    Connect to NextMatch signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectNextMatch(T)(T callback, Flag!"After" after = No.After)
  if (is(T : NextMatchCallbackDlg) || is(T : NextMatchCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto searchEntry = getVal!(gtk.search_entry.SearchEntry)(_paramVals);
      _dClosure.dlg(searchEntry);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("next-match", closure, after);
  }

  /**
      Emitted when the user initiates a move to the previous match
    for the current search string.
    
    This is a [keybinding signal](class.SignalAction.html).
    
    Applications should connect to it, to implement moving
    between matches.
    
    The default bindings for this signal is Ctrl-Shift-g.
  
    ## Parameters
    $(LIST
      * $(B searchEntry) the instance the signal is connected to
    )
  */
  alias PreviousMatchCallbackDlg = void delegate(gtk.search_entry.SearchEntry searchEntry);

  /** ditto */
  alias PreviousMatchCallbackFunc = void function(gtk.search_entry.SearchEntry searchEntry);

  /**
    Connect to PreviousMatch signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectPreviousMatch(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PreviousMatchCallbackDlg) || is(T : PreviousMatchCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto searchEntry = getVal!(gtk.search_entry.SearchEntry)(_paramVals);
      _dClosure.dlg(searchEntry);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("previous-match", closure, after);
  }

  /**
      Emitted with a delay. The length of the delay can be
    changed with the `propertyGtk.SearchEntry:search-delay`
    property.
  
    ## Parameters
    $(LIST
      * $(B searchEntry) the instance the signal is connected to
    )
  */
  alias SearchChangedCallbackDlg = void delegate(gtk.search_entry.SearchEntry searchEntry);

  /** ditto */
  alias SearchChangedCallbackFunc = void function(gtk.search_entry.SearchEntry searchEntry);

  /**
    Connect to SearchChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectSearchChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SearchChangedCallbackDlg) || is(T : SearchChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto searchEntry = getVal!(gtk.search_entry.SearchEntry)(_paramVals);
      _dClosure.dlg(searchEntry);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("search-changed", closure, after);
  }

  /**
      Emitted when the user initiated a search on the entry.
  
    ## Parameters
    $(LIST
      * $(B searchEntry) the instance the signal is connected to
    )
  */
  alias SearchStartedCallbackDlg = void delegate(gtk.search_entry.SearchEntry searchEntry);

  /** ditto */
  alias SearchStartedCallbackFunc = void function(gtk.search_entry.SearchEntry searchEntry);

  /**
    Connect to SearchStarted signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectSearchStarted(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SearchStartedCallbackDlg) || is(T : SearchStartedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto searchEntry = getVal!(gtk.search_entry.SearchEntry)(_paramVals);
      _dClosure.dlg(searchEntry);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("search-started", closure, after);
  }

  /**
      Emitted when the user stops a search via keyboard input.
    
    This is a [keybinding signal](class.SignalAction.html).
    
    Applications should connect to it, to implement hiding
    the search entry in this case.
    
    The default bindings for this signal is Escape.
  
    ## Parameters
    $(LIST
      * $(B searchEntry) the instance the signal is connected to
    )
  */
  alias StopSearchCallbackDlg = void delegate(gtk.search_entry.SearchEntry searchEntry);

  /** ditto */
  alias StopSearchCallbackFunc = void function(gtk.search_entry.SearchEntry searchEntry);

  /**
    Connect to StopSearch signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectStopSearch(T)(T callback, Flag!"After" after = No.After)
  if (is(T : StopSearchCallbackDlg) || is(T : StopSearchCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto searchEntry = getVal!(gtk.search_entry.SearchEntry)(_paramVals);
      _dClosure.dlg(searchEntry);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("stop-search", closure, after);
  }
}
