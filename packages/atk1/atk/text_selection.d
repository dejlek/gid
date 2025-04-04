/// Module for [TextSelection] class
module atk.text_selection;

import atk.c.functions;
import atk.c.types;
import atk.object;
import atk.types;
import gid.gid;

/**
    This structure represents a single  text selection within a document. This
    selection is defined by two points in the content, where each one is defined
    by an AtkObject supporting the AtkText interface and a character offset
    relative to it.
    
    The end object must appear after the start object in the accessibility tree,
    i.e. the end object must be reachable from the start object by navigating
    forward (next, first child etc).
    
    This struct also contains a @start_is_active boolean, to communicate if the
    start of the selection is the active point or not.
    
    The active point corresponds to the user's focus or point of interest. The
    user moves the active point to expand or collapse the range. The anchor
    point is the other point of the range and typically remains constant. In
    most cases, anchor is the start of the range and active is the end. However,
    when selecting backwards (e.g. pressing shift+left arrow in a text field),
    the start of the range is the active point, as the user moves this to
    manipulate the selection.
*/
class TextSelection
{
  AtkTextSelection cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Atk.TextSelection");

    cInstance = *cast(AtkTextSelection*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property atk.object.ObjectAtk startObject()
  {
    return cToD!(atk.object.ObjectAtk)(cast(void*)(cast(AtkTextSelection*)cPtr).startObject);
  }

  @property void startObject(atk.object.ObjectAtk propval)
  {
    cValueFree!(atk.object.ObjectAtk)(cast(void*)(cast(AtkTextSelection*)cPtr).startObject);
    dToC(propval, cast(void*)&(cast(AtkTextSelection*)cPtr).startObject);
  }

  @property int startOffset()
  {
    return (cast(AtkTextSelection*)cPtr).startOffset;
  }

  @property void startOffset(int propval)
  {
    (cast(AtkTextSelection*)cPtr).startOffset = propval;
  }

  @property atk.object.ObjectAtk endObject()
  {
    return cToD!(atk.object.ObjectAtk)(cast(void*)(cast(AtkTextSelection*)cPtr).endObject);
  }

  @property void endObject(atk.object.ObjectAtk propval)
  {
    cValueFree!(atk.object.ObjectAtk)(cast(void*)(cast(AtkTextSelection*)cPtr).endObject);
    dToC(propval, cast(void*)&(cast(AtkTextSelection*)cPtr).endObject);
  }

  @property int endOffset()
  {
    return (cast(AtkTextSelection*)cPtr).endOffset;
  }

  @property void endOffset(int propval)
  {
    (cast(AtkTextSelection*)cPtr).endOffset = propval;
  }

  @property bool startIsActive()
  {
    return (cast(AtkTextSelection*)cPtr).startIsActive;
  }

  @property void startIsActive(bool propval)
  {
    (cast(AtkTextSelection*)cPtr).startIsActive = propval;
  }
}
