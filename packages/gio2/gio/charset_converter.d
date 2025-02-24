module gio.charset_converter;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.converter;
import gio.converter_mixin;
import gio.initable;
import gio.initable_mixin;
import gio.types;
import glib.error;
import gobject.object;

/**
 * `GCharsetConverter` is an implementation of [Gio.Converter] based on
 * [GLib.IConv].
 */
class CharsetConverter : ObjectG, Converter, Initable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_charset_converter_get_type != &gidSymbolNotFound ? g_charset_converter_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ConverterT!();
  mixin InitableT!();

  /**
   * Creates a new #GCharsetConverter.
   * Params:
   *   toCharset = destination charset
   *   fromCharset = source charset
   * Returns: a new #GCharsetConverter or %NULL on error.
   */
  this(string toCharset, string fromCharset)
  {
    GCharsetConverter* _cretval;
    const(char)* _toCharset = toCharset.toCString(No.Alloc);
    const(char)* _fromCharset = fromCharset.toCString(No.Alloc);
    GError *_err;
    _cretval = g_charset_converter_new(_toCharset, _fromCharset, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the number of fallbacks that converter has applied so far.
   * Returns: the number of fallbacks that converter has applied
   */
  uint getNumFallbacks()
  {
    uint _retval;
    _retval = g_charset_converter_get_num_fallbacks(cast(GCharsetConverter*)cPtr);
    return _retval;
  }

  /**
   * Gets the #GCharsetConverter:use-fallback property.
   * Returns: %TRUE if fallbacks are used by converter
   */
  bool getUseFallback()
  {
    bool _retval;
    _retval = g_charset_converter_get_use_fallback(cast(GCharsetConverter*)cPtr);
    return _retval;
  }

  /**
   * Sets the #GCharsetConverter:use-fallback property.
   * Params:
   *   useFallback = %TRUE to use fallbacks
   */
  void setUseFallback(bool useFallback)
  {
    g_charset_converter_set_use_fallback(cast(GCharsetConverter*)cPtr, useFallback);
  }
}
