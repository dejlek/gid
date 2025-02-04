module HarfBuzz.Buffer;

import GObject.Boxed;
import Gid.gid;
import HarfBuzz.Types;
import HarfBuzz.c.functions;
import HarfBuzz.c.types;

/**
 * The main structure holding the input text and its properties before shaping,
 * and output glyphs and their information after shaping.
 */
class Buffer : Boxed
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getType()
  {
    return hb_gobject_buffer_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }
}
