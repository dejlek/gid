module arrow.dictionary_array;

import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.dictionary_data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class DictionaryArray : arrow.array.Array
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_dictionary_array_get_type != &gidSymbolNotFound ? garrow_dictionary_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  this(arrow.data_type.DataType dataType, arrow.array.Array indices, arrow.array.Array dictionary)
  {
    GArrowDictionaryArray* _cretval;
    GError *_err;
    _cretval = garrow_dictionary_array_new(dataType ? cast(GArrowDataType*)dataType.cPtr(No.Dup) : null, indices ? cast(GArrowArray*)indices.cPtr(No.Dup) : null, dictionary ? cast(GArrowArray*)dictionary.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.array.Array getDictionary()
  {
    GArrowArray* _cretval;
    _cretval = garrow_dictionary_array_get_dictionary(cast(GArrowDictionaryArray*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.dictionary_data_type.DictionaryDataType getDictionaryDataType()
  {
    GArrowDictionaryDataType* _cretval;
    _cretval = garrow_dictionary_array_get_dictionary_data_type(cast(GArrowDictionaryArray*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.dictionary_data_type.DictionaryDataType)(cast(GArrowDictionaryDataType*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array getIndices()
  {
    GArrowArray* _cretval;
    _cretval = garrow_dictionary_array_get_indices(cast(GArrowDictionaryArray*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }
}
