module Gio.SimpleIOStream;

import Gid.gid;
import Gio.IOStream;
import Gio.InputStream;
import Gio.OutputStream;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * `GSimpleIOStream` creates a [Gio.IOStream] from an arbitrary
 * [Gio.InputStream] and [Gio.OutputStream]. This allows any pair of
 * input and output streams to be used with [Gio.IOStream] methods.
 * This is useful when you obtained a [Gio.InputStream] and a
 * [Gio.OutputStream] by other means, for instance creating them with
 * platform specific methods as
 * [`[Gio.UnixInputStream.new_]`](../gio-unix/ctor.UnixInputStream.new.html)
 * $(LPAREN)from `gio-unix-2.0.pc` / `GioUnix-2.0`$(RPAREN), and you want to
 * take advantage of the methods provided by [Gio.IOStream].
 */
class SimpleIOStream : IOStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())g_simple_io_stream_get_type != &gidSymbolNotFound ? g_simple_io_stream_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new #GSimpleIOStream wrapping input_stream and output_stream.
   * See also #GIOStream.
   * Params:
   *   inputStream = a #GInputStream.
   *   outputStream = a #GOutputStream.
   * Returns: a new #GSimpleIOStream instance.
   */
  this(InputStream inputStream, OutputStream outputStream)
  {
    GIOStream* _cretval;
    _cretval = g_simple_io_stream_new(inputStream ? cast(GInputStream*)inputStream.cPtr(No.Dup) : null, outputStream ? cast(GOutputStream*)outputStream.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
