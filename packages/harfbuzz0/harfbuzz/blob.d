module harfbuzz.blob;

import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Data type for blobs. A blob wraps a chunk of binary
  data and facilitates its lifecycle management between
  a client program and HarfBuzz.
*/
class Blob : gobject.boxed.Boxed
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_blob_get_type != &gidSymbolNotFound ? hb_gobject_blob_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }
}
