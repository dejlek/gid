module gtk.text_tag;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A tag that can be applied to text contained in a [gtk.text_buffer.TextBuffer].
  
  You may wish to begin by reading the
  [text widget conceptual overview](section-text-widget.html),
  which gives an overview of all the objects and data types
  related to the text widget and how they work together.
  
  Tags should be in the [gtk.text_tag_table.TextTagTable] for a given
  [gtk.text_buffer.TextBuffer] before using them with that buffer.
  
  [gtk.text_buffer.TextBuffer.createTag] is the best way to create tags.
  See “gtk4-demo” for numerous examples.
  
  For each property of [gtk.text_tag.TextTag], there is a “set” property, e.g.
  “font-set” corresponds to “font”. These “set” properties reflect
  whether a property has been set or not.
  
  They are maintained by GTK and you should not set them independently.
*/
class TextTag : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_text_tag_get_type != &gidSymbolNotFound ? gtk_text_tag_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override TextTag self()
  {
    return this;
  }

  /**
      Creates a [gtk.text_tag.TextTag].
    Params:
      name =       tag name
    Returns:     a new [gtk.text_tag.TextTag]
  */
  this(string name = null)
  {
    GtkTextTag* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_text_tag_new(_name);
    this(_cretval, Yes.Take);
  }

  /**
      Emits the `signalGtk.TextTagTable::tag-changed` signal on the
    [gtk.text_tag_table.TextTagTable] where the tag is included.
    
    The signal is already emitted when setting a [gtk.text_tag.TextTag] property.
    This function is useful for a [gtk.text_tag.TextTag] subclass.
    Params:
      sizeChanged =       whether the change affects the [gtk.text_view.TextView] layout
  */
  void changed(bool sizeChanged)
  {
    gtk_text_tag_changed(cast(GtkTextTag*)cPtr, sizeChanged);
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
      Sets the priority of a [gtk.text_tag.TextTag].
    
    Valid priorities start at 0 and go to one less than
    [gtk.text_tag_table.TextTagTable.getSize]. Each tag in a table
    has a unique priority; setting the priority of one tag shifts
    the priorities of all the other tags in the table to maintain
    a unique priority for each tag.
    
    Higher priority tags “win” if two tags both set the same text
    attribute. When adding a tag to a tag table, it will be assigned
    the highest priority in the table by default; so normally the
    precedence of a set of tags is the order in which they were added
    to the table, or created with [gtk.text_buffer.TextBuffer.createTag],
    which adds the tag to the buffer’s table automatically.
    Params:
      priority =       the new priority
  */
  void setPriority(int priority)
  {
    gtk_text_tag_set_priority(cast(GtkTextTag*)cPtr, priority);
  }
}
