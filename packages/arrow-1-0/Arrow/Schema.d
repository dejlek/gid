module Arrow.Schema;

import Arrow.Field;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class Schema : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_schema_get_type != &gidSymbolNotFound ? garrow_schema_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Field[] fields)
  {
    GArrowSchema* _cretval;
    auto _fields = gListFromD!(Field)(fields);
    scope(exit) containerFree!(GList*, Field, GidOwnership.None)(_fields);
    _cretval = garrow_schema_new(_fields);
    this(_cretval, Yes.Take);
  }

  static Schema import_(void* cAbiSchema)
  {
    GArrowSchema* _cretval;
    GError *_err;
    _cretval = garrow_schema_import(cAbiSchema, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Schema(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  Schema addField(uint i, Field field)
  {
    GArrowSchema* _cretval;
    GError *_err;
    _cretval = garrow_schema_add_field(cast(GArrowSchema*)cPtr, i, field ? cast(GArrowField*)field.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Schema(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  bool equal(Schema otherSchema)
  {
    bool _retval;
    _retval = garrow_schema_equal(cast(GArrowSchema*)cPtr, otherSchema ? cast(GArrowSchema*)otherSchema.cPtr(No.Dup) : null);
    return _retval;
  }

  void* export_()
  {
    void* _retval;
    GError *_err;
    _retval = garrow_schema_export(cast(GArrowSchema*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  Field getField(uint i)
  {
    GArrowField* _cretval;
    _cretval = garrow_schema_get_field(cast(GArrowSchema*)cPtr, i);
    auto _retval = ObjectG.getDObject!Field(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }

  Field getFieldByName(string name)
  {
    GArrowField* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = garrow_schema_get_field_by_name(cast(GArrowSchema*)cPtr, _name);
    auto _retval = ObjectG.getDObject!Field(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }

  int getFieldIndex(string name)
  {
    int _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = garrow_schema_get_field_index(cast(GArrowSchema*)cPtr, _name);
    return _retval;
  }

  Field[] getFields()
  {
    GList* _cretval;
    _cretval = garrow_schema_get_fields(cast(GArrowSchema*)cPtr);
    auto _retval = gListToD!(Field, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  string[string] getMetadata()
  {
    GHashTable* _cretval;
    _cretval = garrow_schema_get_metadata(cast(GArrowSchema*)cPtr);
    auto _retval = gHashTableToD!(string, string, GidOwnership.Full)(cast(GHashTable*)_cretval);
    return _retval;
  }

  bool hasMetadata()
  {
    bool _retval;
    _retval = garrow_schema_has_metadata(cast(GArrowSchema*)cPtr);
    return _retval;
  }

  uint nFields()
  {
    uint _retval;
    _retval = garrow_schema_n_fields(cast(GArrowSchema*)cPtr);
    return _retval;
  }

  Schema removeField(uint i)
  {
    GArrowSchema* _cretval;
    GError *_err;
    _cretval = garrow_schema_remove_field(cast(GArrowSchema*)cPtr, i, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Schema(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  Schema replaceField(uint i, Field field)
  {
    GArrowSchema* _cretval;
    GError *_err;
    _cretval = garrow_schema_replace_field(cast(GArrowSchema*)cPtr, i, field ? cast(GArrowField*)field.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Schema(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  string toString_()
  {
    char* _cretval;
    _cretval = garrow_schema_to_string(cast(GArrowSchema*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  string toStringMetadata(bool showMetadata)
  {
    char* _cretval;
    _cretval = garrow_schema_to_string_metadata(cast(GArrowSchema*)cPtr, showMetadata);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  Schema withMetadata(string[string] metadata)
  {
    GArrowSchema* _cretval;
    auto _metadata = gHashTableFromD!(string, string)(metadata);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_metadata);
    _cretval = garrow_schema_with_metadata(cast(GArrowSchema*)cPtr, _metadata);
    auto _retval = ObjectG.getDObject!Schema(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }
}
