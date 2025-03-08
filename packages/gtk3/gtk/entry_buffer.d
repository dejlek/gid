module gtk.entry_buffer;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    The #GtkEntryBuffer class contains the actual text displayed in a
  #GtkEntry widget.
  
  A single #GtkEntryBuffer object can be shared by multiple #GtkEntry
  widgets which will then share the same text content, but not the cursor
  position, visibility attributes, icon etc.
  
  #GtkEntryBuffer may be derived from. Such a derived class might allow
  text to be stored in an alternate location, such as non-pageable memory,
  useful in the case of important passwords. Or a derived class could
  integrate with an application’s concept of undo/redo.
*/
class EntryBuffer : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_entry_buffer_get_type != &gidSymbolNotFound ? gtk_entry_buffer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Create a new GtkEntryBuffer object.
    
    Optionally, specify initial text to set in the buffer.
    Params:
      initialChars =       initial buffer text, or null
      nInitialChars =       number of characters in initial_chars, or -1
    Returns:     A new GtkEntryBuffer object.
  */
  this(string initialChars, int nInitialChars)
  {
    GtkEntryBuffer* _cretval;
    const(char)* _initialChars = initialChars.toCString(No.alloc);
    _cretval = gtk_entry_buffer_new(_initialChars, nInitialChars);
    this(_cretval, Yes.take);
  }

  /**
      Deletes a sequence of characters from the buffer. n_chars characters are
    deleted starting at position. If n_chars is negative, then all characters
    until the end of the text are deleted.
    
    If position or n_chars are out of bounds, then they are coerced to sane
    values.
    
    Note that the positions are specified in characters, not bytes.
    Params:
      position =       position at which to delete text
      nChars =       number of characters to delete
    Returns:     The number of characters deleted.
  */
  uint deleteText(uint position, int nChars)
  {
    uint _retval;
    _retval = gtk_entry_buffer_delete_text(cast(GtkEntryBuffer*)cPtr, position, nChars);
    return _retval;
  }

  /**
      Used when subclassing #GtkEntryBuffer
    Params:
      position =       position at which text was deleted
      nChars =       number of characters deleted
  */
  void emitDeletedText(uint position, uint nChars)
  {
    gtk_entry_buffer_emit_deleted_text(cast(GtkEntryBuffer*)cPtr, position, nChars);
  }

  /**
      Used when subclassing #GtkEntryBuffer
    Params:
      position =       position at which text was inserted
      chars =       text that was inserted
      nChars =       number of characters inserted
  */
  void emitInsertedText(uint position, string chars, uint nChars)
  {
    const(char)* _chars = chars.toCString(No.alloc);
    gtk_entry_buffer_emit_inserted_text(cast(GtkEntryBuffer*)cPtr, position, _chars, nChars);
  }

  /**
      Retrieves the length in bytes of the buffer.
    See [gtk.entry_buffer.EntryBuffer.getLength].
    Returns:     The byte length of the buffer.
  */
  size_t getBytes()
  {
    size_t _retval;
    _retval = gtk_entry_buffer_get_bytes(cast(GtkEntryBuffer*)cPtr);
    return _retval;
  }

  /**
      Retrieves the length in characters of the buffer.
    Returns:     The number of characters in the buffer.
  */
  uint getLength()
  {
    uint _retval;
    _retval = gtk_entry_buffer_get_length(cast(GtkEntryBuffer*)cPtr);
    return _retval;
  }

  /**
      Retrieves the maximum allowed length of the text in
    buffer. See [gtk.entry_buffer.EntryBuffer.setMaxLength].
    Returns:     the maximum allowed number of characters
                    in #GtkEntryBuffer, or 0 if there is no maximum.
  */
  int getMaxLength()
  {
    int _retval;
    _retval = gtk_entry_buffer_get_max_length(cast(GtkEntryBuffer*)cPtr);
    return _retval;
  }

  /**
      Retrieves the contents of the buffer.
    
    The memory pointer returned by this call will not change
    unless this object emits a signal, or is finalized.
    Returns:     a pointer to the contents of the widget as a
           string. This string points to internally allocated
           storage in the buffer and must not be freed, modified or
           stored.
  */
  string getText()
  {
    const(char)* _cretval;
    _cretval = gtk_entry_buffer_get_text(cast(GtkEntryBuffer*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Inserts n_chars characters of chars into the contents of the
    buffer, at position position.
    
    If n_chars is negative, then characters from chars will be inserted
    until a null-terminator is found. If position or n_chars are out of
    bounds, or the maximum buffer text length is exceeded, then they are
    coerced to sane values.
    
    Note that the position and length are in characters, not in bytes.
    Params:
      position =       the position at which to insert text.
      chars =       the text to insert into the buffer.
      nChars =       the length of the text in characters, or -1
    Returns:     The number of characters actually inserted.
  */
  uint insertText(uint position, string chars, int nChars)
  {
    uint _retval;
    const(char)* _chars = chars.toCString(No.alloc);
    _retval = gtk_entry_buffer_insert_text(cast(GtkEntryBuffer*)cPtr, position, _chars, nChars);
    return _retval;
  }

  /**
      Sets the maximum allowed length of the contents of the buffer. If
    the current contents are longer than the given length, then they
    will be truncated to fit.
    Params:
      maxLength =       the maximum length of the entry buffer, or 0 for no maximum.
          (other than the maximum length of entries.) The value passed in will
          be clamped to the range 0-65536.
  */
  void setMaxLength(int maxLength)
  {
    gtk_entry_buffer_set_max_length(cast(GtkEntryBuffer*)cPtr, maxLength);
  }

  /**
      Sets the text in the buffer.
    
    This is roughly equivalent to calling [gtk.entry_buffer.EntryBuffer.deleteText]
    and [gtk.entry_buffer.EntryBuffer.insertText].
    
    Note that n_chars is in characters, not in bytes.
    Params:
      chars =       the new text
      nChars =       the number of characters in text, or -1
  */
  void setText(string chars, int nChars)
  {
    const(char)* _chars = chars.toCString(No.alloc);
    gtk_entry_buffer_set_text(cast(GtkEntryBuffer*)cPtr, _chars, nChars);
  }

  /**
      This signal is emitted after text is deleted from the buffer.
  
    ## Parameters
    $(LIST
      * $(B position)       the position the text was deleted at.
      * $(B nChars)       The number of characters that were deleted.
      * $(B entryBuffer) the instance the signal is connected to
    )
  */
  alias DeletedTextCallbackDlg = void delegate(uint position, uint nChars, gtk.entry_buffer.EntryBuffer entryBuffer);

  /** ditto */
  alias DeletedTextCallbackFunc = void function(uint position, uint nChars, gtk.entry_buffer.EntryBuffer entryBuffer);

  /**
    Connect to DeletedText signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectDeletedText(T)(T callback, Flag!"after" after = No.after)
  if (is(T : DeletedTextCallbackDlg) || is(T : DeletedTextCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto entryBuffer = getVal!(gtk.entry_buffer.EntryBuffer)(_paramVals);
      auto position = getVal!(uint)(&_paramVals[1]);
      auto nChars = getVal!(uint)(&_paramVals[2]);
      _dClosure.dlg(position, nChars, entryBuffer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("deleted-text", closure, after);
  }

  /**
      This signal is emitted after text is inserted into the buffer.
  
    ## Parameters
    $(LIST
      * $(B position)       the position the text was inserted at.
      * $(B chars)       The text that was inserted.
      * $(B nChars)       The number of characters that were inserted.
      * $(B entryBuffer) the instance the signal is connected to
    )
  */
  alias InsertedTextCallbackDlg = void delegate(uint position, string chars, uint nChars, gtk.entry_buffer.EntryBuffer entryBuffer);

  /** ditto */
  alias InsertedTextCallbackFunc = void function(uint position, string chars, uint nChars, gtk.entry_buffer.EntryBuffer entryBuffer);

  /**
    Connect to InsertedText signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectInsertedText(T)(T callback, Flag!"after" after = No.after)
  if (is(T : InsertedTextCallbackDlg) || is(T : InsertedTextCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto entryBuffer = getVal!(gtk.entry_buffer.EntryBuffer)(_paramVals);
      auto position = getVal!(uint)(&_paramVals[1]);
      auto chars = getVal!(string)(&_paramVals[2]);
      auto nChars = getVal!(uint)(&_paramVals[3]);
      _dClosure.dlg(position, chars, nChars, entryBuffer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("inserted-text", closure, after);
  }
}
