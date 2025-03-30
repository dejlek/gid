/// Module for [FontChooser] interface mixin
module gtk.font_chooser_mixin;

public import gtk.font_chooser_iface_proxy;
public import gid.gid;
public import gobject.dclosure;
public import gobject.object;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;
public import pango.font_description;
public import pango.font_face;
public import pango.font_family;
public import pango.font_map;

/**
    #GtkFontChooser is an interface that can be implemented by widgets
    displaying the list of fonts. In GTK+, the main objects
    that implement this interface are #GtkFontChooserWidget,
    #GtkFontChooserDialog and #GtkFontButton. The GtkFontChooser interface
    has been introducted in GTK+ 3.2.
*/
template FontChooserT()
{

  /**
      Gets the currently-selected font name.
      
      Note that this can be a different string than what you set with
      [gtk.font_chooser.FontChooser.setFont], as the font chooser widget may
      normalize font names and thus return a string with a different
      structure. For example, “Helvetica Italic Bold 12” could be
      normalized to “Helvetica Bold Italic 12”.
      
      Use [pango.font_description.FontDescription.equal] if you want to compare two
      font descriptions.
      Returns: A string with the name
            of the current font, or null if  no font is selected. You must
            free this string with [glib.global.gfree].
  */
  override string getFont()
  {
    char* _cretval;
    _cretval = gtk_font_chooser_get_font(cast(GtkFontChooser*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the currently-selected font.
      
      Note that this can be a different string than what you set with
      [gtk.font_chooser.FontChooser.setFont], as the font chooser widget may
      normalize font names and thus return a string with a different
      structure. For example, “Helvetica Italic Bold 12” could be
      normalized to “Helvetica Bold Italic 12”.
      
      Use [pango.font_description.FontDescription.equal] if you want to compare two
      font descriptions.
      Returns: A #PangoFontDescription for the
            current font, or null if  no font is selected.
  */
  override pango.font_description.FontDescription getFontDesc()
  {
    PangoFontDescription* _cretval;
    _cretval = gtk_font_chooser_get_font_desc(cast(GtkFontChooser*)cPtr);
    auto _retval = _cretval ? new pango.font_description.FontDescription(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the #PangoFontFace representing the selected font group
      details (i.e. family, slant, weight, width, etc).
      
      If the selected font is not installed, returns null.
      Returns: A #PangoFontFace representing the
            selected font group details, or null. The returned object is owned by
            fontchooser and must not be modified or freed.
  */
  override pango.font_face.FontFace getFontFace()
  {
    PangoFontFace* _cretval;
    _cretval = gtk_font_chooser_get_font_face(cast(GtkFontChooser*)cPtr);
    auto _retval = ObjectG.getDObject!(pango.font_face.FontFace)(cast(PangoFontFace*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #PangoFontFamily representing the selected font family.
      Font families are a collection of font faces.
      
      If the selected font is not installed, returns null.
      Returns: A #PangoFontFamily representing the
            selected font family, or null. The returned object is owned by fontchooser
            and must not be modified or freed.
  */
  override pango.font_family.FontFamily getFontFamily()
  {
    PangoFontFamily* _cretval;
    _cretval = gtk_font_chooser_get_font_family(cast(GtkFontChooser*)cPtr);
    auto _retval = ObjectG.getDObject!(pango.font_family.FontFamily)(cast(PangoFontFamily*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the currently-selected font features.
      Returns: the currently selected font features
  */
  override string getFontFeatures()
  {
    char* _cretval;
    _cretval = gtk_font_chooser_get_font_features(cast(GtkFontChooser*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the custom font map of this font chooser widget,
      or null if it does not have one.
      Returns: a #PangoFontMap, or null
  */
  override pango.font_map.FontMap getFontMap()
  {
    PangoFontMap* _cretval;
    _cretval = gtk_font_chooser_get_font_map(cast(GtkFontChooser*)cPtr);
    auto _retval = ObjectG.getDObject!(pango.font_map.FontMap)(cast(PangoFontMap*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      The selected font size.
      Returns: A n integer representing the selected font size,
            or -1 if no font size is selected.
  */
  override int getFontSize()
  {
    int _retval;
    _retval = gtk_font_chooser_get_font_size(cast(GtkFontChooser*)cPtr);
    return _retval;
  }

  /**
      Gets the language that is used for font features.
      Returns: the currently selected language
  */
  override string getLanguage()
  {
    char* _cretval;
    _cretval = gtk_font_chooser_get_language(cast(GtkFontChooser*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns the current level of granularity for selecting fonts.
      Returns: the current granularity level
  */
  override gtk.types.FontChooserLevel getLevel()
  {
    GtkFontChooserLevel _cretval;
    _cretval = gtk_font_chooser_get_level(cast(GtkFontChooser*)cPtr);
    gtk.types.FontChooserLevel _retval = cast(gtk.types.FontChooserLevel)_cretval;
    return _retval;
  }

  /**
      Gets the text displayed in the preview area.
      Returns: the text displayed in the
            preview area
  */
  override string getPreviewText()
  {
    char* _cretval;
    _cretval = gtk_font_chooser_get_preview_text(cast(GtkFontChooser*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns whether the preview entry is shown or not.
      Returns: true if the preview entry is shown
            or false if it is hidden.
  */
  override bool getShowPreviewEntry()
  {
    bool _retval;
    _retval = gtk_font_chooser_get_show_preview_entry(cast(GtkFontChooser*)cPtr);
    return _retval;
  }

  /**
      Adds a filter function that decides which fonts to display
      in the font chooser.
  
      Params:
        filter = a #GtkFontFilterFunc, or null
  */
  override void setFilterFunc(gtk.types.FontFilterFunc filter = null)
  {
    extern(C) bool _filterCallback(const(PangoFontFamily)* family, const(PangoFontFace)* face, void* data)
    {
      auto _dlg = cast(gtk.types.FontFilterFunc*)data;

      bool _retval = (*_dlg)(ObjectG.getDObject!(pango.font_family.FontFamily)(cast(void*)family, No.Take), ObjectG.getDObject!(pango.font_face.FontFace)(cast(void*)face, No.Take));
      return _retval;
    }
    auto _filterCB = filter ? &_filterCallback : null;

    auto _filter = filter ? freezeDelegate(cast(void*)&filter) : null;
    GDestroyNotify _filterDestroyCB = filter ? &thawDelegate : null;
    gtk_font_chooser_set_filter_func(cast(GtkFontChooser*)cPtr, _filterCB, _filter, _filterDestroyCB);
  }

  /**
      Sets the currently-selected font.
  
      Params:
        fontname = a font name like “Helvetica 12” or “Times Bold 18”
  */
  override void setFont(string fontname)
  {
    const(char)* _fontname = fontname.toCString(No.Alloc);
    gtk_font_chooser_set_font(cast(GtkFontChooser*)cPtr, _fontname);
  }

  /**
      Sets the currently-selected font from font_desc.
  
      Params:
        fontDesc = a #PangoFontDescription
  */
  override void setFontDesc(pango.font_description.FontDescription fontDesc)
  {
    gtk_font_chooser_set_font_desc(cast(GtkFontChooser*)cPtr, fontDesc ? cast(const(PangoFontDescription)*)fontDesc.cPtr(No.Dup) : null);
  }

  /**
      Sets a custom font map to use for this font chooser widget.
      A custom font map can be used to present application-specific
      fonts instead of or in addition to the normal system fonts.
      
      ```c
      FcConfig *config;
      PangoFontMap *fontmap;
      
      config = FcInitLoadConfigAndFonts ();
      FcConfigAppFontAddFile (config, my_app_font_file);
      
      fontmap = pango_cairo_font_map_new_for_font_type (CAIRO_FONT_TYPE_FT);
      pango_fc_font_map_set_config (PANGO_FC_FONT_MAP (fontmap), config);
      
      gtk_font_chooser_set_font_map (font_chooser, fontmap);
      ```
      
      Note that other GTK+ widgets will only be able to use the application-specific
      font if it is present in the font map they use:
      
      ```
      context = gtk_widget_get_pango_context (label);
      pango_context_set_font_map (context, fontmap);
      ```
  
      Params:
        fontmap = a #PangoFontMap
  */
  override void setFontMap(pango.font_map.FontMap fontmap = null)
  {
    gtk_font_chooser_set_font_map(cast(GtkFontChooser*)cPtr, fontmap ? cast(PangoFontMap*)fontmap.cPtr(No.Dup) : null);
  }

  /**
      Sets the language to use for font features.
  
      Params:
        language = a language
  */
  override void setLanguage(string language)
  {
    const(char)* _language = language.toCString(No.Alloc);
    gtk_font_chooser_set_language(cast(GtkFontChooser*)cPtr, _language);
  }

  /**
      Sets the desired level of granularity for selecting fonts.
  
      Params:
        level = the desired level of granularity
  */
  override void setLevel(gtk.types.FontChooserLevel level)
  {
    gtk_font_chooser_set_level(cast(GtkFontChooser*)cPtr, level);
  }

  /**
      Sets the text displayed in the preview area.
      The text is used to show how the selected font looks.
  
      Params:
        text = the text to display in the preview area
  */
  override void setPreviewText(string text)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_font_chooser_set_preview_text(cast(GtkFontChooser*)cPtr, _text);
  }

  /**
      Shows or hides the editable preview entry.
  
      Params:
        showPreviewEntry = whether to show the editable preview entry or not
  */
  override void setShowPreviewEntry(bool showPreviewEntry)
  {
    gtk_font_chooser_set_show_preview_entry(cast(GtkFontChooser*)cPtr, showPreviewEntry);
  }

  /**
      Connect to `FontActivated` signal.
  
      Emitted when a font is activated.
      This usually happens when the user double clicks an item,
      or an item is selected and the user presses one of the keys
      Space, Shift+Space, Return or Enter.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string fontname, gtk.font_chooser.FontChooser fontChooser))
  
          `fontname` the font name (optional)
  
          `fontChooser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFontActivated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.font_chooser.FontChooser)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("font-activated", closure, after);
  }
}
