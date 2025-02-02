module Gtk.FileChooserWidget;

import GObject.DClosure;
import Gid.gid;
import Gtk.Accessible;
import Gtk.AccessibleT;
import Gtk.Buildable;
import Gtk.BuildableT;
import Gtk.ConstraintTarget;
import Gtk.ConstraintTargetT;
import Gtk.FileChooser;
import Gtk.FileChooserT;
import Gtk.Types;
import Gtk.Widget;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkFileChooserWidget` is a widget for choosing files.
 * It exposes the [Gtk.FileChooser] interface, and you should
 * use the methods of this interface to interact with the
 * widget.
 * # CSS nodes
 * `GtkFileChooserWidget` has a single CSS node with name filechooser.

 * Deprecated: Direct use of `GtkFileChooserWidget` is deprecated
 */
class FileChooserWidget : Widget, FileChooser
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gtk_file_chooser_widget_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin FileChooserT!();

  /**
   * Creates a new `GtkFileChooserWidget`.
   * This is a file chooser widget that can be embedded in custom
   * windows, and it is the same widget that is used by
   * `GtkFileChooserDialog`.
   * Params:
   *   action = Open or save mode for the widget
   * Returns: a new `GtkFileChooserWidget`

   * Deprecated: Direct use of `GtkFileChooserWidget` is deprecated
   */
  this(FileChooserAction action)
  {
    GtkWidget* _cretval;
    _cretval = gtk_file_chooser_widget_new(action);
    this(_cretval, No.Take);
  }

  /**
   * Emitted when the user asks for it.
   * This is a [keybinding signal](class.SignalAction.html).
   * This is used to make the file chooser show the user's Desktop
   * folder in the file list.
   * The default binding for this signal is <kbd>Alt</kbd>-<kbd>D</kbd>.
   *   fileChooserWidget = the instance the signal is connected to
   */
  alias DesktopFolderCallbackDlg = void delegate(FileChooserWidget fileChooserWidget);
  alias DesktopFolderCallbackFunc = void function(FileChooserWidget fileChooserWidget);

  /**
   * Connect to DesktopFolder signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectDesktopFolder(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DesktopFolderCallbackDlg) || is(T : DesktopFolderCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!FileChooserWidget(_paramVals);
      _dClosure.dlg(fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("desktop-folder", closure, after);
  }

  /**
   * Emitted when the user asks for it.
   * This is a [keybinding signal](class.SignalAction.html).
   * This is used to make the file chooser go to a child of the
   * current folder in the file hierarchy. The subfolder that will
   * be used is displayed in the path bar widget of the file chooser.
   * For example, if the path bar is showing "/foo/bar/baz", with bar
   * currently displayed, then this will cause the file chooser to
   * switch to the "baz" subfolder.
   * The default binding for this signal is <kbd>Alt</kbd>-<kbd>Down</kbd>.
   *   fileChooserWidget = the instance the signal is connected to
   */
  alias DownFolderCallbackDlg = void delegate(FileChooserWidget fileChooserWidget);
  alias DownFolderCallbackFunc = void function(FileChooserWidget fileChooserWidget);

  /**
   * Connect to DownFolder signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectDownFolder(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DownFolderCallbackDlg) || is(T : DownFolderCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!FileChooserWidget(_paramVals);
      _dClosure.dlg(fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("down-folder", closure, after);
  }

  /**
   * Emitted when the user asks for it.
   * This is a [keybinding signal](class.SignalAction.html).
   * This is used to make the file chooser show the user's home
   * folder in the file list.
   * The default binding for this signal is <kbd>Alt</kbd>-<kbd>Home</kbd>.
   *   fileChooserWidget = the instance the signal is connected to
   */
  alias HomeFolderCallbackDlg = void delegate(FileChooserWidget fileChooserWidget);
  alias HomeFolderCallbackFunc = void function(FileChooserWidget fileChooserWidget);

  /**
   * Connect to HomeFolder signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectHomeFolder(T)(T callback, Flag!"After" after = No.After)
  if (is(T : HomeFolderCallbackDlg) || is(T : HomeFolderCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!FileChooserWidget(_paramVals);
      _dClosure.dlg(fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("home-folder", closure, after);
  }

  /**
   * Emitted when the user asks for it.
   * This is a [keybinding signal](class.SignalAction.html).
   * This is used to make the file chooser show a "Location" prompt which
   * the user can use to manually type the name of the file he wishes to select.
   * The default bindings for this signal are <kbd>Control</kbd>-<kbd>L</kbd>
   * with a path string of "" $(LPAREN)the empty string$(RPAREN). It is also bound to
   * <kbd>/</kbd> with a path string of "`/`" $(LPAREN)a slash$(RPAREN):  this lets you
   * type `/` and immediately type a path name. On Unix systems, this is
   * bound to <kbd>~</kbd> $(LPAREN)tilde$(RPAREN) with a path string of "~" itself for
   * access to home directories.
   * Params
   *   path = a string that gets put in the text entry for the file name
   *   fileChooserWidget = the instance the signal is connected to
   */
  alias LocationPopupCallbackDlg = void delegate(string path, FileChooserWidget fileChooserWidget);
  alias LocationPopupCallbackFunc = void function(string path, FileChooserWidget fileChooserWidget);

  /**
   * Connect to LocationPopup signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectLocationPopup(T)(T callback, Flag!"After" after = No.After)
  if (is(T : LocationPopupCallbackDlg) || is(T : LocationPopupCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!FileChooserWidget(_paramVals);
      auto path = getVal!string(&_paramVals[1]);
      _dClosure.dlg(path, fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("location-popup", closure, after);
  }

  /**
   * Emitted when the user asks for it.
   * This is a [keybinding signal](class.SignalAction.html).
   * This is used to make the file chooser show a "Location" prompt
   * when the user pastes into a `GtkFileChooserWidget`.
   * The default binding for this signal is <kbd>Control</kbd>-<kbd>V</kbd>.
   *   fileChooserWidget = the instance the signal is connected to
   */
  alias LocationPopupOnPasteCallbackDlg = void delegate(FileChooserWidget fileChooserWidget);
  alias LocationPopupOnPasteCallbackFunc = void function(FileChooserWidget fileChooserWidget);

  /**
   * Connect to LocationPopupOnPaste signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectLocationPopupOnPaste(T)(T callback, Flag!"After" after = No.After)
  if (is(T : LocationPopupOnPasteCallbackDlg) || is(T : LocationPopupOnPasteCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!FileChooserWidget(_paramVals);
      _dClosure.dlg(fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("location-popup-on-paste", closure, after);
  }

  /**
   * Emitted when the user asks for it.
   * This is a [keybinding signal](class.SignalAction.html).
   * This is used to toggle the visibility of a "Location" prompt
   * which the user can use to manually type the name of the file
   * he wishes to select.
   * The default binding for this signal is <kbd>Control</kbd>-<kbd>L</kbd>.
   *   fileChooserWidget = the instance the signal is connected to
   */
  alias LocationTogglePopupCallbackDlg = void delegate(FileChooserWidget fileChooserWidget);
  alias LocationTogglePopupCallbackFunc = void function(FileChooserWidget fileChooserWidget);

  /**
   * Connect to LocationTogglePopup signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectLocationTogglePopup(T)(T callback, Flag!"After" after = No.After)
  if (is(T : LocationTogglePopupCallbackDlg) || is(T : LocationTogglePopupCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!FileChooserWidget(_paramVals);
      _dClosure.dlg(fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("location-toggle-popup", closure, after);
  }

  /**
   * Emitted when the user asks for it.
   * This is a [keybinding signal](class.SignalAction.html).
   * This is used to move the focus to the places sidebar.
   * The default binding for this signal is <kbd>Alt</kbd>-<kbd>P</kbd>.
   *   fileChooserWidget = the instance the signal is connected to
   */
  alias PlacesShortcutCallbackDlg = void delegate(FileChooserWidget fileChooserWidget);
  alias PlacesShortcutCallbackFunc = void function(FileChooserWidget fileChooserWidget);

  /**
   * Connect to PlacesShortcut signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectPlacesShortcut(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PlacesShortcutCallbackDlg) || is(T : PlacesShortcutCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!FileChooserWidget(_paramVals);
      _dClosure.dlg(fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("places-shortcut", closure, after);
  }

  /**
   * Emitted when the user asks for it.
   * This is a [keybinding signal](class.SignalAction.html).
   * This is used to make the file chooser switch to the bookmark
   * specified in the bookmark_index parameter. For example, if
   * you have three bookmarks, you can pass 0, 1, 2 to this signal
   * to switch to each of them, respectively.
   * The default binding for this signal is <kbd>Alt</kbd>-<kbd>1</kbd>,
   * <kbd>Alt</kbd>-<kbd>2</kbd>, etc. until <kbd>Alt</kbd>-<kbd>0</kbd>.
   * Note that in the default binding, that <kbd>Alt</kbd>-<kbd>1</kbd> is
   * actually defined to switch to the bookmark at index 0, and so on
   * successively.
   * Params
   *   bookmarkIndex = the number of the bookmark to switch to
   *   fileChooserWidget = the instance the signal is connected to
   */
  alias QuickBookmarkCallbackDlg = void delegate(int bookmarkIndex, FileChooserWidget fileChooserWidget);
  alias QuickBookmarkCallbackFunc = void function(int bookmarkIndex, FileChooserWidget fileChooserWidget);

  /**
   * Connect to QuickBookmark signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectQuickBookmark(T)(T callback, Flag!"After" after = No.After)
  if (is(T : QuickBookmarkCallbackDlg) || is(T : QuickBookmarkCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!FileChooserWidget(_paramVals);
      auto bookmarkIndex = getVal!int(&_paramVals[1]);
      _dClosure.dlg(bookmarkIndex, fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("quick-bookmark", closure, after);
  }

  /**
   * Emitted when the user asks for it.
   * This is a [keybinding signal](class.SignalAction.html).
   * This is used to make the file chooser show the Recent location.
   * The default binding for this signal is <kbd>Alt</kbd>-<kbd>R</kbd>.
   *   fileChooserWidget = the instance the signal is connected to
   */
  alias RecentShortcutCallbackDlg = void delegate(FileChooserWidget fileChooserWidget);
  alias RecentShortcutCallbackFunc = void function(FileChooserWidget fileChooserWidget);

  /**
   * Connect to RecentShortcut signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectRecentShortcut(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RecentShortcutCallbackDlg) || is(T : RecentShortcutCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!FileChooserWidget(_paramVals);
      _dClosure.dlg(fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("recent-shortcut", closure, after);
  }

  /**
   * Emitted when the user asks for it.
   * This is a [keybinding signal](class.SignalAction.html).
   * This is used to make the file chooser show the search entry.
   * The default binding for this signal is <kbd>Alt</kbd>-<kbd>S</kbd>.
   *   fileChooserWidget = the instance the signal is connected to
   */
  alias SearchShortcutCallbackDlg = void delegate(FileChooserWidget fileChooserWidget);
  alias SearchShortcutCallbackFunc = void function(FileChooserWidget fileChooserWidget);

  /**
   * Connect to SearchShortcut signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectSearchShortcut(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SearchShortcutCallbackDlg) || is(T : SearchShortcutCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!FileChooserWidget(_paramVals);
      _dClosure.dlg(fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("search-shortcut", closure, after);
  }

  /**
   * Emitted when the user asks for it.
   * This is a [keybinding signal](class.SignalAction.html).
   * This is used to make the file chooser display hidden files.
   * The default binding for this signal is <kbd>Control</kbd>-<kbd>H</kbd>.
   *   fileChooserWidget = the instance the signal is connected to
   */
  alias ShowHiddenCallbackDlg = void delegate(FileChooserWidget fileChooserWidget);
  alias ShowHiddenCallbackFunc = void function(FileChooserWidget fileChooserWidget);

  /**
   * Connect to ShowHidden signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectShowHidden(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ShowHiddenCallbackDlg) || is(T : ShowHiddenCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!FileChooserWidget(_paramVals);
      _dClosure.dlg(fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show-hidden", closure, after);
  }

  /**
   * Emitted when the user asks for it.
   * This is a [keybinding signal](class.SignalAction.html).
   * This is used to make the file chooser go to the parent
   * of the current folder in the file hierarchy.
   * The default binding for this signal is <kbd>Alt</kbd>-<kbd>Up</kbd>.
   *   fileChooserWidget = the instance the signal is connected to
   */
  alias UpFolderCallbackDlg = void delegate(FileChooserWidget fileChooserWidget);
  alias UpFolderCallbackFunc = void function(FileChooserWidget fileChooserWidget);

  /**
   * Connect to UpFolder signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectUpFolder(T)(T callback, Flag!"After" after = No.After)
  if (is(T : UpFolderCallbackDlg) || is(T : UpFolderCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!FileChooserWidget(_paramVals);
      _dClosure.dlg(fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("up-folder", closure, after);
  }
}
