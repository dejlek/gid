module gtk.font_button;

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
import gtk.font_chooser;
import gtk.font_chooser_mixin;
import gtk.types;
import gtk.widget;

/**
    The [gtk.font_button.FontButton] allows to open a font chooser dialog to change
  the font.
  
  ![An example GtkFontButton](font-button.png)
  
  It is suitable widget for selecting a font in a preference dialog.
  
  # CSS nodes
  
  ```
  fontbutton
  ╰── button.font
      ╰── [content]
  ```
  
  [gtk.font_button.FontButton] has a single CSS node with name fontbutton which
  contains a button node with the .font style class.

  Deprecated:     Use [gtk.font_dialog_button.FontDialogButton] instead
*/
class FontButton : gtk.widget.Widget, gtk.font_chooser.FontChooser
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_font_button_get_type != &gidSymbolNotFound ? gtk_font_button_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin FontChooserT!();

  /**
      Creates a new font picker widget.
    Returns:     a new font picker widget.
  
    Deprecated:     Use [gtk.font_dialog_button.FontDialogButton] instead
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_font_button_new();
    this(_cretval, No.take);
  }

  /**
      Creates a new font picker widget showing the given font.
    Params:
      fontname =       Name of font to display in font chooser dialog
    Returns:     a new font picker widget.
  
    Deprecated:     Use [gtk.font_dialog_button.FontDialogButton] instead
  */
  static gtk.font_button.FontButton newWithFont(string fontname)
  {
    GtkWidget* _cretval;
    const(char)* _fontname = fontname.toCString(No.alloc);
    _cretval = gtk_font_button_new_with_font(_fontname);
    auto _retval = ObjectG.getDObject!(gtk.font_button.FontButton)(cast(GtkWidget*)_cretval, No.take);
    return _retval;
  }

  /**
      Gets whether the dialog is modal.
    Returns:     true if the dialog is modal
  
    Deprecated:     Use [gtk.font_dialog_button.FontDialogButton] instead
  */
  bool getModal()
  {
    bool _retval;
    _retval = gtk_font_button_get_modal(cast(GtkFontButton*)cPtr);
    return _retval;
  }

  /**
      Retrieves the title of the font chooser dialog.
    Returns:     an internal copy of the title string
        which must not be freed.
  
    Deprecated:     Use [gtk.font_dialog_button.FontDialogButton] instead
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_font_button_get_title(cast(GtkFontButton*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Returns whether the selected font is used in the label.
    Returns:     whether the selected font is used in the label.
  
    Deprecated:     Use [gtk.font_dialog_button.FontDialogButton] instead
  */
  bool getUseFont()
  {
    bool _retval;
    _retval = gtk_font_button_get_use_font(cast(GtkFontButton*)cPtr);
    return _retval;
  }

  /**
      Returns whether the selected size is used in the label.
    Returns:     whether the selected size is used in the label.
  
    Deprecated:     Use [gtk.font_dialog_button.FontDialogButton] instead
  */
  bool getUseSize()
  {
    bool _retval;
    _retval = gtk_font_button_get_use_size(cast(GtkFontButton*)cPtr);
    return _retval;
  }

  /**
      Sets whether the dialog should be modal.
    Params:
      modal =       true to make the dialog modal
  
    Deprecated:     Use [gtk.font_dialog_button.FontDialogButton] instead
  */
  void setModal(bool modal)
  {
    gtk_font_button_set_modal(cast(GtkFontButton*)cPtr, modal);
  }

  /**
      Sets the title for the font chooser dialog.
    Params:
      title =       a string containing the font chooser dialog title
  
    Deprecated:     Use [gtk.font_dialog_button.FontDialogButton] instead
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.alloc);
    gtk_font_button_set_title(cast(GtkFontButton*)cPtr, _title);
  }

  /**
      If use_font is true, the font name will be written
    using the selected font.
    Params:
      useFont =       If true, font name will be written using font chosen.
  
    Deprecated:     Use [gtk.font_dialog_button.FontDialogButton] instead
  */
  void setUseFont(bool useFont)
  {
    gtk_font_button_set_use_font(cast(GtkFontButton*)cPtr, useFont);
  }

  /**
      If use_size is true, the font name will be written using
    the selected size.
    Params:
      useSize =       If true, font name will be written using the
          selected size.
  
    Deprecated:     Use [gtk.font_dialog_button.FontDialogButton] instead
  */
  void setUseSize(bool useSize)
  {
    gtk_font_button_set_use_size(cast(GtkFontButton*)cPtr, useSize);
  }

  /**
      Emitted to when the font button is activated.
    
    The `::activate` signal on [gtk.font_button.FontButton] is an action signal and
    emitting it causes the button to present its dialog.
  
    ## Parameters
    $(LIST
      * $(B fontButton) the instance the signal is connected to
    )
  */
  alias ActivateCallbackDlg = void delegate(gtk.font_button.FontButton fontButton);

  /** ditto */
  alias ActivateCallbackFunc = void function(gtk.font_button.FontButton fontButton);

  /**
    Connect to Activate signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ActivateCallbackDlg) || is(T : ActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fontButton = getVal!(gtk.font_button.FontButton)(_paramVals);
      _dClosure.dlg(fontButton);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Emitted when the user selects a font.
    
    When handling this signal, use [gtk.font_chooser.FontChooser.getFont]
    to find out which font was just selected.
    
    Note that this signal is only emitted when the user changes the font.
    If you need to react to programmatic font changes as well, use
    the notify::font signal.
  
    ## Parameters
    $(LIST
      * $(B fontButton) the instance the signal is connected to
    )
  */
  alias FontSetCallbackDlg = void delegate(gtk.font_button.FontButton fontButton);

  /** ditto */
  alias FontSetCallbackFunc = void function(gtk.font_button.FontButton fontButton);

  /**
    Connect to FontSet signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectFontSet(T)(T callback, Flag!"after" after = No.after)
  if (is(T : FontSetCallbackDlg) || is(T : FontSetCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fontButton = getVal!(gtk.font_button.FontButton)(_paramVals);
      _dClosure.dlg(fontButton);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("font-set", closure, after);
  }
}
