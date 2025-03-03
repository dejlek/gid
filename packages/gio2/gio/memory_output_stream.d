module gio.memory_output_stream;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.output_stream;
import gio.pollable_output_stream;
import gio.pollable_output_stream_mixin;
import gio.seekable;
import gio.seekable_mixin;
import gio.types;
import glib.bytes;
import gobject.object;

/**
 * `GMemoryOutputStream` is a class for using arbitrary
 * memory chunks as output for GIO streaming output operations.
 * As of GLib 2.34, `GMemoryOutputStream` trivially implements
 * [gio.pollable_output_stream.PollableOutputStream]: it always polls as ready.
 */
class MemoryOutputStream : gio.output_stream.OutputStream, gio.pollable_output_stream.PollableOutputStream, gio.seekable.Seekable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_memory_output_stream_get_type != &gidSymbolNotFound ? g_memory_output_stream_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin PollableOutputStreamT!();
  mixin SeekableT!();

  /**
   * Creates a new #GMemoryOutputStream, using [glib.global.realloc] and [glib.global.gfree]
   * for memory allocation.
   * Returns:
   */
  static gio.memory_output_stream.MemoryOutputStream newResizable()
  {
    GOutputStream* _cretval;
    _cretval = g_memory_output_stream_new_resizable();
    auto _retval = ObjectG.getDObject!(gio.memory_output_stream.MemoryOutputStream)(cast(GOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  alias getData = gobject.object.ObjectG.getData;

  /**
   * Gets any loaded data from the ostream.
   * Note that the returned pointer may become invalid on the next
   * write or truncate operation on the stream.
   * Returns: pointer to the stream's data, or %NULL if the data
   *   has been stolen
   */
  void* getData()
  {
    auto _retval = g_memory_output_stream_get_data(cast(GMemoryOutputStream*)cPtr);
    return _retval;
  }

  /**
   * Returns the number of bytes from the start up to including the last
   * byte written in the stream that has not been truncated away.
   * Returns: the number of bytes written to the stream
   */
  size_t getDataSize()
  {
    size_t _retval;
    _retval = g_memory_output_stream_get_data_size(cast(GMemoryOutputStream*)cPtr);
    return _retval;
  }

  /**
   * Gets the size of the currently allocated data area $(LPAREN)available from
   * [gio.memory_output_stream.MemoryOutputStream.getData]$(RPAREN).
   * You probably don't want to use this function on resizable streams.
   * See [gio.memory_output_stream.MemoryOutputStream.getDataSize] instead.  For resizable
   * streams the size returned by this function is an implementation
   * detail and may be change at any time in response to operations on the
   * stream.
   * If the stream is fixed-sized $(LPAREN)ie: no realloc was passed to
   * [gio.memory_output_stream.MemoryOutputStream.new_]$(RPAREN) then this is the maximum size of the
   * stream and further writes will return %G_IO_ERROR_NO_SPACE.
   * In any case, if you want the number of bytes currently written to the
   * stream, use [gio.memory_output_stream.MemoryOutputStream.getDataSize].
   * Returns: the number of bytes allocated for the data buffer
   */
  size_t getSize()
  {
    size_t _retval;
    _retval = g_memory_output_stream_get_size(cast(GMemoryOutputStream*)cPtr);
    return _retval;
  }

  /**
   * Returns data from the ostream as a #GBytes. ostream must be
   * closed before calling this function.
   * Returns: the stream's data
   */
  glib.bytes.Bytes stealAsBytes()
  {
    GBytes* _cretval;
    _cretval = g_memory_output_stream_steal_as_bytes(cast(GMemoryOutputStream*)cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  alias stealData = gobject.object.ObjectG.stealData;

  /**
   * Gets any loaded data from the ostream. Ownership of the data
   * is transferred to the caller; when no longer needed it must be
   * freed using the free function set in ostream's
   * #GMemoryOutputStream:destroy-function property.
   * ostream must be closed before calling this function.
   * Returns: the stream's data, or %NULL if it has previously
   *   been stolen
   */
  void* stealData()
  {
    auto _retval = g_memory_output_stream_steal_data(cast(GMemoryOutputStream*)cPtr);
    return _retval;
  }
}
