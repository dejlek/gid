module gio.converter_output_stream;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.converter;
import gio.filter_output_stream;
import gio.output_stream;
import gio.pollable_output_stream;
import gio.pollable_output_stream_mixin;
import gio.types;
import gobject.object;

/**
    Converter output stream implements [gio.output_stream.OutputStream] and allows
  conversion of data of various types during reading.
  
  As of GLib 2.34, [gio.converter_output_stream.ConverterOutputStream] implements
  [gio.pollable_output_stream.PollableOutputStream].
*/
class ConverterOutputStream : gio.filter_output_stream.FilterOutputStream, gio.pollable_output_stream.PollableOutputStream
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_converter_output_stream_get_type != &gidSymbolNotFound ? g_converter_output_stream_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin PollableOutputStreamT!();

  /**
      Creates a new converter output stream for the base_stream.
    Params:
      baseStream =       a #GOutputStream
      converter =       a #GConverter
    Returns:     a new #GOutputStream.
  */
  this(gio.output_stream.OutputStream baseStream, gio.converter.Converter converter)
  {
    GOutputStream* _cretval;
    _cretval = g_converter_output_stream_new(baseStream ? cast(GOutputStream*)baseStream.cPtr(No.dup) : null, converter ? cast(GConverter*)(cast(ObjectG)converter).cPtr(No.dup) : null);
    this(_cretval, Yes.take);
  }

  /**
      Gets the #GConverter that is used by converter_stream.
    Returns:     the converter of the converter output stream
  */
  gio.converter.Converter getConverter()
  {
    GConverter* _cretval;
    _cretval = g_converter_output_stream_get_converter(cast(GConverterOutputStream*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.converter.Converter)(cast(GConverter*)_cretval, No.take);
    return _retval;
  }
}
