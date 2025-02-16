module Arrow.Field;

import Arrow.DataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class Field : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_field_get_type != &gidSymbolNotFound ? garrow_field_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(string name, DataType dataType)
  {
    GArrowField* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = garrow_field_new(_name, dataType ? cast(GArrowDataType*)dataType.cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  static Field newFull(string name, DataType dataType, bool nullable)
  {
    GArrowField* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = garrow_field_new_full(_name, dataType ? cast(GArrowDataType*)dataType.cPtr(No.Dup) : null, nullable);
    auto _retval = ObjectG.getDObject!Field(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }

  static Field import_(void* cAbiSchema)
  {
    GArrowField* _cretval;
    GError *_err;
    _cretval = garrow_field_import(cAbiSchema, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Field(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }

  bool equal(Field otherField)
  {
    bool _retval;
    _retval = garrow_field_equal(cast(GArrowField*)cPtr, otherField ? cast(GArrowField*)otherField.cPtr(No.Dup) : null);
    return _retval;
  }

  void* export_()
  {
    void* _retval;
    GError *_err;
    _retval = garrow_field_export(cast(GArrowField*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  DataType getDataType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_field_get_data_type(cast(GArrowField*)cPtr);
    auto _retval = ObjectG.getDObject!DataType(cast(GArrowDataType*)_cretval, No.Take);
    return _retval;
  }

  string[string] getMetadata()
  {
    GHashTable* _cretval;
    _cretval = garrow_field_get_metadata(cast(GArrowField*)cPtr);
    auto _retval = gHashTableToD!(string, string, GidOwnership.Full)(cast(GHashTable*)_cretval);
    return _retval;
  }

  string getName()
  {
    const(char)* _cretval;
    _cretval = garrow_field_get_name(cast(GArrowField*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  bool hasMetadata()
  {
    bool _retval;
    _retval = garrow_field_has_metadata(cast(GArrowField*)cPtr);
    return _retval;
  }

  bool isNullable()
  {
    bool _retval;
    _retval = garrow_field_is_nullable(cast(GArrowField*)cPtr);
    return _retval;
  }

  Field removeMetadata()
  {
    GArrowField* _cretval;
    _cretval = garrow_field_remove_metadata(cast(GArrowField*)cPtr);
    auto _retval = ObjectG.getDObject!Field(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }

  string toString_()
  {
    char* _cretval;
    _cretval = garrow_field_to_string(cast(GArrowField*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  string toStringMetadata(bool showMetadata)
  {
    char* _cretval;
    _cretval = garrow_field_to_string_metadata(cast(GArrowField*)cPtr, showMetadata);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  Field withMergedMetadata(string[string] metadata)
  {
    GArrowField* _cretval;
    auto _metadata = gHashTableFromD!(string, string)(metadata);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_metadata);
    _cretval = garrow_field_with_merged_metadata(cast(GArrowField*)cPtr, _metadata);
    auto _retval = ObjectG.getDObject!Field(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }

  Field withMetadata(string[string] metadata)
  {
    GArrowField* _cretval;
    auto _metadata = gHashTableFromD!(string, string)(metadata);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_metadata);
    _cretval = garrow_field_with_metadata(cast(GArrowField*)cPtr, _metadata);
    auto _retval = ObjectG.getDObject!Field(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }
}
