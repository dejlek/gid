/// Module for [BindingSet] class
module gtk.binding_set;

import gdk.types;
import gid.gid;
import gobject.object;
import gtk.binding_entry;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A binding set maintains a list of activatable key bindings.
    A single binding set can match multiple types of widgets.
    Similar to style contexts, can be matched by any information contained
    in a widgets #GtkWidgetPath. When a binding within a set is matched upon
    activation, an action signal is emitted on the target widget to carry out
    the actual activation.
*/
class BindingSet
{
  GtkBindingSet cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.BindingSet");

    cInstance = *cast(GtkBindingSet*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string setName()
  {
    return cToD!(string)(cast(void*)(cast(GtkBindingSet*)cPtr).setName);
  }

  @property void setName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkBindingSet*)cPtr).setName);
    dToC(propval, cast(void*)&(cast(GtkBindingSet*)cPtr).setName);
  }

  @property int priority()
  {
    return (cast(GtkBindingSet*)cPtr).priority;
  }

  @property void priority(int propval)
  {
    (cast(GtkBindingSet*)cPtr).priority = propval;
  }

  @property gtk.binding_entry.BindingEntry entries()
  {
    return new gtk.binding_entry.BindingEntry(cast(GtkBindingEntry*)(cast(GtkBindingSet*)cPtr).entries);
  }

  @property gtk.binding_entry.BindingEntry current()
  {
    return new gtk.binding_entry.BindingEntry(cast(GtkBindingEntry*)(cast(GtkBindingSet*)cPtr).current);
  }

  @property uint parsed()
  {
    return (cast(GtkBindingSet*)cPtr).parsed;
  }

  @property void parsed(uint propval)
  {
    (cast(GtkBindingSet*)cPtr).parsed = propval;
  }

  /**
      Find a key binding matching keyval and modifiers within
      binding_set and activate the binding on object.
  
      Params:
        keyval = key value of the binding
        modifiers = key modifier of the binding
        object = object to activate when binding found
      Returns: true if a binding was found and activated
  */
  bool activate(uint keyval, gdk.types.ModifierType modifiers, gobject.object.ObjectG object)
  {
    bool _retval;
    _retval = gtk_binding_set_activate(cast(GtkBindingSet*)cPtr, keyval, modifiers, object ? cast(ObjectC*)object.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      This function was used internally by the GtkRC parsing mechanism
      to assign match patterns to #GtkBindingSet structures.
      
      In GTK+ 3, these match patterns are unused.
  
      Params:
        pathType = path type the pattern applies to
        pathPattern = the actual match pattern
        priority = binding priority
  */
  void addPath(gtk.types.PathType pathType, string pathPattern, gtk.types.PathPriorityType priority)
  {
    const(char)* _pathPattern = pathPattern.toCString(No.Alloc);
    gtk_binding_set_add_path(cast(GtkBindingSet*)cPtr, pathType, _pathPattern, priority);
  }

  /**
      Find a binding set by its globally unique name.
      
      The set_name can either be a name used for [gtk.binding_set.BindingSet.new_]
      or the type name of a class used in [gtk.binding_set.BindingSet.byClass].
  
      Params:
        setName = unique binding set name
      Returns: null or the specified binding set
  */
  static gtk.binding_set.BindingSet find(string setName)
  {
    GtkBindingSet* _cretval;
    const(char)* _setName = setName.toCString(No.Alloc);
    _cretval = gtk_binding_set_find(_setName);
    auto _retval = _cretval ? new gtk.binding_set.BindingSet(cast(GtkBindingSet*)_cretval) : null;
    return _retval;
  }
}
