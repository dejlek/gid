module gtk.binding_signal;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
 * A GtkBindingSignal stores the necessary information to
 * activate a widget in response to a key press via a signal
 * emission.
 */
class BindingSignal
{
  GtkBindingSignal cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.BindingSignal");

    cInstance = *cast(GtkBindingSignal*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gtk.binding_signal.BindingSignal next()
  {
    return new gtk.binding_signal.BindingSignal(cast(GtkBindingSignal*)(cast(GtkBindingSignal*)cPtr).next);
  }

  @property string signalName()
  {
    return (cast(GtkBindingSignal*)cPtr).signalName.fromCString(No.Free);
  }

  @property void signalName(string propval)
  {
    safeFree(cast(void*)(cast(GtkBindingSignal*)cPtr).signalName);
    (cast(GtkBindingSignal*)cPtr).signalName = propval.toCString(Yes.Alloc);
  }

  @property uint nArgs()
  {
    return (cast(GtkBindingSignal*)cPtr).nArgs;
  }

  @property void nArgs(uint propval)
  {
    (cast(GtkBindingSignal*)cPtr).nArgs = propval;
  }
}
