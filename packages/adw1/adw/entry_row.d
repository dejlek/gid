/// Module for [EntryRow] class
module adw.entry_row;

import adw.c.functions;
import adw.c.types;
import adw.preferences_row;
import adw.types;
import gid.gid;
import gobject.dclosure;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.editable;
import gtk.editable_mixin;
import gtk.types;
import gtk.widget;
import pango.attr_list;

/**
    A [gtk.list_box_row.ListBoxRow] with an embedded text entry.
    
    <picture>
      <source srcset="entry-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="entry-row.png" alt="entry-row">
    </picture>
    
    [adw.entry_row.EntryRow] has a title that doubles as placeholder text. It shows an icon
    indicating that it's editable and can receive additional widgets before or
    after the editable part.
    
    If `property@EntryRow:show-apply-button` is set to `TRUE`, [adw.entry_row.EntryRow] can
    show an apply button when editing its contents. This can be useful if
    changing its contents can result in an expensive operation, such as network
    activity.
    
    [adw.entry_row.EntryRow] provides only minimal API and should be used with the
    [gtk.editable.Editable] API.
    
    See also `class@PasswordEntryRow`.
    
    ## AdwEntryRow as GtkBuildable
    
    The [adw.entry_row.EntryRow] implementation of the [gtk.buildable.Buildable] interface
    supports adding a child at its end by specifying “suffix” or omitting the
    “type” attribute of a <child> element.
    
    It also supports adding a child as a prefix widget by specifying “prefix” as
    the “type” attribute of a <child> element.
    
    ## CSS nodes
    
    [adw.entry_row.EntryRow] has a single CSS node with name `row` and the `.entry` style
    class.
*/
class EntryRow : adw.preferences_row.PreferencesRow, gtk.editable.Editable
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_entry_row_get_type != &gidSymbolNotFound ? adw_entry_row_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override EntryRow self()
  {
    return this;
  }

  mixin EditableT!();

  /**
      Creates a new [adw.entry_row.EntryRow].
      Returns: the newly created [adw.entry_row.EntryRow]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_entry_row_new();
    this(_cretval, No.Take);
  }

  /**
      Adds a prefix widget to self.
  
      Params:
        widget = a widget
  */
  void addPrefix(gtk.widget.Widget widget)
  {
    adw_entry_row_add_prefix(cast(AdwEntryRow*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
  }

  /**
      Adds a suffix widget to self.
  
      Params:
        widget = a widget
  */
  void addSuffix(gtk.widget.Widget widget)
  {
    adw_entry_row_add_suffix(cast(AdwEntryRow*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
  }

  /**
      Gets whether activating the embedded entry can activate the default widget.
      Returns: whether to activate the default widget
  */
  bool getActivatesDefault()
  {
    bool _retval;
    _retval = adw_entry_row_get_activates_default(cast(AdwEntryRow*)cPtr);
    return _retval;
  }

  /**
      Gets Pango attributes applied to the text of the embedded entry.
      Returns: the list of attributes
  */
  pango.attr_list.AttrList getAttributes()
  {
    PangoAttrList* _cretval;
    _cretval = adw_entry_row_get_attributes(cast(AdwEntryRow*)cPtr);
    auto _retval = _cretval ? new pango.attr_list.AttrList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets whether to suggest emoji replacements on self.
      Returns: whether or not emoji completion is enabled
  */
  bool getEnableEmojiCompletion()
  {
    bool _retval;
    _retval = adw_entry_row_get_enable_emoji_completion(cast(AdwEntryRow*)cPtr);
    return _retval;
  }

  /**
      Gets the additional input hints of self.
      Returns: The input hints
  */
  gtk.types.InputHints getInputHints()
  {
    GtkInputHints _cretval;
    _cretval = adw_entry_row_get_input_hints(cast(AdwEntryRow*)cPtr);
    gtk.types.InputHints _retval = cast(gtk.types.InputHints)_cretval;
    return _retval;
  }

  /**
      Gets the input purpose of self.
      Returns: the input purpose
  */
  gtk.types.InputPurpose getInputPurpose()
  {
    GtkInputPurpose _cretval;
    _cretval = adw_entry_row_get_input_purpose(cast(AdwEntryRow*)cPtr);
    gtk.types.InputPurpose _retval = cast(gtk.types.InputPurpose)_cretval;
    return _retval;
  }

  /**
      Gets whether self can show the apply button.
      Returns: whether to show the apply button
  */
  bool getShowApplyButton()
  {
    bool _retval;
    _retval = adw_entry_row_get_show_apply_button(cast(AdwEntryRow*)cPtr);
    return _retval;
  }

  /**
      Retrieves the current length of the text in self.
      Returns: The current number of characters in self, or 0 if there are none.
  */
  uint getTextLength()
  {
    uint _retval;
    _retval = adw_entry_row_get_text_length(cast(AdwEntryRow*)cPtr);
    return _retval;
  }

  /**
      Causes self to have keyboard focus without selecting the text.
      
      See [gtk.text.Text.grabFocusWithoutSelecting] for more information.
      Returns: whether the focus is now inside self
  */
  bool grabFocusWithoutSelecting()
  {
    bool _retval;
    _retval = adw_entry_row_grab_focus_without_selecting(cast(AdwEntryRow*)cPtr);
    return _retval;
  }

  /**
      Removes a child from self.
  
      Params:
        widget = the child to be removed
  */
  void remove(gtk.widget.Widget widget)
  {
    adw_entry_row_remove(cast(AdwEntryRow*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
  }

  /**
      Sets whether activating the embedded entry can activate the default widget.
  
      Params:
        activates = whether to activate the default widget
  */
  void setActivatesDefault(bool activates)
  {
    adw_entry_row_set_activates_default(cast(AdwEntryRow*)cPtr, activates);
  }

  /**
      Sets Pango attributes to apply to the text of the embedded entry.
      
      The [pango.attribute.Attribute]'s `start_index` and `end_index` must refer to
      the [gtk.entry_buffer.EntryBuffer] text, i.e. without the preedit string.
  
      Params:
        attributes = a list of attributes
  */
  void setAttributes(pango.attr_list.AttrList attributes = null)
  {
    adw_entry_row_set_attributes(cast(AdwEntryRow*)cPtr, attributes ? cast(PangoAttrList*)attributes.cPtr(No.Dup) : null);
  }

  /**
      Sets whether to suggest emoji replacements on self.
      
      Emoji replacement is done with :-delimited names, like `:heart:`.
  
      Params:
        enableEmojiCompletion = Whether emoji completion should be enabled or not
  */
  void setEnableEmojiCompletion(bool enableEmojiCompletion)
  {
    adw_entry_row_set_enable_emoji_completion(cast(AdwEntryRow*)cPtr, enableEmojiCompletion);
  }

  /**
      Set additional input hints for self.
      
      Input hints allow input methods to fine-tune their behavior.
      
      See also: `propertyAdwEntryRow:input-purpose`
  
      Params:
        hints = the hints
  */
  void setInputHints(gtk.types.InputHints hints)
  {
    adw_entry_row_set_input_hints(cast(AdwEntryRow*)cPtr, hints);
  }

  /**
      Sets the input purpose of self.
      
      The input purpose can be used by input methods to adjust their behavior.
  
      Params:
        purpose = the purpose
  */
  void setInputPurpose(gtk.types.InputPurpose purpose)
  {
    adw_entry_row_set_input_purpose(cast(AdwEntryRow*)cPtr, purpose);
  }

  /**
      Sets whether self can show the apply button.
      
      When set to `TRUE`, typing text in the entry will reveal an apply button.
      Clicking it or pressing the <kbd>Enter</kbd> key will hide the button and
      emit the `signalEntryRow::apply` signal.
      
      This is useful if changing the entry contents can trigger an expensive
      operation, e.g. network activity, to avoid triggering it after typing every
      character.
  
      Params:
        showApplyButton = whether to show the apply button
  */
  void setShowApplyButton(bool showApplyButton)
  {
    adw_entry_row_set_show_apply_button(cast(AdwEntryRow*)cPtr, showApplyButton);
  }

  /**
      Connect to `Apply` signal.
  
      Emitted when the apply button is pressed.
      
      See `propertyEntryRow:show-apply-button`.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(adw.entry_row.EntryRow entryRow))
  
          `entryRow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectApply(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.entry_row.EntryRow)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("apply", closure, after);
  }

  /**
      Connect to `EntryActivated` signal.
  
      Emitted when the embedded entry is activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(adw.entry_row.EntryRow entryRow))
  
          `entryRow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEntryActivated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.entry_row.EntryRow)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("entry-activated", closure, after);
  }
}
