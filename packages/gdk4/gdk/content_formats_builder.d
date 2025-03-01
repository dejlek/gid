module gdk.content_formats_builder;

import gdk.c.functions;
import gdk.c.types;
import gdk.content_formats;
import gdk.types;
import gid.global;
import gobject.boxed;
import gobject.types;

/**
 * A `GdkContentFormatsBuilder` is an auxiliary struct used to create
 * new `GdkContentFormats`, and should not be kept around.
 */
class ContentFormatsBuilder : Boxed
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
    return cast(void function())gdk_content_formats_builder_get_type != &gidSymbolNotFound ? gdk_content_formats_builder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Create a new `GdkContentFormatsBuilder` object.
   * The resulting builder would create an empty `GdkContentFormats`.
   * Use addition functions to add types to it.
   * Returns: a new `GdkContentFormatsBuilder`
   */
  this()
  {
    GdkContentFormatsBuilder* _cretval;
    _cretval = gdk_content_formats_builder_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Appends all formats from formats to builder, skipping those that
   * already exist.
   * Params:
   *   formats = the formats to add
   */
  void addFormats(ContentFormats formats)
  {
    gdk_content_formats_builder_add_formats(cast(GdkContentFormatsBuilder*)cPtr, formats ? cast(GdkContentFormats*)formats.cPtr(No.Dup) : null);
  }

  /**
   * Appends type to builder if it has not already been added.
   * Params:
   *   type = a `GType`
   */
  void addGtype(GType type)
  {
    gdk_content_formats_builder_add_gtype(cast(GdkContentFormatsBuilder*)cPtr, type);
  }

  /**
   * Appends mime_type to builder if it has not already been added.
   * Params:
   *   mimeType = a mime type
   */
  void addMimeType(string mimeType)
  {
    const(char)* _mimeType = mimeType.toCString(No.Alloc);
    gdk_content_formats_builder_add_mime_type(cast(GdkContentFormatsBuilder*)cPtr, _mimeType);
  }

  /**
   * Creates a new `GdkContentFormats` from the given builder.
   * The given `GdkContentFormatsBuilder` is reset once this function returns;
   * you cannot call this function multiple times on the same builder instance.
   * This function is intended primarily for bindings. C code should use
   * [gdk.content_formats_builder.ContentFormatsBuilder.freeToFormats].
   * Returns: the newly created `GdkContentFormats`
   *   with all the formats added to builder
   */
  ContentFormats toFormats()
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_content_formats_builder_to_formats(cast(GdkContentFormatsBuilder*)cPtr);
    auto _retval = _cretval ? new ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
