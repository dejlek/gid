/// Module for [SimpleIOStream] class
module gio.simple_iostream;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.input_stream;
import gio.iostream;
import gio.output_stream;
import gio.types;

/**
    [gio.simple_iostream.SimpleIOStream] creates a [gio.iostream.IOStream] from an arbitrary
    [gio.input_stream.InputStream] and [gio.output_stream.OutputStream]. This allows any pair of
    input and output streams to be used with [gio.iostream.IOStream] methods.
    
    This is useful when you obtained a [gio.input_stream.InputStream] and a
    [gio.output_stream.OutputStream] by other means, for instance creating them with
    platform specific methods as
    [`[gio.unix_input_stream.UnixInputStream.new_]`](../gio-unix/ctor.UnixInputStream.new.html)
    (from `gio-unix-2.0.pc` / `GioUnix-2.0`), and you want to
    take advantage of the methods provided by [gio.iostream.IOStream].
*/
class SimpleIOStream : gio.iostream.IOStream
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_simple_io_stream_get_type != &gidSymbolNotFound ? g_simple_io_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SimpleIOStream self()
  {
    return this;
  }

  /**
      Creates a new #GSimpleIOStream wrapping input_stream and output_stream.
      See also #GIOStream.
  
      Params:
        inputStream = a #GInputStream.
        outputStream = a #GOutputStream.
      Returns: a new #GSimpleIOStream instance.
  */
  this(gio.input_stream.InputStream inputStream, gio.output_stream.OutputStream outputStream)
  {
    GIOStream* _cretval;
    _cretval = g_simple_io_stream_new(inputStream ? cast(GInputStream*)inputStream.cPtr(No.Dup) : null, outputStream ? cast(GOutputStream*)outputStream.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
