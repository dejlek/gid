module gtk.binding_signal;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A GtkBindingSignal stores the necessary information to
  activate a widget in response to a key press via a signal
  emission.
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
      gFree(ptr);
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
    return cToD!(string)(cast(void*)(cast(GtkBindingSignal*)cPtr).signalName);
  }

  @property void signalName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkBindingSignal*)cPtr).signalName);
    dToC(propval, cast(void*)&(cast(GtkBindingSignal*)cPtr).signalName);
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
