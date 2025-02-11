module Arrow.DictionaryDataType;

import Arrow.DataType;
import Arrow.FixedWidthDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class DictionaryDataType : FixedWidthDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_dictionary_data_type_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(DataType indexDataType, DataType valueDataType, bool ordered)
  {
    GArrowDictionaryDataType* _cretval;
    _cretval = garrow_dictionary_data_type_new(indexDataType ? cast(GArrowDataType*)indexDataType.cPtr(No.Dup) : null, valueDataType ? cast(GArrowDataType*)valueDataType.cPtr(No.Dup) : null, ordered);
    this(_cretval, Yes.Take);
  }

  DataType getIndexDataType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_dictionary_data_type_get_index_data_type(cast(GArrowDictionaryDataType*)cPtr);
    auto _retval = ObjectG.getDObject!DataType(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  DataType getValueDataType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_dictionary_data_type_get_value_data_type(cast(GArrowDictionaryDataType*)cPtr);
    auto _retval = ObjectG.getDObject!DataType(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  bool isOrdered()
  {
    bool _retval;
    _retval = garrow_dictionary_data_type_is_ordered(cast(GArrowDictionaryDataType*)cPtr);
    return _retval;
  }
}
