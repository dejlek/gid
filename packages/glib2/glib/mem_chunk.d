/// Module for [MemChunk] class
module glib.mem_chunk;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/** */
class MemChunk
{
  GMemChunk* cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GLib.MemChunk");

    cInstancePtr = cast(GMemChunk*)ptr;

    owned = take;
  }

  /** */
  void* cPtr()
  {
    return cast(void*)cInstancePtr;
  }

  /** */
  void* alloc()
  {
    auto _retval = g_mem_chunk_alloc(cast(GMemChunk*)cPtr);
    return _retval;
  }

  /** */
  void* alloc0()
  {
    auto _retval = g_mem_chunk_alloc0(cast(GMemChunk*)cPtr);
    return _retval;
  }

  /** */
  void clean()
  {
    g_mem_chunk_clean(cast(GMemChunk*)cPtr);
  }

  /** */
  void destroy()
  {
    g_mem_chunk_destroy(cast(GMemChunk*)cPtr);
  }

  /** */
  void print()
  {
    g_mem_chunk_print(cast(GMemChunk*)cPtr);
  }

  /** */
  void reset()
  {
    g_mem_chunk_reset(cast(GMemChunk*)cPtr);
  }

  /** */
  static void info()
  {
    g_mem_chunk_info();
  }
}
