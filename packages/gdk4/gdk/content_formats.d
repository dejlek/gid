module gdk.content_formats;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import glib.string_;
import gobject.boxed;
import gobject.types;

/**
 * The `GdkContentFormats` structure is used to advertise and negotiate the
 * format of content.
 * You will encounter `GdkContentFormats` when interacting with objects
 * controlling operations that pass data between different widgets, window
 * or application, like [gdk.drag.Drag], [gdk.drop.Drop],
 * [gdk.clipboard.Clipboard] or [gdk.content_provider.ContentProvider].
 * GDK supports content in 2 forms: `GType` and mime type.
 * Using `GTypes` is meant only for in-process content transfers. Mime types
 * are meant to be used for data passing both in-process and out-of-process.
 * The details of how data is passed is described in the documentation of
 * the actual implementations. To transform between the two forms,
 * [gdk.content_serializer.ContentSerializer] and [gdk.content_deserializer.ContentDeserializer] are used.
 * A `GdkContentFormats` describes a set of possible formats content can be
 * exchanged in. It is assumed that this set is ordered. `GTypes` are more
 * important than mime types. Order between different `GTypes` or mime types
 * is the order they were added in, most important first. Functions that
 * care about order, such as [gdk.content_formats.ContentFormats.union_], will describe
 * in their documentation how they interpret that order, though in general the
 * order of the first argument is considered the primary order of the result,
 * followed by the order of further arguments.
 * For debugging purposes, the function [gdk.content_formats.ContentFormats.toString_]
 * exists. It will print a comma-separated list of formats from most important
 * to least important.
 * `GdkContentFormats` is an immutable struct. After creation, you cannot change
 * the types it represents. Instead, new `GdkContentFormats` have to be created.
 * The [gdk.content_formats_builder.ContentFormatsBuilder] structure is meant to help in this
 * endeavor.
 */
class ContentFormats : gobject.boxed.Boxed
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_content_formats_get_type != &gidSymbolNotFound ? gdk_content_formats_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GdkContentFormats` from an array of mime types.
   * The mime types must be valid and different from each other or the
   * behavior of the return value is undefined. If you cannot guarantee
   * this, use [gdk.content_formats_builder.ContentFormatsBuilder] instead.
   * Params:
   *   mimeTypes = Pointer to an
   *     array of mime types
   * Returns: the new `GdkContentFormats`.
   */
  this(string[] mimeTypes)
  {
    GdkContentFormats* _cretval;
    uint _nMimeTypes;
    if (mimeTypes)
      _nMimeTypes = cast(uint)mimeTypes.length;

    char*[] _tmpmimeTypes;
    foreach (s; mimeTypes)
      _tmpmimeTypes ~= s.toCString(No.Alloc);
    const(char*)* _mimeTypes = _tmpmimeTypes.ptr;
    _cretval = gdk_content_formats_new(_mimeTypes, _nMimeTypes);
    this(_cretval, Yes.Take);
  }

  /**
   * Creates a new `GdkContentFormats` for a given `GType`.
   * Params:
   *   type = a `GType`
   * Returns: a new `GdkContentFormats`
   */
  static gdk.content_formats.ContentFormats newForGtype(gobject.types.GType type)
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_content_formats_new_for_gtype(type);
    auto _retval = _cretval ? new gdk.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Checks if a given `GType` is part of the given formats.
   * Params:
   *   type = the `GType` to search for
   * Returns: %TRUE if the `GType` was found
   */
  bool containGtype(gobject.types.GType type)
  {
    bool _retval;
    _retval = gdk_content_formats_contain_gtype(cast(const(GdkContentFormats)*)cPtr, type);
    return _retval;
  }

  /**
   * Checks if a given mime type is part of the given formats.
   * Params:
   *   mimeType = the mime type to search for
   * Returns: %TRUE if the mime_type was found
   */
  bool containMimeType(string mimeType)
  {
    bool _retval;
    const(char)* _mimeType = mimeType.toCString(No.Alloc);
    _retval = gdk_content_formats_contain_mime_type(cast(const(GdkContentFormats)*)cPtr, _mimeType);
    return _retval;
  }

  /**
   * Gets the `GType`s included in formats.
   * Note that formats may not contain any `GType`s, in particular when
   * they are empty. In that case %NULL will be returned.
   * Returns: %G_TYPE_INVALID-terminated array of types included in formats
   */
  gobject.types.GType[] getGtypes()
  {
    const(GType)* _cretval;
    size_t _cretlength;
    _cretval = gdk_content_formats_get_gtypes(cast(const(GdkContentFormats)*)cPtr, &_cretlength);
    gobject.types.GType[] _retval;

    if (_cretval)
    {
      _retval = cast(gobject.types.GType[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  /**
   * Gets the mime types included in formats.
   * Note that formats may not contain any mime types, in particular
   * when they are empty. In that case %NULL will be returned.
   * Returns: %NULL-terminated array of interned strings of mime types included
   *   in formats
   */
  string[] getMimeTypes()
  {
    const(char*)* _cretval;
    size_t _cretlength;
    _cretval = gdk_content_formats_get_mime_types(cast(const(GdkContentFormats)*)cPtr, &_cretlength);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
   * Checks if first and second have any matching formats.
   * Params:
   *   second = the `GdkContentFormats` to intersect with
   * Returns: %TRUE if a matching format was found.
   */
  bool match(gdk.content_formats.ContentFormats second)
  {
    bool _retval;
    _retval = gdk_content_formats_match(cast(const(GdkContentFormats)*)cPtr, second ? cast(const(GdkContentFormats)*)second.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Finds the first `GType` from first that is also contained
   * in second.
   * If no matching `GType` is found, %G_TYPE_INVALID is returned.
   * Params:
   *   second = the `GdkContentFormats` to intersect with
   * Returns: The first common `GType` or %G_TYPE_INVALID if none.
   */
  gobject.types.GType matchGtype(gdk.content_formats.ContentFormats second)
  {
    gobject.types.GType _retval;
    _retval = gdk_content_formats_match_gtype(cast(const(GdkContentFormats)*)cPtr, second ? cast(const(GdkContentFormats)*)second.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Finds the first mime type from first that is also contained
   * in second.
   * If no matching mime type is found, %NULL is returned.
   * Params:
   *   second = the `GdkContentFormats` to intersect with
   * Returns: The first common mime type or %NULL if none
   */
  string matchMimeType(gdk.content_formats.ContentFormats second)
  {
    const(char)* _cretval;
    _cretval = gdk_content_formats_match_mime_type(cast(const(GdkContentFormats)*)cPtr, second ? cast(const(GdkContentFormats)*)second.cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Prints the given formats into a string for human consumption.
   * The result of this function can later be parsed with
   * [gdk.content_formats.ContentFormats.parse].
   * Params:
   *   string_ = a `GString` to print into
   */
  void print(glib.string_.String string_)
  {
    gdk_content_formats_print(cast(GdkContentFormats*)cPtr, string_ ? cast(GString*)string_.cPtr(No.Dup) : null);
  }

  /**
   * Prints the given formats into a human-readable string.
   * The resulting string can be parsed with [gdk.content_formats.ContentFormats.parse].
   * This is a small wrapper around [gdk.content_formats.ContentFormats.print]
   * to help when debugging.
   * Returns: a new string
   */
  string toString_()
  {
    char* _cretval;
    _cretval = gdk_content_formats_to_string(cast(GdkContentFormats*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Append all missing types from second to first, in the order
   * they had in second.
   * Params:
   *   second = the `GdkContentFormats` to merge from
   * Returns: a new `GdkContentFormats`
   */
  gdk.content_formats.ContentFormats union_(gdk.content_formats.ContentFormats second)
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_content_formats_union(cast(GdkContentFormats*)cPtr, second ? cast(const(GdkContentFormats)*)second.cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gdk.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Add GTypes for mime types in formats for which deserializers are
   * registered.
   * Returns: a new `GdkContentFormats`
   */
  gdk.content_formats.ContentFormats unionDeserializeGtypes()
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_content_formats_union_deserialize_gtypes(cast(GdkContentFormats*)cPtr);
    auto _retval = _cretval ? new gdk.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Add mime types for GTypes in formats for which deserializers are
   * registered.
   * Returns: a new `GdkContentFormats`
   */
  gdk.content_formats.ContentFormats unionDeserializeMimeTypes()
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_content_formats_union_deserialize_mime_types(cast(GdkContentFormats*)cPtr);
    auto _retval = _cretval ? new gdk.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Add GTypes for the mime types in formats for which serializers are
   * registered.
   * Returns: a new `GdkContentFormats`
   */
  gdk.content_formats.ContentFormats unionSerializeGtypes()
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_content_formats_union_serialize_gtypes(cast(GdkContentFormats*)cPtr);
    auto _retval = _cretval ? new gdk.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Add mime types for GTypes in formats for which serializers are
   * registered.
   * Returns: a new `GdkContentFormats`
   */
  gdk.content_formats.ContentFormats unionSerializeMimeTypes()
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_content_formats_union_serialize_mime_types(cast(GdkContentFormats*)cPtr);
    auto _retval = _cretval ? new gdk.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Parses the given string into `GdkContentFormats` and
   * returns the formats.
   * Strings printed via [gdk.content_formats.ContentFormats.toString_]
   * can be read in again successfully using this function.
   * If string does not describe valid content formats, %NULL
   * is returned.
   * Params:
   *   string_ = the string to parse
   * Returns: the content formats if string is valid
   */
  static gdk.content_formats.ContentFormats parse(string string_)
  {
    GdkContentFormats* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = gdk_content_formats_parse(_string_);
    auto _retval = _cretval ? new gdk.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
