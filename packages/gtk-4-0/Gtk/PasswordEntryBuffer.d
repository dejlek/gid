module Gtk.PasswordEntryBuffer;

import Gid.gid;
import Gtk.EntryBuffer;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * A `GtkEntryBuffer` that locks the underlying memory to prevent it
 * from being swapped to disk.
 * `GtkPasswordEntry` uses a `GtkPasswordEntryBuffer`.
 */
class PasswordEntryBuffer : EntryBuffer
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_password_entry_buffer_get_type != &gidSymbolNotFound ? gtk_password_entry_buffer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkEntryBuffer` using secure memory allocations.
   * Returns: the newly created instance
   */
  this()
  {
    GtkEntryBuffer* _cretval;
    _cretval = gtk_password_entry_buffer_new();
    this(_cretval, Yes.Take);
  }
}
