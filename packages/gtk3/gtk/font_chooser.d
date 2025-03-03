module gtk.font_chooser;

public import gtk.font_chooser_iface_proxy;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import pango.font_description;
import pango.font_face;
import pango.font_family;
import pango.font_map;

/**
 * #GtkFontChooser is an interface that can be implemented by widgets
 * displaying the list of fonts. In GTK+, the main objects
 * that implement this interface are #GtkFontChooserWidget,
 * #GtkFontChooserDialog and #GtkFontButton. The GtkFontChooser interface
 * has been introducted in GTK+ 3.2.
 */
interface FontChooser
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_font_chooser_get_type != &gidSymbolNotFound ? gtk_font_chooser_get_type() : cast(GType)0;
  }

  /**
   * Gets the currently-selected font name.
   * Note that this can be a different string than what you set with
   * [gtk.font_chooser.FontChooser.setFont], as the font chooser widget may
   * normalize font names and thus return a string with a different
   * structure. For example, “Helvetica Italic Bold 12” could be
   * normalized to “Helvetica Bold Italic 12”.
   * Use [pango.font_description.FontDescription.equal] if you want to compare two
   * font descriptions.
   * Returns: A string with the name
   *   of the current font, or %NULL if  no font is selected. You must
   *   free this string with [glib.global.gfree].
   */
  string getFont();

  /**
   * Gets the currently-selected font.
   * Note that this can be a different string than what you set with
   * [gtk.font_chooser.FontChooser.setFont], as the font chooser widget may
   * normalize font names and thus return a string with a different
   * structure. For example, “Helvetica Italic Bold 12” could be
   * normalized to “Helvetica Bold Italic 12”.
   * Use [pango.font_description.FontDescription.equal] if you want to compare two
   * font descriptions.
   * Returns: A #PangoFontDescription for the
   *   current font, or %NULL if  no font is selected.
   */
  pango.font_description.FontDescription getFontDesc();

  /**
   * Gets the #PangoFontFace representing the selected font group
   * details $(LPAREN)i.e. family, slant, weight, width, etc$(RPAREN).
   * If the selected font is not installed, returns %NULL.
   * Returns: A #PangoFontFace representing the
   *   selected font group details, or %NULL. The returned object is owned by
   *   fontchooser and must not be modified or freed.
   */
  pango.font_face.FontFace getFontFace();

  /**
   * Gets the #PangoFontFamily representing the selected font family.
   * Font families are a collection of font faces.
   * If the selected font is not installed, returns %NULL.
   * Returns: A #PangoFontFamily representing the
   *   selected font family, or %NULL. The returned object is owned by fontchooser
   *   and must not be modified or freed.
   */
  pango.font_family.FontFamily getFontFamily();

  /**
   * Gets the currently-selected font features.
   * Returns: the currently selected font features
   */
  string getFontFeatures();

  /**
   * Gets the custom font map of this font chooser widget,
   * or %NULL if it does not have one.
   * Returns: a #PangoFontMap, or %NULL
   */
  pango.font_map.FontMap getFontMap();

  /**
   * The selected font size.
   * Returns: A n integer representing the selected font size,
   *   or -1 if no font size is selected.
   */
  int getFontSize();

  /**
   * Gets the language that is used for font features.
   * Returns: the currently selected language
   */
  string getLanguage();

  /**
   * Returns the current level of granularity for selecting fonts.
   * Returns: the current granularity level
   */
  gtk.types.FontChooserLevel getLevel();

  /**
   * Gets the text displayed in the preview area.
   * Returns: the text displayed in the
   *   preview area
   */
  string getPreviewText();

  /**
   * Returns whether the preview entry is shown or not.
   * Returns: %TRUE if the preview entry is shown
   *   or %FALSE if it is hidden.
   */
  bool getShowPreviewEntry();

  /**
   * Adds a filter function that decides which fonts to display
   * in the font chooser.
   * Params:
   *   filter = a #GtkFontFilterFunc, or %NULL
   */
  void setFilterFunc(gtk.types.FontFilterFunc filter);

  /**
   * Sets the currently-selected font.
   * Params:
   *   fontname = a font name like “Helvetica 12” or “Times Bold 18”
   */
  void setFont(string fontname);

  /**
   * Sets the currently-selected font from font_desc.
   * Params:
   *   fontDesc = a #PangoFontDescription
   */
  void setFontDesc(pango.font_description.FontDescription fontDesc);

  /**
   * Sets a custom font map to use for this font chooser widget.
   * A custom font map can be used to present application-specific
   * fonts instead of or in addition to the normal system fonts.
   * |[<!-- language\="C" -->
   * FcConfig *config;
   * PangoFontMap *fontmap;
   * config \= FcInitLoadConfigAndFonts $(LPAREN)$(RPAREN);
   * FcConfigAppFontAddFile $(LPAREN)config, my_app_font_file$(RPAREN);
   * fontmap \= pango_cairo_font_map_new_for_font_type $(LPAREN)CAIRO_FONT_TYPE_FT$(RPAREN);
   * pango_fc_font_map_set_config $(LPAREN)PANGO_FC_FONT_MAP $(LPAREN)fontmap$(RPAREN), config$(RPAREN);
   * gtk_font_chooser_set_font_map $(LPAREN)font_chooser, fontmap$(RPAREN);
   * ]|
   * Note that other GTK+ widgets will only be able to use the application-specific
   * font if it is present in the font map they use:
   * |[
   * context \= gtk_widget_get_pango_context $(LPAREN)label$(RPAREN);
   * pango_context_set_font_map $(LPAREN)context, fontmap$(RPAREN);
   * ]|
   * Params:
   *   fontmap = a #PangoFontMap
   */
  void setFontMap(pango.font_map.FontMap fontmap);

  /**
   * Sets the language to use for font features.
   * Params:
   *   language = a language
   */
  void setLanguage(string language);

  /**
   * Sets the desired level of granularity for selecting fonts.
   * Params:
   *   level = the desired level of granularity
   */
  void setLevel(gtk.types.FontChooserLevel level);

  /**
   * Sets the text displayed in the preview area.
   * The text is used to show how the selected font looks.
   * Params:
   *   text = the text to display in the preview area
   */
  void setPreviewText(string text);

  /**
   * Shows or hides the editable preview entry.
   * Params:
   *   showPreviewEntry = whether to show the editable preview entry or not
   */
  void setShowPreviewEntry(bool showPreviewEntry);

  /**
   * Emitted when a font is activated.
   * This usually happens when the user double clicks an item,
   * or an item is selected and the user presses one of the keys
   * Space, Shift+Space, Return or Enter.
   * Params
   *   fontname = the font name
   *   fontChooser = the instance the signal is connected to
   */
  alias FontActivatedCallbackDlg = void delegate(string fontname, gtk.font_chooser.FontChooser fontChooser);
  alias FontActivatedCallbackFunc = void function(string fontname, gtk.font_chooser.FontChooser fontChooser);

  /**
   * Connect to FontActivated signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectFontActivated(T)(T callback, Flag!"After" after = No.After)
  if (is(T : FontActivatedCallbackDlg) || is(T : FontActivatedCallbackFunc));
  }
