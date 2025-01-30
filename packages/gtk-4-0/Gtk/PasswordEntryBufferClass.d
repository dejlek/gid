module Gtk.PasswordEntryBufferClass;

import Gid.gid;
import Gtk.EntryBufferClass;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

class PasswordEntryBufferClass
{
  GtkPasswordEntryBufferClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.PasswordEntryBufferClass");

    cInstance = *cast(GtkPasswordEntryBufferClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property EntryBufferClass parentClass()
  {
    return new EntryBufferClass(cast(GtkEntryBufferClass*)&(cast(GtkPasswordEntryBufferClass*)cPtr).parentClass);
  }
}
