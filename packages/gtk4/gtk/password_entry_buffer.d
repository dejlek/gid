/// Module for [PasswordEntryBuffer] class
module gtk.password_entry_buffer;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.entry_buffer;
import gtk.types;

/**
    A [gtk.entry_buffer.EntryBuffer] that locks the underlying memory to prevent it
    from being swapped to disk.
    
    [gtk.password_entry.PasswordEntry] uses a [gtk.password_entry_buffer.PasswordEntryBuffer].
*/
class PasswordEntryBuffer : gtk.entry_buffer.EntryBuffer
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_password_entry_buffer_get_type != &gidSymbolNotFound ? gtk_password_entry_buffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PasswordEntryBuffer self()
  {
    return this;
  }

  /**
      Creates a new [gtk.entry_buffer.EntryBuffer] using secure memory allocations.
      Returns: the newly created instance
  */
  this()
  {
    GtkEntryBuffer* _cretval;
    _cretval = gtk_password_entry_buffer_new();
    this(_cretval, Yes.Take);
  }
}
