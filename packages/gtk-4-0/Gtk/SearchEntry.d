module Gtk.SearchEntry;

import GObject.DClosure;
import GObject.ObjectG;
import Gid.gid;
import Gtk.Accessible;
import Gtk.AccessibleT;
import Gtk.Buildable;
import Gtk.BuildableT;
import Gtk.ConstraintTarget;
import Gtk.ConstraintTargetT;
import Gtk.Editable;
import Gtk.EditableT;
import Gtk.Types;
import Gtk.Widget;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkSearchEntry` is an entry widget that has been tailored for use
 * as a search entry.
 * The main API for interacting with a `GtkSearchEntry` as entry
 * is the `GtkEditable` interface.
 * ![An example GtkSearchEntry](search-entry.png)
 * It will show an inactive symbolic “find” icon when the search
 * entry is empty, and a symbolic “clear” icon when there is text.
 * Clicking on the “clear” icon will empty the search entry.
 * To make filtering appear more reactive, it is a good idea to
 * not react to every change in the entry text immediately, but
 * only after a short delay. To support this, `GtkSearchEntry`
 * emits the signal@Gtk.SearchEntry::search-changed signal which
 * can be used instead of the [Gtk.Editable.changed] signal.
 * The signal@Gtk.SearchEntry::previous-match,
 * signal@Gtk.SearchEntry::next-match and
 * signal@Gtk.SearchEntry::stop-search signals can be used to
 * implement moving between search results and ending the search.
 * Often, `GtkSearchEntry` will be fed events by means of being
 * placed inside a [Gtk.SearchBar]. If that is not the case,
 * you can use [Gtk.SearchEntry.setKeyCaptureWidget] to
 * let it capture key input from another widget.
 * `GtkSearchEntry` provides only minimal API and should be used with
 * the [Gtk.Editable] API.
 * ## CSS Nodes
 * ```
 * entry.search
 * ╰── text
 * ```
 * `GtkSearchEntry` has a single CSS node with name entry that carries
 * a `.search` style class, and the text node is a child of that.
 * ## Accessibility
 * `GtkSearchEntry` uses the %GTK_ACCESSIBLE_ROLE_SEARCH_BOX role.
 */
class SearchEntry : Widget, Editable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gtk_search_entry_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin EditableT!();

  /**
   * Creates a `GtkSearchEntry`.
   * Returns: a new `GtkSearchEntry`
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_search_entry_new();
    this(_cretval, No.Take);
  }

  /**
   * Gets the input purpose for entry.
   * Returns: The input hints
   */
  InputHints getInputHints()
  {
    GtkInputHints _cretval;
    _cretval = gtk_search_entry_get_input_hints(cast(GtkSearchEntry*)cPtr);
    InputHints _retval = cast(InputHints)_cretval;
    return _retval;
  }

  /**
   * Gets the input purpose of entry.
   * Returns: The input hints
   */
  InputPurpose getInputPurpose()
  {
    GtkInputPurpose _cretval;
    _cretval = gtk_search_entry_get_input_purpose(cast(GtkSearchEntry*)cPtr);
    InputPurpose _retval = cast(InputPurpose)_cretval;
    return _retval;
  }

  /**
   * Gets the widget that entry is capturing key events from.
   * Returns: The key capture widget.
   */
  Widget getKeyCaptureWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_search_entry_get_key_capture_widget(cast(GtkSearchEntry*)cPtr);
    auto _retval = ObjectG.getDObject!Widget(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the placeholder text associated with entry.
   * Returns: The placeholder text.
   */
  string getPlaceholderText()
  {
    const(char)* _cretval;
    _cretval = gtk_search_entry_get_placeholder_text(cast(GtkSearchEntry*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Get the delay to be used between the last keypress and the
   * signalGtk.SearchEntry::search-changed signal being emitted.
   * Returns: a delay in milliseconds.
   */
  uint getSearchDelay()
  {
    uint _retval;
    _retval = gtk_search_entry_get_search_delay(cast(GtkSearchEntry*)cPtr);
    return _retval;
  }

  /**
   * Sets the input hints for entry.
   * Params:
   *   hints = the new input hints
   */
  void setInputHints(InputHints hints)
  {
    gtk_search_entry_set_input_hints(cast(GtkSearchEntry*)cPtr, hints);
  }

  /**
   * Sets the input purpose of entry.
   * Params:
   *   purpose = the new input purpose
   */
  void setInputPurpose(InputPurpose purpose)
  {
    gtk_search_entry_set_input_purpose(cast(GtkSearchEntry*)cPtr, purpose);
  }

  /**
   * Sets widget as the widget that entry will capture key
   * events from.
   * Key events are consumed by the search entry to start or
   * continue a search.
   * If the entry is part of a `GtkSearchBar`, it is preferable
   * to call [Gtk.SearchBar.setKeyCaptureWidget] instead,
   * which will reveal the entry in addition to triggering the
   * search entry.
   * Note that despite the name of this function, the events
   * are only 'captured' in the bubble phase, which means that
   * editable child widgets of widget will receive text input
   * before it gets captured. If that is not desired, you can
   * capture and forward the events yourself with
   * [Gtk.EventControllerKey.forward].
   * Params:
   *   widget = a `GtkWidget`
   */
  void setKeyCaptureWidget(Widget widget)
  {
    gtk_search_entry_set_key_capture_widget(cast(GtkSearchEntry*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
  }

  /**
   * Sets the placeholder text associated with entry.
   * Params:
   *   text = the text to set as a placeholder
   */
  void setPlaceholderText(string text)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_search_entry_set_placeholder_text(cast(GtkSearchEntry*)cPtr, _text);
  }

  /**
   * Set the delay to be used between the last keypress and the
   * signalGtk.SearchEntry::search-changed signal being emitted.
   * Params:
   *   delay = a delay in milliseconds
   */
  void setSearchDelay(uint delay)
  {
    gtk_search_entry_set_search_delay(cast(GtkSearchEntry*)cPtr, delay);
  }

  /**
   * Emitted when the entry is activated.
   * The keybindings for this signal are all forms of the Enter key.
   *   searchEntry = the instance the signal is connected to
   */
  alias ActivateCallbackDlg = void delegate(SearchEntry searchEntry);
  alias ActivateCallbackFunc = void function(SearchEntry searchEntry);

  /**
   * Connect to Activate signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (is(T == ActivateCallbackDlg) || is(T == ActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto searchEntry = getVal!SearchEntry(_paramVals);
      _dClosure.dlg(searchEntry);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
   * Emitted when the user initiates a move to the next match
   * for the current search string.
   * This is a [keybinding signal](class.SignalAction.html).
   * Applications should connect to it, to implement moving
   * between matches.
   * The default bindings for this signal is Ctrl-g.
   *   searchEntry = the instance the signal is connected to
   */
  alias NextMatchCallbackDlg = void delegate(SearchEntry searchEntry);
  alias NextMatchCallbackFunc = void function(SearchEntry searchEntry);

  /**
   * Connect to NextMatch signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectNextMatch(T)(T callback, Flag!"After" after = No.After)
  if (is(T == NextMatchCallbackDlg) || is(T == NextMatchCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto searchEntry = getVal!SearchEntry(_paramVals);
      _dClosure.dlg(searchEntry);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("next-match", closure, after);
  }

  /**
   * Emitted when the user initiates a move to the previous match
   * for the current search string.
   * This is a [keybinding signal](class.SignalAction.html).
   * Applications should connect to it, to implement moving
   * between matches.
   * The default bindings for this signal is Ctrl-Shift-g.
   *   searchEntry = the instance the signal is connected to
   */
  alias PreviousMatchCallbackDlg = void delegate(SearchEntry searchEntry);
  alias PreviousMatchCallbackFunc = void function(SearchEntry searchEntry);

  /**
   * Connect to PreviousMatch signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectPreviousMatch(T)(T callback, Flag!"After" after = No.After)
  if (is(T == PreviousMatchCallbackDlg) || is(T == PreviousMatchCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto searchEntry = getVal!SearchEntry(_paramVals);
      _dClosure.dlg(searchEntry);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("previous-match", closure, after);
  }

  /**
   * Emitted with a delay. The length of the delay can be
   * changed with the propertyGtk.SearchEntry:search-delay
   * property.
   *   searchEntry = the instance the signal is connected to
   */
  alias SearchChangedCallbackDlg = void delegate(SearchEntry searchEntry);
  alias SearchChangedCallbackFunc = void function(SearchEntry searchEntry);

  /**
   * Connect to SearchChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectSearchChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T == SearchChangedCallbackDlg) || is(T == SearchChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto searchEntry = getVal!SearchEntry(_paramVals);
      _dClosure.dlg(searchEntry);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("search-changed", closure, after);
  }

  /**
   * Emitted when the user initiated a search on the entry.
   *   searchEntry = the instance the signal is connected to
   */
  alias SearchStartedCallbackDlg = void delegate(SearchEntry searchEntry);
  alias SearchStartedCallbackFunc = void function(SearchEntry searchEntry);

  /**
   * Connect to SearchStarted signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectSearchStarted(T)(T callback, Flag!"After" after = No.After)
  if (is(T == SearchStartedCallbackDlg) || is(T == SearchStartedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto searchEntry = getVal!SearchEntry(_paramVals);
      _dClosure.dlg(searchEntry);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("search-started", closure, after);
  }

  /**
   * Emitted when the user stops a search via keyboard input.
   * This is a [keybinding signal](class.SignalAction.html).
   * Applications should connect to it, to implement hiding
   * the search entry in this case.
   * The default bindings for this signal is Escape.
   *   searchEntry = the instance the signal is connected to
   */
  alias StopSearchCallbackDlg = void delegate(SearchEntry searchEntry);
  alias StopSearchCallbackFunc = void function(SearchEntry searchEntry);

  /**
   * Connect to StopSearch signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectStopSearch(T)(T callback, Flag!"After" after = No.After)
  if (is(T == StopSearchCallbackDlg) || is(T == StopSearchCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto searchEntry = getVal!SearchEntry(_paramVals);
      _dClosure.dlg(searchEntry);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("stop-search", closure, after);
  }
}
