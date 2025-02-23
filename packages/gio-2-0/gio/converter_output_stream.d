module gio.converter_output_stream;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.converter;
import gio.converter_mixin;
import gio.filter_output_stream;
import gio.output_stream;
import gio.pollable_output_stream;
import gio.pollable_output_stream_mixin;
import gio.types;
import gobject.object;

/**
 * Converter output stream implements [Gio.OutputStream] and allows
 * conversion of data of various types during reading.
 * As of GLib 2.34, `GConverterOutputStream` implements
 * [Gio.PollableOutputStream].
 */
class ConverterOutputStream : FilterOutputStream, PollableOutputStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_converter_output_stream_get_type != &gidSymbolNotFound ? g_converter_output_stream_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin PollableOutputStreamT!();

  /**
   * Creates a new converter output stream for the base_stream.
   * Params:
   *   baseStream = a #GOutputStream
   *   converter = a #GConverter
   * Returns: a new #GOutputStream.
   */
  this(OutputStream baseStream, Converter converter)
  {
    GOutputStream* _cretval;
    _cretval = g_converter_output_stream_new(baseStream ? cast(GOutputStream*)baseStream.cPtr(No.Dup) : null, converter ? cast(GConverter*)(cast(ObjectG)converter).cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the #GConverter that is used by converter_stream.
   * Returns: the converter of the converter output stream
   */
  Converter getConverter()
  {
    GConverter* _cretval;
    _cretval = g_converter_output_stream_get_converter(cast(GConverterOutputStream*)cPtr);
    auto _retval = ObjectG.getDObject!Converter(cast(GConverter*)_cretval, No.Take);
    return _retval;
  }
}
