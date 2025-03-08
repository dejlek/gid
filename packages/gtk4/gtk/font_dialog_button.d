module gtk.font_dialog_button;

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
import gtk.font_dialog;
import gtk.types;
import gtk.widget;
import pango.font_description;
import pango.language;

/**
    The [gtk.font_dialog_button.FontDialogButton] is wrapped around a [gtk.font_dialog.FontDialog]
  and allows to open a font chooser dialog to change the font.
  
  ![An example GtkFontDialogButton](font-button.png)
  
  It is suitable widget for selecting a font in a preference dialog.
  
  # CSS nodes
  
  ```
  fontbutton
  ╰── button.font
      ╰── [content]
  ```
  
  [gtk.font_dialog_button.FontDialogButton] has a single CSS node with name fontbutton which
  contains a button node with the .font style class.
*/
class FontDialogButton : gtk.widget.Widget
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_font_dialog_button_get_type != &gidSymbolNotFound ? gtk_font_dialog_button_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new [gtk.font_dialog_button.FontDialogButton] with the
    given [gtk.font_dialog.FontDialog].
    
    You can pass `NULL` to this function and set a [gtk.font_dialog.FontDialog]
    later. The button will be insensitive until that happens.
    Params:
      dialog =       the [gtk.font_dialog.FontDialog] to use
    Returns:     the new [gtk.font_dialog_button.FontDialogButton]
  */
  this(gtk.font_dialog.FontDialog dialog = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_font_dialog_button_new(dialog ? cast(GtkFontDialog*)dialog.cPtr(Yes.dup) : null);
    this(_cretval, No.take);
  }

  /**
      Returns the [gtk.font_dialog.FontDialog] of self.
    Returns:     the [gtk.font_dialog.FontDialog]
  */
  gtk.font_dialog.FontDialog getDialog()
  {
    GtkFontDialog* _cretval;
    _cretval = gtk_font_dialog_button_get_dialog(cast(GtkFontDialogButton*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.font_dialog.FontDialog)(cast(GtkFontDialog*)_cretval, No.take);
    return _retval;
  }

  /**
      Returns the font of the button.
    
    This function is what should be used to obtain
    the font that was chosen by the user. To get
    informed about changes, listen to "notify::font-desc".
    Returns:     the font
  */
  pango.font_description.FontDescription getFontDesc()
  {
    PangoFontDescription* _cretval;
    _cretval = gtk_font_dialog_button_get_font_desc(cast(GtkFontDialogButton*)cPtr);
    auto _retval = _cretval ? new pango.font_description.FontDescription(cast(void*)_cretval, No.take) : null;
    return _retval;
  }

  /**
      Returns the font features of the button.
    
    This function is what should be used to obtain the font features
    that were chosen by the user. To get informed about changes, listen
    to "notify::font-features".
    
    Note that the button will only let users choose font features
    if [gtk.font_dialog_button.FontDialogButton.FontLevel] is set to
    [gtk.types.FontLevel.features].
    Returns:     the font features
  */
  string getFontFeatures()
  {
    const(char)* _cretval;
    _cretval = gtk_font_dialog_button_get_font_features(cast(GtkFontDialogButton*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Returns the language that is used for font features.
    Returns:     the language
  */
  pango.language.Language getLanguage()
  {
    PangoLanguage* _cretval;
    _cretval = gtk_font_dialog_button_get_language(cast(GtkFontDialogButton*)cPtr);
    auto _retval = _cretval ? new pango.language.Language(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Returns the level of detail at which this dialog
    lets the user select fonts.
    Returns:     the level of detail
  */
  gtk.types.FontLevel getLevel()
  {
    GtkFontLevel _cretval;
    _cretval = gtk_font_dialog_button_get_level(cast(GtkFontDialogButton*)cPtr);
    gtk.types.FontLevel _retval = cast(gtk.types.FontLevel)_cretval;
    return _retval;
  }

  /**
      Returns whether the selected font is used in the label.
    Returns:     whether the selected font is used in the label
  */
  bool getUseFont()
  {
    bool _retval;
    _retval = gtk_font_dialog_button_get_use_font(cast(GtkFontDialogButton*)cPtr);
    return _retval;
  }

  /**
      Returns whether the selected font size is used in the label.
    Returns:     whether the selected font size is used in the label
  */
  bool getUseSize()
  {
    bool _retval;
    _retval = gtk_font_dialog_button_get_use_size(cast(GtkFontDialogButton*)cPtr);
    return _retval;
  }

  /**
      Sets a [gtk.font_dialog.FontDialog] object to use for
    creating the font chooser dialog that is
    presented when the user clicks the button.
    Params:
      dialog =       the new [gtk.font_dialog.FontDialog]
  */
  void setDialog(gtk.font_dialog.FontDialog dialog)
  {
    gtk_font_dialog_button_set_dialog(cast(GtkFontDialogButton*)cPtr, dialog ? cast(GtkFontDialog*)dialog.cPtr(No.dup) : null);
  }

  /**
      Sets the font of the button.
    Params:
      fontDesc =       the new font
  */
  void setFontDesc(pango.font_description.FontDescription fontDesc)
  {
    gtk_font_dialog_button_set_font_desc(cast(GtkFontDialogButton*)cPtr, fontDesc ? cast(const(PangoFontDescription)*)fontDesc.cPtr(No.dup) : null);
  }

  /**
      Sets the font features of the button.
    Params:
      fontFeatures =       the font features
  */
  void setFontFeatures(string fontFeatures = null)
  {
    const(char)* _fontFeatures = fontFeatures.toCString(No.alloc);
    gtk_font_dialog_button_set_font_features(cast(GtkFontDialogButton*)cPtr, _fontFeatures);
  }

  /**
      Sets the language to use for font features.
    Params:
      language =       the new language
  */
  void setLanguage(pango.language.Language language = null)
  {
    gtk_font_dialog_button_set_language(cast(GtkFontDialogButton*)cPtr, language ? cast(PangoLanguage*)language.cPtr(No.dup) : null);
  }

  /**
      Sets the level of detail at which this dialog
    lets the user select fonts.
    Params:
      level =       the level of detail
  */
  void setLevel(gtk.types.FontLevel level)
  {
    gtk_font_dialog_button_set_level(cast(GtkFontDialogButton*)cPtr, level);
  }

  /**
      If use_font is `TRUE`, the font name will be written
    using the selected font.
    Params:
      useFont =       If `TRUE`, font name will be written using
          the chosen font
  */
  void setUseFont(bool useFont)
  {
    gtk_font_dialog_button_set_use_font(cast(GtkFontDialogButton*)cPtr, useFont);
  }

  /**
      If use_size is `TRUE`, the font name will be written
    using the selected font size.
    Params:
      useSize =       If `TRUE`, font name will be written using
          the chosen font size
  */
  void setUseSize(bool useSize)
  {
    gtk_font_dialog_button_set_use_size(cast(GtkFontDialogButton*)cPtr, useSize);
  }

  /**
      Emitted when the font dialog button is activated.
    
    The `::activate` signal on [gtk.font_dialog_button.FontDialogButton] is an action signal
    and emitting it causes the button to pop up its dialog.
  
    ## Parameters
    $(LIST
      * $(B fontDialogButton) the instance the signal is connected to
    )
  */
  alias ActivateCallbackDlg = void delegate(gtk.font_dialog_button.FontDialogButton fontDialogButton);

  /** ditto */
  alias ActivateCallbackFunc = void function(gtk.font_dialog_button.FontDialogButton fontDialogButton);

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
      auto fontDialogButton = getVal!(gtk.font_dialog_button.FontDialogButton)(_paramVals);
      _dClosure.dlg(fontDialogButton);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }
}
