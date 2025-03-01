module glib.test_log_buffer;

import gid.global;
import glib.c.functions;
import glib.c.types;
import glib.types;

class TestLogBuffer
{
  GTestLogBuffer cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GLib.TestLogBuffer");

    cInstance = *cast(GTestLogBuffer*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
   * Internal function for gtester to decode test log messages, no ABI guarantees provided.
   * Params:
   *   bytes =
   */
  void push(ubyte[] bytes)
  {
    uint _nBytes;
    if (bytes)
      _nBytes = cast(uint)bytes.length;

    auto _bytes = cast(const(ubyte)*)bytes.ptr;
    g_test_log_buffer_push(cast(GTestLogBuffer*)cPtr, _nBytes, _bytes);
  }
}
