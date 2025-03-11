module gtk.binding_entry;

import gdk.types;
import gid.gid;
import glib.types;
import gtk.binding_set;
import gtk.binding_signal;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    Each key binding element of a binding sets binding list is
  represented by a GtkBindingEntry.
*/
class BindingEntry
{
  GtkBindingEntry cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.BindingEntry");

    cInstance = *cast(GtkBindingEntry*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property uint keyval()
  {
    return (cast(GtkBindingEntry*)cPtr).keyval;
  }

  @property void keyval(uint propval)
  {
    (cast(GtkBindingEntry*)cPtr).keyval = propval;
  }

  @property gdk.types.ModifierType modifiers()
  {
    return cast(gdk.types.ModifierType)(cast(GtkBindingEntry*)cPtr).modifiers;
  }

  @property void modifiers(gdk.types.ModifierType propval)
  {
    (cast(GtkBindingEntry*)cPtr).modifiers = cast(GdkModifierType)propval;
  }

  @property gtk.binding_set.BindingSet bindingSet()
  {
    return new gtk.binding_set.BindingSet(cast(GtkBindingSet*)(cast(GtkBindingEntry*)cPtr).bindingSet);
  }

  @property uint destroyed()
  {
    return (cast(GtkBindingEntry*)cPtr).destroyed;
  }

  @property void destroyed(uint propval)
  {
    (cast(GtkBindingEntry*)cPtr).destroyed = propval;
  }

  @property uint inEmission()
  {
    return (cast(GtkBindingEntry*)cPtr).inEmission;
  }

  @property void inEmission(uint propval)
  {
    (cast(GtkBindingEntry*)cPtr).inEmission = propval;
  }

  @property uint marksUnbound()
  {
    return (cast(GtkBindingEntry*)cPtr).marksUnbound;
  }

  @property void marksUnbound(uint propval)
  {
    (cast(GtkBindingEntry*)cPtr).marksUnbound = propval;
  }

  @property gtk.binding_entry.BindingEntry setNext()
  {
    return new gtk.binding_entry.BindingEntry(cast(GtkBindingEntry*)(cast(GtkBindingEntry*)cPtr).setNext);
  }

  @property gtk.binding_entry.BindingEntry hashNext()
  {
    return new gtk.binding_entry.BindingEntry(cast(GtkBindingEntry*)(cast(GtkBindingEntry*)cPtr).hashNext);
  }

  @property gtk.binding_signal.BindingSignal signals()
  {
    return new gtk.binding_signal.BindingSignal(cast(GtkBindingSignal*)(cast(GtkBindingEntry*)cPtr).signals);
  }

  /**
      Parses a signal description from signal_desc and incorporates
    it into binding_set.
    
    Signal descriptions may either bind a key combination to
    one or more signals:
    ```
      bind "key" {
        "signalname" (param, ...)
        ...
      }
    ```
    
    Or they may also unbind a key combination:
    ```
      unbind "key"
    ```
    
    Key combinations must be in a format that can be parsed by
    [gtk.global.acceleratorParse].
    Params:
      bindingSet =       a #GtkBindingSet
      signalDesc =       a signal description
    Returns:     `G_TOKEN_NONE` if the signal was successfully parsed and added,
          the expected token otherwise
  */
  static glib.types.TokenType addSignalFromString(gtk.binding_set.BindingSet bindingSet, string signalDesc)
  {
    GTokenType _cretval;
    const(char)* _signalDesc = signalDesc.toCString(No.Alloc);
    _cretval = gtk_binding_entry_add_signal_from_string(bindingSet ? cast(GtkBindingSet*)bindingSet.cPtr : null, _signalDesc);
    glib.types.TokenType _retval = cast(glib.types.TokenType)_cretval;
    return _retval;
  }

  /**
      Remove a binding previously installed via
    [gtk.binding_entry.BindingEntry.addSignal] on binding_set.
    Params:
      bindingSet =       a #GtkBindingSet to remove an entry of
      keyval =       key value of binding to remove
      modifiers =       key modifier of binding to remove
  */
  static void remove(gtk.binding_set.BindingSet bindingSet, uint keyval, gdk.types.ModifierType modifiers)
  {
    gtk_binding_entry_remove(bindingSet ? cast(GtkBindingSet*)bindingSet.cPtr : null, keyval, modifiers);
  }

  /**
      Install a binding on binding_set which causes key lookups
    to be aborted, to prevent bindings from lower priority sets
    to be activated.
    Params:
      bindingSet =       a #GtkBindingSet to skip an entry of
      keyval =       key value of binding to skip
      modifiers =       key modifier of binding to skip
  */
  static void skip(gtk.binding_set.BindingSet bindingSet, uint keyval, gdk.types.ModifierType modifiers)
  {
    gtk_binding_entry_skip(bindingSet ? cast(GtkBindingSet*)bindingSet.cPtr : null, keyval, modifiers);
  }
}
