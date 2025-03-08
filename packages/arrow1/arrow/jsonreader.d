module arrow.jsonreader;

import arrow.c.functions;
import arrow.c.types;
import arrow.input_stream;
import arrow.jsonread_options;
import arrow.table;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class JSONReader : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_json_reader_get_type != &gidSymbolNotFound ? garrow_json_reader_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.input_stream.InputStream input, arrow.jsonread_options.JSONReadOptions options = null)
  {
    GArrowJSONReader* _cretval;
    GError *_err;
    _cretval = garrow_json_reader_new(input ? cast(GArrowInputStream*)input.cPtr(No.dup) : null, options ? cast(GArrowJSONReadOptions*)options.cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.take);
  }

  /** */
  arrow.table.Table read()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_json_reader_read(cast(GArrowJSONReader*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.take);
    return _retval;
  }
}
