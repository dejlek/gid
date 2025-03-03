module gtk.label;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.menu;
import gtk.misc;
import gtk.types;
import gtk.widget;
import pango.attr_list;
import pango.layout;
import pango.types;

/**
 * The #GtkLabel widget displays a small amount of text. As the name
 * implies, most labels are used to label another widget such as a
 * #GtkButton, a #GtkMenuItem, or a #GtkComboBox.
 * # CSS nodes
 * |[<!-- language\="plain" -->
 * label
 * ├── [selection]
 * ├── [link]
 * ┊
 * ╰── [link]
 * ]|
 * GtkLabel has a single CSS node with the name label. A wide variety
 * of style classes may be applied to labels, such as .title, .subtitle,
 * .dim-label, etc. In the #GtkShortcutsWindow, labels are used wth the
 * .keycap style class.
 * If the label has a selection, it gets a subnode with name selection.
 * If the label has links, there is one subnode per link. These subnodes
 * carry the link or visited state depending on whether they have been
 * visited.
 * # GtkLabel as GtkBuildable
 * The GtkLabel implementation of the GtkBuildable interface supports a
 * custom `<attributes>` element, which supports any number of `<attribute>`
 * elements. The `<attribute>` element has attributes named “name“, “value“,
 * “start“ and “end“ and allows you to specify #PangoAttribute values for
 * this label.
 * An example of a UI definition fragment specifying Pango attributes:
 * |[<!-- language\="xml" -->
 * <object class\="GtkLabel">
 * <attributes>
 * <attribute name\="weight" value\="PANGO_WEIGHT_BOLD"/>
 * <attribute name\="background" value\="red" start\="5" end\="10"/>
 * </attributes>
 * </object>
 * ]|
 * The start and end attributes specify the range of characters to which the
 * Pango attribute applies. If start and end are not specified, the attribute is
 * applied to the whole text. Note that specifying ranges does not make much
 * sense with translatable attributes. Use markup embedded in the translatable
 * content instead.
 * # Mnemonics
 * Labels may contain “mnemonics”. Mnemonics are
 * underlined characters in the label, used for keyboard navigation.
 * Mnemonics are created by providing a string with an underscore before
 * the mnemonic character, such as `"_File"`, to the
 * functions [gtk.label.Label.newWithMnemonic] or
 * [gtk.label.Label.setTextWithMnemonic].
 * Mnemonics automatically activate any activatable widget the label is
 * inside, such as a #GtkButton; if the label is not inside the
 * mnemonic’s target widget, you have to tell the label about the target
 * using [gtk.label.Label.setMnemonicWidget]. Here’s a simple example where
 * the label is inside a button:
 * |[<!-- language\="C" -->
 * // Pressing Alt+H will activate this button
 * GtkWidget *button \= gtk_button_new $(LPAREN)$(RPAREN);
 * GtkWidget *label \= gtk_label_new_with_mnemonic $(LPAREN)"_Hello"$(RPAREN);
 * gtk_container_add $(LPAREN)GTK_CONTAINER $(LPAREN)button$(RPAREN), label$(RPAREN);
 * ]|
 * There’s a convenience function to create buttons with a mnemonic label
 * already inside:
 * |[<!-- language\="C" -->
 * // Pressing Alt+H will activate this button
 * GtkWidget *button \= gtk_button_new_with_mnemonic $(LPAREN)"_Hello"$(RPAREN);
 * ]|
 * To create a mnemonic for a widget alongside the label, such as a
 * #GtkEntry, you have to point the label at the entry with
 * [gtk.label.Label.setMnemonicWidget]:
 * |[<!-- language\="C" -->
 * // Pressing Alt+H will focus the entry
 * GtkWidget *entry \= gtk_entry_new $(LPAREN)$(RPAREN);
 * GtkWidget *label \= gtk_label_new_with_mnemonic $(LPAREN)"_Hello"$(RPAREN);
 * gtk_label_set_mnemonic_widget $(LPAREN)GTK_LABEL $(LPAREN)label$(RPAREN), entry$(RPAREN);
 * ]|
 * # Markup $(LPAREN)styled text$(RPAREN)
 * To make it easy to format text in a label $(LPAREN)changing colors,
 * fonts, etc.$(RPAREN), label text can be provided in a simple
 * [markup format][PangoMarkupFormat].
 * Here’s how to create a label with a small font:
 * |[<!-- language\="C" -->
 * GtkWidget *label \= gtk_label_new $(LPAREN)NULL$(RPAREN);
 * gtk_label_set_markup $(LPAREN)GTK_LABEL $(LPAREN)label$(RPAREN), "<small>Small text</small>"$(RPAREN);
 * ]|
 * $(LPAREN)See [complete documentation][PangoMarkupFormat] of available
 * tags in the Pango manual.$(RPAREN)
 * The markup passed to [gtk.label.Label.setMarkup] must be valid; for example,
 * literal <, > and & characters must be escaped as &lt;, &gt;, and &amp;.
 * If you pass text obtained from the user, file, or a network to
 * [gtk.label.Label.setMarkup], you’ll want to escape it with
 * [glib.global.markupEscapeText] or [glib.global.markupPrintfEscaped].
 * Markup strings are just a convenient way to set the #PangoAttrList on
 * a label; [gtk.label.Label.setAttributes] may be a simpler way to set
 * attributes in some cases. Be careful though; #PangoAttrList tends to
 * cause internationalization problems, unless you’re applying attributes
 * to the entire string $(LPAREN)i.e. unless you set the range of each attribute
 * to [0, %G_MAXINT$(RPAREN)$(RPAREN). The reason is that specifying the start_index and
 * end_index for a #PangoAttribute requires knowledge of the exact string
 * being displayed, so translations will cause problems.
 * # Selectable labels
 * Labels can be made selectable with [gtk.label.Label.setSelectable].
 * Selectable labels allow the user to copy the label contents to
 * the clipboard. Only labels that contain useful-to-copy information
 * — such as error messages — should be made selectable.
 * # Text layout # {#label-text-layout}
 * A label can contain any number of paragraphs, but will have
 * performance problems if it contains more than a small number.
 * Paragraphs are separated by newlines or other paragraph separators
 * understood by Pango.
 * Labels can automatically wrap text if you call
 * [gtk.label.Label.setLineWrap].
 * [gtk.label.Label.setJustify] sets how the lines in a label align
 * with one another. If you want to set how the label as a whole
 * aligns in its available space, see the #GtkWidget:halign and
 * #GtkWidget:valign properties.
 * The #GtkLabel:width-chars and #GtkLabel:max-width-chars properties
 * can be used to control the size allocation of ellipsized or wrapped
 * labels. For ellipsizing labels, if either is specified $(LPAREN)and less
 * than the actual text size$(RPAREN), it is used as the minimum width, and the actual
 * text size is used as the natural width of the label. For wrapping labels,
 * width-chars is used as the minimum width, if specified, and max-width-chars
 * is used as the natural width. Even if max-width-chars specified, wrapping
 * labels will be rewrapped to use all of the available width.
 * Note that the interpretation of #GtkLabel:width-chars and
 * #GtkLabel:max-width-chars has changed a bit with the introduction of
 * [width-for-height geometry management.][geometry-management]
 * # Links
 * Since 2.18, GTK+ supports markup for clickable hyperlinks in addition
 * to regular Pango markup. The markup for links is borrowed from HTML,
 * using the `<a>` with “href“ and “title“ attributes. GTK+ renders links
 * similar to the way they appear in web browsers, with colored, underlined
 * text. The “title“ attribute is displayed as a tooltip on the link.
 * An example looks like this:
 * |[<!-- language\="C" -->
 * const gchar *text \=
 * "Go to the"
 * "<a href\=\"http://www.gtk.org title\=\"&lt;i&gt;Our&lt;/i&gt; website\">"
 * "GTK+ website</a> for more...";
 * GtkWidget *label \= gtk_label_new $(LPAREN)NULL$(RPAREN);
 * gtk_label_set_markup $(LPAREN)GTK_LABEL $(LPAREN)label$(RPAREN), text$(RPAREN);
 * ]|
 * It is possible to implement custom handling for links and their tooltips with
 * the #GtkLabel::activate-link signal and the [gtk.label.Label.getCurrentUri] function.
 */
class Label : gtk.misc.Misc
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_label_get_type != &gidSymbolNotFound ? gtk_label_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new label with the given text inside it. You can
   * pass %NULL to get an empty label widget.
   * Params:
   *   str = The text of the label
   * Returns: the new #GtkLabel
   */
  this(string str = null)
  {
    GtkWidget* _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    _cretval = gtk_label_new(_str);
    this(_cretval, No.Take);
  }

  /**
   * Creates a new #GtkLabel, containing the text in str.
   * If characters in str are preceded by an underscore, they are
   * underlined. If you need a literal underscore character in a label, use
   * '__' $(LPAREN)two underscores$(RPAREN). The first underlined character represents a
   * keyboard accelerator called a mnemonic. The mnemonic key can be used
   * to activate another widget, chosen automatically, or explicitly using
   * [gtk.label.Label.setMnemonicWidget].
   * If [gtk.label.Label.setMnemonicWidget] is not called, then the first
   * activatable ancestor of the #GtkLabel will be chosen as the mnemonic
   * widget. For instance, if the label is inside a button or menu item,
   * the button or menu item will automatically become the mnemonic widget
   * and be activated by the mnemonic.
   * Params:
   *   str = The text of the label, with an underscore in front of the
   *     mnemonic character
   * Returns: the new #GtkLabel
   */
  static gtk.label.Label newWithMnemonic(string str = null)
  {
    GtkWidget* _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    _cretval = gtk_label_new_with_mnemonic(_str);
    auto _retval = ObjectG.getDObject!(gtk.label.Label)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the angle of rotation for the label. See
   * [gtk.label.Label.setAngle].
   * Returns: the angle of rotation for the label
   */
  double getAngle()
  {
    double _retval;
    _retval = gtk_label_get_angle(cast(GtkLabel*)cPtr);
    return _retval;
  }

  /**
   * Gets the attribute list that was set on the label using
   * [gtk.label.Label.setAttributes], if any. This function does
   * not reflect attributes that come from the labels markup
   * $(LPAREN)see [gtk.label.Label.setMarkup]$(RPAREN). If you want to get the
   * effective attributes for the label, use
   * pango_layout_get_attribute $(LPAREN)gtk_label_get_layout $(LPAREN)label$(RPAREN)$(RPAREN).
   * Returns: the attribute list, or %NULL
   *   if none was set.
   */
  pango.attr_list.AttrList getAttributes()
  {
    PangoAttrList* _cretval;
    _cretval = gtk_label_get_attributes(cast(GtkLabel*)cPtr);
    auto _retval = _cretval ? new pango.attr_list.AttrList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Returns the URI for the currently active link in the label.
   * The active link is the one under the mouse pointer or, in a
   * selectable label, the link in which the text cursor is currently
   * positioned.
   * This function is intended for use in a #GtkLabel::activate-link handler
   * or for use in a #GtkWidget::query-tooltip handler.
   * Returns: the currently active URI. The string is owned by GTK+ and must
   *   not be freed or modified.
   */
  string getCurrentUri()
  {
    const(char)* _cretval;
    _cretval = gtk_label_get_current_uri(cast(GtkLabel*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Returns the ellipsizing position of the label. See [gtk.label.Label.setEllipsize].
   * Returns: #PangoEllipsizeMode
   */
  pango.types.EllipsizeMode getEllipsize()
  {
    PangoEllipsizeMode _cretval;
    _cretval = gtk_label_get_ellipsize(cast(GtkLabel*)cPtr);
    pango.types.EllipsizeMode _retval = cast(pango.types.EllipsizeMode)_cretval;
    return _retval;
  }

  /**
   * Returns the justification of the label. See [gtk.label.Label.setJustify].
   * Returns: #GtkJustification
   */
  gtk.types.Justification getJustify()
  {
    GtkJustification _cretval;
    _cretval = gtk_label_get_justify(cast(GtkLabel*)cPtr);
    gtk.types.Justification _retval = cast(gtk.types.Justification)_cretval;
    return _retval;
  }

  /**
   * Fetches the text from a label widget including any embedded
   * underlines indicating mnemonics and Pango markup. $(LPAREN)See
   * [gtk.label.Label.getText]$(RPAREN).
   * Returns: the text of the label widget. This string is
   *   owned by the widget and must not be modified or freed.
   */
  string getLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_label_get_label(cast(GtkLabel*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets the #PangoLayout used to display the label.
   * The layout is useful to e.g. convert text positions to
   * pixel positions, in combination with [gtk.label.Label.getLayoutOffsets].
   * The returned layout is owned by the label so need not be
   * freed by the caller. The label is free to recreate its layout at
   * any time, so it should be considered read-only.
   * Returns: the #PangoLayout for this label
   */
  pango.layout.Layout getLayout()
  {
    PangoLayout* _cretval;
    _cretval = gtk_label_get_layout(cast(GtkLabel*)cPtr);
    auto _retval = ObjectG.getDObject!(pango.layout.Layout)(cast(PangoLayout*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Obtains the coordinates where the label will draw the #PangoLayout
   * representing the text in the label; useful to convert mouse events
   * into coordinates inside the #PangoLayout, e.g. to take some action
   * if some part of the label is clicked. Of course you will need to
   * create a #GtkEventBox to receive the events, and pack the label
   * inside it, since labels are windowless $(LPAREN)they return %FALSE from
   * [gtk.widget.Widget.getHasWindow]$(RPAREN). Remember
   * when using the #PangoLayout functions you need to convert to
   * and from pixels using PANGO_PIXELS$(LPAREN)$(RPAREN) or #PANGO_SCALE.
   * Params:
   *   x = location to store X offset of layout, or %NULL
   *   y = location to store Y offset of layout, or %NULL
   */
  void getLayoutOffsets(out int x, out int y)
  {
    gtk_label_get_layout_offsets(cast(GtkLabel*)cPtr, cast(int*)&x, cast(int*)&y);
  }

  /**
   * Returns whether lines in the label are automatically wrapped.
   * See [gtk.label.Label.setLineWrap].
   * Returns: %TRUE if the lines of the label are automatically wrapped.
   */
  bool getLineWrap()
  {
    bool _retval;
    _retval = gtk_label_get_line_wrap(cast(GtkLabel*)cPtr);
    return _retval;
  }

  /**
   * Returns line wrap mode used by the label. See [gtk.label.Label.setLineWrapMode].
   * Returns: %TRUE if the lines of the label are automatically wrapped.
   */
  pango.types.WrapMode getLineWrapMode()
  {
    PangoWrapMode _cretval;
    _cretval = gtk_label_get_line_wrap_mode(cast(GtkLabel*)cPtr);
    pango.types.WrapMode _retval = cast(pango.types.WrapMode)_cretval;
    return _retval;
  }

  /**
   * Gets the number of lines to which an ellipsized, wrapping
   * label should be limited. See [gtk.label.Label.setLines].
   * Returns: The number of lines
   */
  int getLines()
  {
    int _retval;
    _retval = gtk_label_get_lines(cast(GtkLabel*)cPtr);
    return _retval;
  }

  /**
   * Retrieves the desired maximum width of label, in characters. See
   * [gtk.label.Label.setWidthChars].
   * Returns: the maximum width of the label in characters.
   */
  int getMaxWidthChars()
  {
    int _retval;
    _retval = gtk_label_get_max_width_chars(cast(GtkLabel*)cPtr);
    return _retval;
  }

  /**
   * If the label has been set so that it has an mnemonic key this function
   * returns the keyval used for the mnemonic accelerator. If there is no
   * mnemonic set up it returns #GDK_KEY_VoidSymbol.
   * Returns: GDK keyval usable for accelerators, or #GDK_KEY_VoidSymbol
   */
  uint getMnemonicKeyval()
  {
    uint _retval;
    _retval = gtk_label_get_mnemonic_keyval(cast(GtkLabel*)cPtr);
    return _retval;
  }

  /**
   * Retrieves the target of the mnemonic $(LPAREN)keyboard shortcut$(RPAREN) of this
   * label. See [gtk.label.Label.setMnemonicWidget].
   * Returns: the target of the label’s mnemonic,
   *   or %NULL if none has been set and the default algorithm will be used.
   */
  gtk.widget.Widget getMnemonicWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_label_get_mnemonic_widget(cast(GtkLabel*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the value set by [gtk.label.Label.setSelectable].
   * Returns: %TRUE if the user can copy text from the label
   */
  bool getSelectable()
  {
    bool _retval;
    _retval = gtk_label_get_selectable(cast(GtkLabel*)cPtr);
    return _retval;
  }

  /**
   * Gets the selected range of characters in the label, returning %TRUE
   * if there’s a selection.
   * Params:
   *   start = return location for start of selection, as a character offset
   *   end = return location for end of selection, as a character offset
   * Returns: %TRUE if selection is non-empty
   */
  bool getSelectionBounds(out int start, out int end)
  {
    bool _retval;
    _retval = gtk_label_get_selection_bounds(cast(GtkLabel*)cPtr, cast(int*)&start, cast(int*)&end);
    return _retval;
  }

  /**
   * Returns whether the label is in single line mode.
   * Returns: %TRUE when the label is in single line mode.
   */
  bool getSingleLineMode()
  {
    bool _retval;
    _retval = gtk_label_get_single_line_mode(cast(GtkLabel*)cPtr);
    return _retval;
  }

  /**
   * Fetches the text from a label widget, as displayed on the
   * screen. This does not include any embedded underlines
   * indicating mnemonics or Pango markup. $(LPAREN)See [gtk.label.Label.getLabel]$(RPAREN)
   * Returns: the text in the label widget. This is the internal
   *   string used by the label, and must not be modified.
   */
  string getText()
  {
    const(char)* _cretval;
    _cretval = gtk_label_get_text(cast(GtkLabel*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Returns whether the label is currently keeping track
   * of clicked links.
   * Returns: %TRUE if clicked links are remembered
   */
  bool getTrackVisitedLinks()
  {
    bool _retval;
    _retval = gtk_label_get_track_visited_links(cast(GtkLabel*)cPtr);
    return _retval;
  }

  /**
   * Returns whether the label’s text is interpreted as marked up with
   * the [Pango text markup language][PangoMarkupFormat].
   * See gtk_label_set_use_markup $(LPAREN)$(RPAREN).
   * Returns: %TRUE if the label’s text will be parsed for markup.
   */
  bool getUseMarkup()
  {
    bool _retval;
    _retval = gtk_label_get_use_markup(cast(GtkLabel*)cPtr);
    return _retval;
  }

  /**
   * Returns whether an embedded underline in the label indicates a
   * mnemonic. See [gtk.label.Label.setUseUnderline].
   * Returns: %TRUE whether an embedded underline in the label indicates
   *   the mnemonic accelerator keys.
   */
  bool getUseUnderline()
  {
    bool _retval;
    _retval = gtk_label_get_use_underline(cast(GtkLabel*)cPtr);
    return _retval;
  }

  /**
   * Retrieves the desired width of label, in characters. See
   * [gtk.label.Label.setWidthChars].
   * Returns: the width of the label in characters.
   */
  int getWidthChars()
  {
    int _retval;
    _retval = gtk_label_get_width_chars(cast(GtkLabel*)cPtr);
    return _retval;
  }

  /**
   * Gets the #GtkLabel:xalign property for label.
   * Returns: the xalign property
   */
  float getXalign()
  {
    float _retval;
    _retval = gtk_label_get_xalign(cast(GtkLabel*)cPtr);
    return _retval;
  }

  /**
   * Gets the #GtkLabel:yalign property for label.
   * Returns: the yalign property
   */
  float getYalign()
  {
    float _retval;
    _retval = gtk_label_get_yalign(cast(GtkLabel*)cPtr);
    return _retval;
  }

  /**
   * Selects a range of characters in the label, if the label is selectable.
   * See [gtk.label.Label.setSelectable]. If the label is not selectable,
   * this function has no effect. If start_offset or
   * end_offset are -1, then the end of the label will be substituted.
   * Params:
   *   startOffset = start offset $(LPAREN)in characters not bytes$(RPAREN)
   *   endOffset = end offset $(LPAREN)in characters not bytes$(RPAREN)
   */
  void selectRegion(int startOffset, int endOffset)
  {
    gtk_label_select_region(cast(GtkLabel*)cPtr, startOffset, endOffset);
  }

  /**
   * Sets the angle of rotation for the label. An angle of 90 reads from
   * from bottom to top, an angle of 270, from top to bottom. The angle
   * setting for the label is ignored if the label is selectable,
   * wrapped, or ellipsized.
   * Params:
   *   angle = the angle that the baseline of the label makes with
   *     the horizontal, in degrees, measured counterclockwise
   */
  void setAngle(double angle)
  {
    gtk_label_set_angle(cast(GtkLabel*)cPtr, angle);
  }

  /**
   * Sets a #PangoAttrList; the attributes in the list are applied to the
   * label text.
   * The attributes set with this function will be applied
   * and merged with any other attributes previously effected by way
   * of the #GtkLabel:use-underline or #GtkLabel:use-markup properties.
   * While it is not recommended to mix markup strings with manually set
   * attributes, if you must; know that the attributes will be applied
   * to the label after the markup string is parsed.
   * Params:
   *   attrs = a #PangoAttrList, or %NULL
   */
  void setAttributes(pango.attr_list.AttrList attrs = null)
  {
    gtk_label_set_attributes(cast(GtkLabel*)cPtr, attrs ? cast(PangoAttrList*)attrs.cPtr(No.Dup) : null);
  }

  /**
   * Sets the mode used to ellipsize $(LPAREN)add an ellipsis: "..."$(RPAREN) to the text
   * if there is not enough space to render the entire string.
   * Params:
   *   mode = a #PangoEllipsizeMode
   */
  void setEllipsize(pango.types.EllipsizeMode mode)
  {
    gtk_label_set_ellipsize(cast(GtkLabel*)cPtr, mode);
  }

  /**
   * Sets the alignment of the lines in the text of the label relative to
   * each other. %GTK_JUSTIFY_LEFT is the default value when the widget is
   * first created with [gtk.label.Label.new_]. If you instead want to set the
   * alignment of the label as a whole, use [gtk.widget.Widget.setHalign] instead.
   * [gtk.label.Label.setJustify] has no effect on labels containing only a
   * single line.
   * Params:
   *   jtype = a #GtkJustification
   */
  void setJustify(gtk.types.Justification jtype)
  {
    gtk_label_set_justify(cast(GtkLabel*)cPtr, jtype);
  }

  /**
   * Sets the text of the label. The label is interpreted as
   * including embedded underlines and/or Pango markup depending
   * on the values of the #GtkLabel:use-underline and
   * #GtkLabel:use-markup properties.
   * Params:
   *   str = the new text to set for the label
   */
  void setLabel(string str)
  {
    const(char)* _str = str.toCString(No.Alloc);
    gtk_label_set_label(cast(GtkLabel*)cPtr, _str);
  }

  /**
   * Toggles line wrapping within the #GtkLabel widget. %TRUE makes it break
   * lines if text exceeds the widget’s size. %FALSE lets the text get cut off
   * by the edge of the widget if it exceeds the widget size.
   * Note that setting line wrapping to %TRUE does not make the label
   * wrap at its parent container’s width, because GTK+ widgets
   * conceptually can’t make their requisition depend on the parent
   * container’s size. For a label that wraps at a specific position,
   * set the label’s width using [gtk.widget.Widget.setSizeRequest].
   * Params:
   *   wrap = the setting
   */
  void setLineWrap(bool wrap)
  {
    gtk_label_set_line_wrap(cast(GtkLabel*)cPtr, wrap);
  }

  /**
   * If line wrapping is on $(LPAREN)see [gtk.label.Label.setLineWrap]$(RPAREN) this controls how
   * the line wrapping is done. The default is %PANGO_WRAP_WORD which means
   * wrap on word boundaries.
   * Params:
   *   wrapMode = the line wrapping mode
   */
  void setLineWrapMode(pango.types.WrapMode wrapMode)
  {
    gtk_label_set_line_wrap_mode(cast(GtkLabel*)cPtr, wrapMode);
  }

  /**
   * Sets the number of lines to which an ellipsized, wrapping label
   * should be limited. This has no effect if the label is not wrapping
   * or ellipsized. Set this to -1 if you don’t want to limit the
   * number of lines.
   * Params:
   *   lines = the desired number of lines, or -1
   */
  void setLines(int lines)
  {
    gtk_label_set_lines(cast(GtkLabel*)cPtr, lines);
  }

  /**
   * Parses str which is marked up with the
   * [Pango text markup language][PangoMarkupFormat], setting the
   * label’s text and attribute list based on the parse results.
   * If the str is external data, you may need to escape it with
   * [glib.global.markupEscapeText] or [glib.global.markupPrintfEscaped]:
   * |[<!-- language\="C" -->
   * GtkWidget *label \= gtk_label_new $(LPAREN)NULL$(RPAREN);
   * const char *str \= "some text";
   * const char *format \= "<span style\=\"italic\">\%s</span>";
   * char *markup;
   * markup \= g_markup_printf_escaped $(LPAREN)format, str$(RPAREN);
   * gtk_label_set_markup $(LPAREN)GTK_LABEL $(LPAREN)label$(RPAREN), markup$(RPAREN);
   * g_free $(LPAREN)markup$(RPAREN);
   * ]|
   * This function will set the #GtkLabel:use-markup property to %TRUE as
   * a side effect.
   * If you set the label contents using the #GtkLabel:label property you
   * should also ensure that you set the #GtkLabel:use-markup property
   * accordingly.
   * See also: [gtk.label.Label.setText]
   * Params:
   *   str = a markup string $(LPAREN)see [Pango markup format][PangoMarkupFormat]$(RPAREN)
   */
  void setMarkup(string str)
  {
    const(char)* _str = str.toCString(No.Alloc);
    gtk_label_set_markup(cast(GtkLabel*)cPtr, _str);
  }

  /**
   * Parses str which is marked up with the
   * [Pango text markup language][PangoMarkupFormat],
   * setting the label’s text and attribute list based on the parse results.
   * If characters in str are preceded by an underscore, they are underlined
   * indicating that they represent a keyboard accelerator called a mnemonic.
   * The mnemonic key can be used to activate another widget, chosen
   * automatically, or explicitly using [gtk.label.Label.setMnemonicWidget].
   * Params:
   *   str = a markup string $(LPAREN)see
   *     [Pango markup format][PangoMarkupFormat]$(RPAREN)
   */
  void setMarkupWithMnemonic(string str)
  {
    const(char)* _str = str.toCString(No.Alloc);
    gtk_label_set_markup_with_mnemonic(cast(GtkLabel*)cPtr, _str);
  }

  /**
   * Sets the desired maximum width in characters of label to n_chars.
   * Params:
   *   nChars = the new desired maximum width, in characters.
   */
  void setMaxWidthChars(int nChars)
  {
    gtk_label_set_max_width_chars(cast(GtkLabel*)cPtr, nChars);
  }

  /**
   * If the label has been set so that it has an mnemonic key $(LPAREN)using
   * i.e. [gtk.label.Label.setMarkupWithMnemonic],
   * [gtk.label.Label.setTextWithMnemonic], [gtk.label.Label.newWithMnemonic]
   * or the “use_underline” property$(RPAREN) the label can be associated with a
   * widget that is the target of the mnemonic. When the label is inside
   * a widget $(LPAREN)like a #GtkButton or a #GtkNotebook tab$(RPAREN) it is
   * automatically associated with the correct widget, but sometimes
   * $(LPAREN)i.e. when the target is a #GtkEntry next to the label$(RPAREN) you need to
   * set it explicitly using this function.
   * The target widget will be accelerated by emitting the
   * GtkWidget::mnemonic-activate signal on it. The default handler for
   * this signal will activate the widget if there are no mnemonic collisions
   * and toggle focus between the colliding widgets otherwise.
   * Params:
   *   widget = the target #GtkWidget, or %NULL to unset
   */
  void setMnemonicWidget(gtk.widget.Widget widget = null)
  {
    gtk_label_set_mnemonic_widget(cast(GtkLabel*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
  }

  /**
   * The pattern of underlines you want under the existing text within the
   * #GtkLabel widget.  For example if the current text of the label says
   * “FooBarBaz” passing a pattern of “___   ___” will underline
   * “Foo” and “Baz” but not “Bar”.
   * Params:
   *   pattern = The pattern as described above.
   */
  void setPattern(string pattern)
  {
    const(char)* _pattern = pattern.toCString(No.Alloc);
    gtk_label_set_pattern(cast(GtkLabel*)cPtr, _pattern);
  }

  /**
   * Selectable labels allow the user to select text from the label, for
   * copy-and-paste.
   * Params:
   *   setting = %TRUE to allow selecting text in the label
   */
  void setSelectable(bool setting)
  {
    gtk_label_set_selectable(cast(GtkLabel*)cPtr, setting);
  }

  /**
   * Sets whether the label is in single line mode.
   * Params:
   *   singleLineMode = %TRUE if the label should be in single line mode
   */
  void setSingleLineMode(bool singleLineMode)
  {
    gtk_label_set_single_line_mode(cast(GtkLabel*)cPtr, singleLineMode);
  }

  /**
   * Sets the text within the #GtkLabel widget. It overwrites any text that
   * was there before.
   * This function will clear any previously set mnemonic accelerators, and
   * set the #GtkLabel:use-underline property to %FALSE as a side effect.
   * This function will set the #GtkLabel:use-markup property to %FALSE
   * as a side effect.
   * See also: [gtk.label.Label.setMarkup]
   * Params:
   *   str = The text you want to set
   */
  void setText(string str)
  {
    const(char)* _str = str.toCString(No.Alloc);
    gtk_label_set_text(cast(GtkLabel*)cPtr, _str);
  }

  /**
   * Sets the label’s text from the string str.
   * If characters in str are preceded by an underscore, they are underlined
   * indicating that they represent a keyboard accelerator called a mnemonic.
   * The mnemonic key can be used to activate another widget, chosen
   * automatically, or explicitly using [gtk.label.Label.setMnemonicWidget].
   * Params:
   *   str = a string
   */
  void setTextWithMnemonic(string str)
  {
    const(char)* _str = str.toCString(No.Alloc);
    gtk_label_set_text_with_mnemonic(cast(GtkLabel*)cPtr, _str);
  }

  /**
   * Sets whether the label should keep track of clicked
   * links $(LPAREN)and use a different color for them$(RPAREN).
   * Params:
   *   trackLinks = %TRUE to track visited links
   */
  void setTrackVisitedLinks(bool trackLinks)
  {
    gtk_label_set_track_visited_links(cast(GtkLabel*)cPtr, trackLinks);
  }

  /**
   * Sets whether the text of the label contains markup in
   * [Pango’s text markup language][PangoMarkupFormat].
   * See [gtk.label.Label.setMarkup].
   * Params:
   *   setting = %TRUE if the label’s text should be parsed for markup.
   */
  void setUseMarkup(bool setting)
  {
    gtk_label_set_use_markup(cast(GtkLabel*)cPtr, setting);
  }

  /**
   * If true, an underline in the text indicates the next character should be
   * used for the mnemonic accelerator key.
   * Params:
   *   setting = %TRUE if underlines in the text indicate mnemonics
   */
  void setUseUnderline(bool setting)
  {
    gtk_label_set_use_underline(cast(GtkLabel*)cPtr, setting);
  }

  /**
   * Sets the desired width in characters of label to n_chars.
   * Params:
   *   nChars = the new desired width, in characters.
   */
  void setWidthChars(int nChars)
  {
    gtk_label_set_width_chars(cast(GtkLabel*)cPtr, nChars);
  }

  /**
   * Sets the #GtkLabel:xalign property for label.
   * Params:
   *   xalign = the new xalign value, between 0 and 1
   */
  void setXalign(float xalign)
  {
    gtk_label_set_xalign(cast(GtkLabel*)cPtr, xalign);
  }

  /**
   * Sets the #GtkLabel:yalign property for label.
   * Params:
   *   yalign = the new yalign value, between 0 and 1
   */
  void setYalign(float yalign)
  {
    gtk_label_set_yalign(cast(GtkLabel*)cPtr, yalign);
  }

  /**
   * A [keybinding signal][GtkBindingSignal]
   * which gets emitted when the user activates a link in the label.
   * Applications may also emit the signal with [gobject.global.signalEmitByName]
   * if they need to control activation of URIs programmatically.
   * The default bindings for this signal are all forms of the Enter key.
   *   label = the instance the signal is connected to
   */
  alias ActivateCurrentLinkCallbackDlg = void delegate(gtk.label.Label label);
  alias ActivateCurrentLinkCallbackFunc = void function(gtk.label.Label label);

  /**
   * Connect to ActivateCurrentLink signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectActivateCurrentLink(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateCurrentLinkCallbackDlg) || is(T : ActivateCurrentLinkCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto label = getVal!(gtk.label.Label)(_paramVals);
      _dClosure.dlg(label);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-current-link", closure, after);
  }

  /**
   * The signal which gets emitted to activate a URI.
   * Applications may connect to it to override the default behaviour,
   * which is to call [gtk.global.showUriOnWindow].
   * Params
   *   uri = the URI that is activated
   *   label = the instance the signal is connected to
   * Returns: %TRUE if the link has been activated
   */
  alias ActivateLinkCallbackDlg = bool delegate(string uri, gtk.label.Label label);
  alias ActivateLinkCallbackFunc = bool function(string uri, gtk.label.Label label);

  /**
   * Connect to ActivateLink signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectActivateLink(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateLinkCallbackDlg) || is(T : ActivateLinkCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto label = getVal!(gtk.label.Label)(_paramVals);
      auto uri = getVal!(string)(&_paramVals[1]);
      _retval = _dClosure.dlg(uri, label);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-link", closure, after);
  }

  /**
   * The ::copy-clipboard signal is a
   * [keybinding signal][GtkBindingSignal]
   * which gets emitted to copy the selection to the clipboard.
   * The default binding for this signal is Ctrl-c.
   *   label = the instance the signal is connected to
   */
  alias CopyClipboardCallbackDlg = void delegate(gtk.label.Label label);
  alias CopyClipboardCallbackFunc = void function(gtk.label.Label label);

  /**
   * Connect to CopyClipboard signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectCopyClipboard(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CopyClipboardCallbackDlg) || is(T : CopyClipboardCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto label = getVal!(gtk.label.Label)(_paramVals);
      _dClosure.dlg(label);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("copy-clipboard", closure, after);
  }

  /**
   * The ::move-cursor signal is a
   * [keybinding signal][GtkBindingSignal]
   * which gets emitted when the user initiates a cursor movement.
   * If the cursor is not visible in entry, this signal causes
   * the viewport to be moved instead.
   * Applications should not connect to it, but may emit it with
   * [gobject.global.signalEmitByName] if they need to control the cursor
   * programmatically.
   * The default bindings for this signal come in two variants,
   * the variant with the Shift modifier extends the selection,
   * the variant without the Shift modifer does not.
   * There are too many key combinations to list them all here.
   * - Arrow keys move by individual characters/lines
   * - Ctrl-arrow key combinations move by words/paragraphs
   * - Home/End keys move to the ends of the buffer
   * Params
   *   step = the granularity of the move, as a #GtkMovementStep
   *   count = the number of step units to move
   *   extendSelection = %TRUE if the move should extend the selection
   *   label = the instance the signal is connected to
   */
  alias MoveCursorCallbackDlg = void delegate(gtk.types.MovementStep step, int count, bool extendSelection, gtk.label.Label label);
  alias MoveCursorCallbackFunc = void function(gtk.types.MovementStep step, int count, bool extendSelection, gtk.label.Label label);

  /**
   * Connect to MoveCursor signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MoveCursorCallbackDlg) || is(T : MoveCursorCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto label = getVal!(gtk.label.Label)(_paramVals);
      auto step = getVal!(gtk.types.MovementStep)(&_paramVals[1]);
      auto count = getVal!(int)(&_paramVals[2]);
      auto extendSelection = getVal!(bool)(&_paramVals[3]);
      _dClosure.dlg(step, count, extendSelection, label);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-cursor", closure, after);
  }

  /**
   * The ::populate-popup signal gets emitted before showing the
   * context menu of the label. Note that only selectable labels
   * have context menus.
   * If you need to add items to the context menu, connect
   * to this signal and append your menuitems to the menu.
   * Params
   *   menu = the menu that is being populated
   *   label = the instance the signal is connected to
   */
  alias PopulatePopupCallbackDlg = void delegate(gtk.menu.Menu menu, gtk.label.Label label);
  alias PopulatePopupCallbackFunc = void function(gtk.menu.Menu menu, gtk.label.Label label);

  /**
   * Connect to PopulatePopup signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectPopulatePopup(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PopulatePopupCallbackDlg) || is(T : PopulatePopupCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto label = getVal!(gtk.label.Label)(_paramVals);
      auto menu = getVal!(gtk.menu.Menu)(&_paramVals[1]);
      _dClosure.dlg(menu, label);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("populate-popup", closure, after);
  }
}
