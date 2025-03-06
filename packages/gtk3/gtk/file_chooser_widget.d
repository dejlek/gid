module gtk.file_chooser_widget;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.file_chooser;
import gtk.file_chooser_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;

/**
    #GtkFileChooserWidget is a widget for choosing files.
  It exposes the #GtkFileChooser interface, and you should
  use the methods of this interface to interact with the
  widget.
  
  # CSS nodes
  
  GtkFileChooserWidget has a single CSS node with name filechooser.
*/
class FileChooserWidget : gtk.box.Box, gtk.file_chooser.FileChooser
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_file_chooser_widget_get_type != &gidSymbolNotFound ? gtk_file_chooser_widget_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin FileChooserT!();

  /**
      Creates a new #GtkFileChooserWidget. This is a file chooser widget that can
    be embedded in custom windows, and it is the same widget that is used by
    #GtkFileChooserDialog.
    Params:
      action =       Open or save mode for the widget
    Returns:     a new #GtkFileChooserWidget
  */
  this(gtk.types.FileChooserAction action)
  {
    GtkWidget* _cretval;
    _cretval = gtk_file_chooser_widget_new(action);
    this(_cretval, No.Take);
  }

  /**
      The ::desktop-folder signal is a [keybinding signal][GtkBindingSignal]
    which gets emitted when the user asks for it.
    
    This is used to make the file chooser show the user's Desktop
    folder in the file list.
    
    The default binding for this signal is `Alt + D`.
  
    ## Parameters
    $(LIST
      * $(B fileChooserWidget) the instance the signal is connected to
    )
  */
  alias DesktopFolderCallbackDlg = void delegate(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /** ditto */
  alias DesktopFolderCallbackFunc = void function(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /**
    Connect to DesktopFolder signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDesktopFolder(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DesktopFolderCallbackDlg) || is(T : DesktopFolderCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!(gtk.file_chooser_widget.FileChooserWidget)(_paramVals);
      _dClosure.dlg(fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("desktop-folder", closure, after);
  }

  /**
      The ::down-folder signal is a [keybinding signal][GtkBindingSignal]
    which gets emitted when the user asks for it.
    
    This is used to make the file chooser go to a child of the current folder
    in the file hierarchy. The subfolder that will be used is displayed in the
    path bar widget of the file chooser. For example, if the path bar is showing
    "/foo/bar/baz", with bar currently displayed, then this will cause the file
    chooser to switch to the "baz" subfolder.
    
    The default binding for this signal is `Alt + Down`.
  
    ## Parameters
    $(LIST
      * $(B fileChooserWidget) the instance the signal is connected to
    )
  */
  alias DownFolderCallbackDlg = void delegate(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /** ditto */
  alias DownFolderCallbackFunc = void function(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /**
    Connect to DownFolder signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDownFolder(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DownFolderCallbackDlg) || is(T : DownFolderCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!(gtk.file_chooser_widget.FileChooserWidget)(_paramVals);
      _dClosure.dlg(fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("down-folder", closure, after);
  }

  /**
      The ::home-folder signal is a [keybinding signal][GtkBindingSignal]
    which gets emitted when the user asks for it.
    
    This is used to make the file chooser show the user's home
    folder in the file list.
    
    The default binding for this signal is `Alt + Home`.
  
    ## Parameters
    $(LIST
      * $(B fileChooserWidget) the instance the signal is connected to
    )
  */
  alias HomeFolderCallbackDlg = void delegate(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /** ditto */
  alias HomeFolderCallbackFunc = void function(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /**
    Connect to HomeFolder signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectHomeFolder(T)(T callback, Flag!"After" after = No.After)
  if (is(T : HomeFolderCallbackDlg) || is(T : HomeFolderCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!(gtk.file_chooser_widget.FileChooserWidget)(_paramVals);
      _dClosure.dlg(fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("home-folder", closure, after);
  }

  /**
      The ::location-popup signal is a [keybinding signal][GtkBindingSignal]
    which gets emitted when the user asks for it.
    
    This is used to make the file chooser show a "Location" prompt which
    the user can use to manually type the name of the file he wishes to select.
    
    The default bindings for this signal are `Control + L` with a path string
    of "" (the empty string).  It is also bound to `/` with a path string of
    "`/`" (a slash):  this lets you type `/` and immediately type a path name.
    On Unix systems, this is bound to `~` (tilde) with a path string of "~"
    itself for access to home directories.
  
    ## Parameters
    $(LIST
      * $(B path)       a string that gets put in the text entry for the file name
      * $(B fileChooserWidget) the instance the signal is connected to
    )
  */
  alias LocationPopupCallbackDlg = void delegate(string path, gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /** ditto */
  alias LocationPopupCallbackFunc = void function(string path, gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /**
    Connect to LocationPopup signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectLocationPopup(T)(T callback, Flag!"After" after = No.After)
  if (is(T : LocationPopupCallbackDlg) || is(T : LocationPopupCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!(gtk.file_chooser_widget.FileChooserWidget)(_paramVals);
      auto path = getVal!(string)(&_paramVals[1]);
      _dClosure.dlg(path, fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("location-popup", closure, after);
  }

  /**
      The ::location-popup-on-paste signal is a [keybinding signal][GtkBindingSignal]
    which gets emitted when the user asks for it.
    
    This is used to make the file chooser show a "Location" prompt when the user
    pastes into a #GtkFileChooserWidget.
    
    The default binding for this signal is `Control + V`.
  
    ## Parameters
    $(LIST
      * $(B fileChooserWidget) the instance the signal is connected to
    )
  */
  alias LocationPopupOnPasteCallbackDlg = void delegate(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /** ditto */
  alias LocationPopupOnPasteCallbackFunc = void function(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /**
    Connect to LocationPopupOnPaste signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectLocationPopupOnPaste(T)(T callback, Flag!"After" after = No.After)
  if (is(T : LocationPopupOnPasteCallbackDlg) || is(T : LocationPopupOnPasteCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!(gtk.file_chooser_widget.FileChooserWidget)(_paramVals);
      _dClosure.dlg(fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("location-popup-on-paste", closure, after);
  }

  /**
      The ::location-toggle-popup signal is a [keybinding signal][GtkBindingSignal]
    which gets emitted when the user asks for it.
    
    This is used to toggle the visibility of a "Location" prompt which the user
    can use to manually type the name of the file he wishes to select.
    
    The default binding for this signal is `Control + L`.
  
    ## Parameters
    $(LIST
      * $(B fileChooserWidget) the instance the signal is connected to
    )
  */
  alias LocationTogglePopupCallbackDlg = void delegate(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /** ditto */
  alias LocationTogglePopupCallbackFunc = void function(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /**
    Connect to LocationTogglePopup signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectLocationTogglePopup(T)(T callback, Flag!"After" after = No.After)
  if (is(T : LocationTogglePopupCallbackDlg) || is(T : LocationTogglePopupCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!(gtk.file_chooser_widget.FileChooserWidget)(_paramVals);
      _dClosure.dlg(fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("location-toggle-popup", closure, after);
  }

  /**
      The ::places-shortcut signal is a [keybinding signal][GtkBindingSignal]
    which gets emitted when the user asks for it.
    
    This is used to move the focus to the places sidebar.
    
    The default binding for this signal is `Alt + P`.
  
    ## Parameters
    $(LIST
      * $(B fileChooserWidget) the instance the signal is connected to
    )
  */
  alias PlacesShortcutCallbackDlg = void delegate(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /** ditto */
  alias PlacesShortcutCallbackFunc = void function(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /**
    Connect to PlacesShortcut signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectPlacesShortcut(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PlacesShortcutCallbackDlg) || is(T : PlacesShortcutCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!(gtk.file_chooser_widget.FileChooserWidget)(_paramVals);
      _dClosure.dlg(fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("places-shortcut", closure, after);
  }

  /**
      The ::quick-bookmark signal is a [keybinding signal][GtkBindingSignal]
    which gets emitted when the user asks for it.
    
    This is used to make the file chooser switch to the bookmark specified
    in the bookmark_index parameter. For example, if you have three bookmarks,
    you can pass 0, 1, 2 to this signal to switch to each of them, respectively.
    
    The default binding for this signal is `Alt + 1`, `Alt + 2`,
    etc. until `Alt + 0`.  Note that in the default binding, that
    `Alt + 1` is actually defined to switch to the bookmark at index
    0, and so on successively; `Alt + 0` is defined to switch to the
    bookmark at index 10.
  
    ## Parameters
    $(LIST
      * $(B bookmarkIndex)       the number of the bookmark to switch to
      * $(B fileChooserWidget) the instance the signal is connected to
    )
  */
  alias QuickBookmarkCallbackDlg = void delegate(int bookmarkIndex, gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /** ditto */
  alias QuickBookmarkCallbackFunc = void function(int bookmarkIndex, gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /**
    Connect to QuickBookmark signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectQuickBookmark(T)(T callback, Flag!"After" after = No.After)
  if (is(T : QuickBookmarkCallbackDlg) || is(T : QuickBookmarkCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!(gtk.file_chooser_widget.FileChooserWidget)(_paramVals);
      auto bookmarkIndex = getVal!(int)(&_paramVals[1]);
      _dClosure.dlg(bookmarkIndex, fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("quick-bookmark", closure, after);
  }

  /**
      The ::recent-shortcut signal is a [keybinding signal][GtkBindingSignal]
    which gets emitted when the user asks for it.
    
    This is used to make the file chooser show the Recent location.
    
    The default binding for this signal is `Alt + R`.
  
    ## Parameters
    $(LIST
      * $(B fileChooserWidget) the instance the signal is connected to
    )
  */
  alias RecentShortcutCallbackDlg = void delegate(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /** ditto */
  alias RecentShortcutCallbackFunc = void function(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /**
    Connect to RecentShortcut signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectRecentShortcut(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RecentShortcutCallbackDlg) || is(T : RecentShortcutCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!(gtk.file_chooser_widget.FileChooserWidget)(_paramVals);
      _dClosure.dlg(fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("recent-shortcut", closure, after);
  }

  /**
      The ::search-shortcut signal is a [keybinding signal][GtkBindingSignal]
    which gets emitted when the user asks for it.
    
    This is used to make the file chooser show the search entry.
    
    The default binding for this signal is `Alt + S`.
  
    ## Parameters
    $(LIST
      * $(B fileChooserWidget) the instance the signal is connected to
    )
  */
  alias SearchShortcutCallbackDlg = void delegate(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /** ditto */
  alias SearchShortcutCallbackFunc = void function(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /**
    Connect to SearchShortcut signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectSearchShortcut(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SearchShortcutCallbackDlg) || is(T : SearchShortcutCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!(gtk.file_chooser_widget.FileChooserWidget)(_paramVals);
      _dClosure.dlg(fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("search-shortcut", closure, after);
  }

  /**
      The ::show-hidden signal is a [keybinding signal][GtkBindingSignal]
    which gets emitted when the user asks for it.
    
    This is used to make the file chooser display hidden files.
    
    The default binding for this signal is `Control + H`.
  
    ## Parameters
    $(LIST
      * $(B fileChooserWidget) the instance the signal is connected to
    )
  */
  alias ShowHiddenCallbackDlg = void delegate(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /** ditto */
  alias ShowHiddenCallbackFunc = void function(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /**
    Connect to ShowHidden signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectShowHidden(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ShowHiddenCallbackDlg) || is(T : ShowHiddenCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!(gtk.file_chooser_widget.FileChooserWidget)(_paramVals);
      _dClosure.dlg(fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show-hidden", closure, after);
  }

  /**
      The ::up-folder signal is a [keybinding signal][GtkBindingSignal]
    which gets emitted when the user asks for it.
    
    This is used to make the file chooser go to the parent of the current folder
    in the file hierarchy.
    
    The default binding for this signal is `Alt + Up`.
  
    ## Parameters
    $(LIST
      * $(B fileChooserWidget) the instance the signal is connected to
    )
  */
  alias UpFolderCallbackDlg = void delegate(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /** ditto */
  alias UpFolderCallbackFunc = void function(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget);

  /**
    Connect to UpFolder signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectUpFolder(T)(T callback, Flag!"After" after = No.After)
  if (is(T : UpFolderCallbackDlg) || is(T : UpFolderCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fileChooserWidget = getVal!(gtk.file_chooser_widget.FileChooserWidget)(_paramVals);
      _dClosure.dlg(fileChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("up-folder", closure, after);
  }
}
