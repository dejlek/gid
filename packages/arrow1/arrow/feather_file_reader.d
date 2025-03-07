module arrow.feather_file_reader;

import arrow.c.functions;
import arrow.c.types;
import arrow.seekable_input_stream;
import arrow.table;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class FeatherFileReader : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_feather_file_reader_get_type != &gidSymbolNotFound ? garrow_feather_file_reader_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.seekable_input_stream.SeekableInputStream file)
  {
    GArrowFeatherFileReader* _cretval;
    GError *_err;
    _cretval = garrow_feather_file_reader_new(file ? cast(GArrowSeekableInputStream*)file.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  int getVersion()
  {
    int _retval;
    _retval = garrow_feather_file_reader_get_version(cast(GArrowFeatherFileReader*)cPtr);
    return _retval;
  }

  /** */
  arrow.table.Table read()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_feather_file_reader_read(cast(GArrowFeatherFileReader*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.table.Table readIndices(int[] indices)
  {
    GArrowTable* _cretval;
    uint _nIndices;
    if (indices)
      _nIndices = cast(uint)indices.length;

    auto _indices = cast(const(int)*)indices.ptr;
    GError *_err;
    _cretval = garrow_feather_file_reader_read_indices(cast(GArrowFeatherFileReader*)cPtr, _indices, _nIndices, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.table.Table readNames(string[] names)
  {
    GArrowTable* _cretval;
    uint _nNames;
    if (names)
      _nNames = cast(uint)names.length;

    char*[] _tmpnames;
    foreach (s; names)
      _tmpnames ~= s.toCString(No.Alloc);
    const(char*)* _names = _tmpnames.ptr;

    GError *_err;
    _cretval = garrow_feather_file_reader_read_names(cast(GArrowFeatherFileReader*)cPtr, _names, _nNames, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }
}
