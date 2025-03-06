module gtk.text_tag;

import gdk.event;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.text_iter;
import gtk.types;

/**
    You may wish to begin by reading the
  [text widget conceptual overview](TextWidget.html)
  which gives an overview of all the objects and
  data types related to the text widget and how they work together.
  
  Tags should be in the #GtkTextTagTable for a given #GtkTextBuffer
  before using them with that buffer.
  
  [gtk.text_buffer.TextBuffer.createTag] is the best way to create tags.
  See “gtk3-demo” for numerous examples.
  
  For each property of #GtkTextTag, there is a “set” property, e.g.
  “font-set” corresponds to “font”. These “set” properties reflect
  whether a property has been set or not.
  They are maintained by GTK+ and you should not set them independently.
*/
class TextTag : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_text_tag_get_type != &gidSymbolNotFound ? gtk_text_tag_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
      Creates a #GtkTextTag. Configure the tag using object arguments,
    i.e. using [gobject.object.ObjectG.set].
    Params:
      name =       tag name, or null
    Returns:     a new #GtkTextTag
  */
  this(string name = null)
  {
    GtkTextTag* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_text_tag_new(_name);
    this(_cretval, Yes.Take);
  }

  /**
      Emits the #GtkTextTagTable::tag-changed signal on the #GtkTextTagTable where
    the tag is included.
    
    The signal is already emitted when setting a #GtkTextTag property. This
    function is useful for a #GtkTextTag subclass.
    Params:
      sizeChanged =       whether the change affects the #GtkTextView layout.
  */
  void changed(bool sizeChanged)
  {
    gtk_text_tag_changed(cast(GtkTextTag*)cPtr, sizeChanged);
  }

  /**
      Emits the “event” signal on the #GtkTextTag.
    Params:
      eventObject =       object that received the event, such as a widget
      event =       the event
      iter =       location where the event was received
    Returns:     result of signal emission (whether the event was handled)
  */
  bool event(gobject.object.ObjectG eventObject, gdk.event.Event event, gtk.text_iter.TextIter iter)
  {
    bool _retval;
    _retval = gtk_text_tag_event(cast(GtkTextTag*)cPtr, eventObject ? cast(ObjectC*)eventObject.cPtr(No.Dup) : null, event ? cast(GdkEvent*)event.cPtr : null, iter ? cast(const(GtkTextIter)*)iter.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Get the tag priority.
    Returns:     The tag’s priority.
  */
  int getPriority()
  {
    int _retval;
    _retval = gtk_text_tag_get_priority(cast(GtkTextTag*)cPtr);
    return _retval;
  }

  /**
      Sets the priority of a #GtkTextTag. Valid priorities
    start at 0 and go to one less than [gtk.text_tag_table.TextTagTable.getSize].
    Each tag in a table has a unique priority; setting the priority
    of one tag shifts the priorities of all the other tags in the
    table to maintain a unique priority for each tag. Higher priority
    tags “win” if two tags both set the same text attribute. When adding
    a tag to a tag table, it will be assigned the highest priority in
    the table by default; so normally the precedence of a set of tags
    is the order in which they were added to the table, or created with
    [gtk.text_buffer.TextBuffer.createTag], which adds the tag to the buffer’s table
    automatically.
    Params:
      priority =       the new priority
  */
  void setPriority(int priority)
  {
    gtk_text_tag_set_priority(cast(GtkTextTag*)cPtr, priority);
  }

  /**
      The ::event signal is emitted when an event occurs on a region of the
    buffer marked with this tag.
  
    ## Parameters
    $(LIST
      * $(B object)       the object the event was fired from (typically a #GtkTextView)
      * $(B event)       the event which triggered the signal
      * $(B iter)       a #GtkTextIter pointing at the location the event occurred
      * $(B textTag) the instance the signal is connected to
    )
    Returns:     true to stop other handlers from being invoked for the
      event. false to propagate the event further.
  */
  alias EventCallbackDlg = bool delegate(gobject.object.ObjectG object, gdk.event.Event event, gtk.text_iter.TextIter iter, gtk.text_tag.TextTag textTag);

  /** ditto */
  alias EventCallbackFunc = bool function(gobject.object.ObjectG object, gdk.event.Event event, gtk.text_iter.TextIter iter, gtk.text_tag.TextTag textTag);

  /**
    Connect to Event signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectEvent(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EventCallbackDlg) || is(T : EventCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto textTag = getVal!(gtk.text_tag.TextTag)(_paramVals);
      auto object = getVal!(gobject.object.ObjectG)(&_paramVals[1]);
      auto event = getVal!(gdk.event.Event)(&_paramVals[2]);
      auto iter = getVal!(gtk.text_iter.TextIter)(&_paramVals[3]);
      _retval = _dClosure.dlg(object, event, iter, textTag);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("event", closure, after);
  }
}
