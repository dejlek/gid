module Gio.MemoryInputStream;

import GLib.Bytes;
import GObject.ObjectG;
import Gid.gid;
import Gio.InputStream;
import Gio.PollableInputStream;
import Gio.PollableInputStreamT;
import Gio.Seekable;
import Gio.SeekableT;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * `GMemoryInputStream` is a class for using arbitrary
 * memory chunks as input for GIO streaming input operations.
 * As of GLib 2.34, `GMemoryInputStream` implements
 * [Gio.PollableInputStream].
 */
class MemoryInputStream : InputStream, PollableInputStream, Seekable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())g_memory_input_stream_get_type != &gidSymbolNotFound ? g_memory_input_stream_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin PollableInputStreamT!();
  mixin SeekableT!();

  /**
   * Creates a new empty #GMemoryInputStream.
   * Returns: a new #GInputStream
   */
  this()
  {
    GInputStream* _cretval;
    _cretval = g_memory_input_stream_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Creates a new #GMemoryInputStream with data from the given bytes.
   * Params:
   *   bytes = a #GBytes
   * Returns: new #GInputStream read from bytes
   */
  static MemoryInputStream newFromBytes(Bytes bytes)
  {
    GInputStream* _cretval;
    _cretval = g_memory_input_stream_new_from_bytes(bytes ? cast(GBytes*)bytes.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!MemoryInputStream(cast(GInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Appends bytes to data that can be read from the input stream.
   * Params:
   *   bytes = input data
   */
  void addBytes(Bytes bytes)
  {
    g_memory_input_stream_add_bytes(cast(GMemoryInputStream*)cPtr, bytes ? cast(GBytes*)bytes.cPtr(No.Dup) : null);
  }
}
