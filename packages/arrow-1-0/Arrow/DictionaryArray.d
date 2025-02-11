module Arrow.DictionaryArray;

import Arrow.Array;
import Arrow.DataType;
import Arrow.DictionaryDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class DictionaryArray : Array
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_dictionary_array_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(DataType dataType, Array indices, Array dictionary)
  {
    GArrowDictionaryArray* _cretval;
    GError *_err;
    _cretval = garrow_dictionary_array_new(dataType ? cast(GArrowDataType*)dataType.cPtr(No.Dup) : null, indices ? cast(GArrowArray*)indices.cPtr(No.Dup) : null, dictionary ? cast(GArrowArray*)dictionary.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  Array getDictionary()
  {
    GArrowArray* _cretval;
    _cretval = garrow_dictionary_array_get_dictionary(cast(GArrowDictionaryArray*)cPtr);
    auto _retval = ObjectG.getDObject!Array(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  DictionaryDataType getDictionaryDataType()
  {
    GArrowDictionaryDataType* _cretval;
    _cretval = garrow_dictionary_array_get_dictionary_data_type(cast(GArrowDictionaryArray*)cPtr);
    auto _retval = ObjectG.getDObject!DictionaryDataType(cast(GArrowDictionaryDataType*)_cretval, Yes.Take);
    return _retval;
  }

  Array getIndices()
  {
    GArrowArray* _cretval;
    _cretval = garrow_dictionary_array_get_indices(cast(GArrowDictionaryArray*)cPtr);
    auto _retval = ObjectG.getDObject!Array(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }
}
