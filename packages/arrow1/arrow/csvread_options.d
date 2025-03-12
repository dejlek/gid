module arrow.csvread_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.schema;
import arrow.timestamp_parser;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class CSVReadOptions : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_csv_read_options_get_type != &gidSymbolNotFound ? garrow_csv_read_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override CSVReadOptions self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowCSVReadOptions* _cretval;
    _cretval = garrow_csv_read_options_new();
    this(_cretval, Yes.Take);
  }

  /** */
  void addColumnName(string columnName)
  {
    const(char)* _columnName = columnName.toCString(No.Alloc);
    garrow_csv_read_options_add_column_name(cast(GArrowCSVReadOptions*)cPtr, _columnName);
  }

  /**
      Add value type of a column.
    Params:
      name =       The name of the target column.
      dataType =       The #GArrowDataType for the column.
  */
  void addColumnType(string name, arrow.data_type.DataType dataType)
  {
    const(char)* _name = name.toCString(No.Alloc);
    garrow_csv_read_options_add_column_type(cast(GArrowCSVReadOptions*)cPtr, _name, dataType ? cast(GArrowDataType*)dataType.cPtr(No.Dup) : null);
  }

  /** */
  void addFalseValue(string falseValue)
  {
    const(char)* _falseValue = falseValue.toCString(No.Alloc);
    garrow_csv_read_options_add_false_value(cast(GArrowCSVReadOptions*)cPtr, _falseValue);
  }

  /** */
  void addNullValue(string nullValue)
  {
    const(char)* _nullValue = nullValue.toCString(No.Alloc);
    garrow_csv_read_options_add_null_value(cast(GArrowCSVReadOptions*)cPtr, _nullValue);
  }

  /**
      Add value types for columns in the schema.
    Params:
      schema =       The #GArrowSchema that specifies columns and their types.
  */
  void addSchema(arrow.schema.Schema schema)
  {
    garrow_csv_read_options_add_schema(cast(GArrowCSVReadOptions*)cPtr, schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null);
  }

  /** */
  void addTimestampParser(arrow.timestamp_parser.TimestampParser parser)
  {
    garrow_csv_read_options_add_timestamp_parser(cast(GArrowCSVReadOptions*)cPtr, parser ? cast(GArrowTimestampParser*)parser.cPtr(No.Dup) : null);
  }

  /** */
  void addTrueValue(string trueValue)
  {
    const(char)* _trueValue = trueValue.toCString(No.Alloc);
    garrow_csv_read_options_add_true_value(cast(GArrowCSVReadOptions*)cPtr, _trueValue);
  }

  /** */
  string[] getColumnNames()
  {
    char** _cretval;
    _cretval = garrow_csv_read_options_get_column_names(cast(GArrowCSVReadOptions*)cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
    }
    return _retval;
  }

  /** */
  arrow.data_type.DataType[string] getColumnTypes()
  {
    GHashTable* _cretval;
    _cretval = garrow_csv_read_options_get_column_types(cast(GArrowCSVReadOptions*)cPtr);
    auto _retval = gHashTableToD!(string, arrow.data_type.DataType, GidOwnership.Full)(cast(GHashTable*)_cretval);
    return _retval;
  }

  /** */
  string[] getFalseValues()
  {
    char** _cretval;
    _cretval = garrow_csv_read_options_get_false_values(cast(GArrowCSVReadOptions*)cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
    }
    return _retval;
  }

  /** */
  string[] getNullValues()
  {
    char** _cretval;
    _cretval = garrow_csv_read_options_get_null_values(cast(GArrowCSVReadOptions*)cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
    }
    return _retval;
  }

  /** */
  arrow.timestamp_parser.TimestampParser[] getTimestampParsers()
  {
    GList* _cretval;
    _cretval = garrow_csv_read_options_get_timestamp_parsers(cast(GArrowCSVReadOptions*)cPtr);
    auto _retval = gListToD!(arrow.timestamp_parser.TimestampParser, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  string[] getTrueValues()
  {
    char** _cretval;
    _cretval = garrow_csv_read_options_get_true_values(cast(GArrowCSVReadOptions*)cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
    }
    return _retval;
  }

  /** */
  void setColumnNames(string[] columnNames)
  {
    size_t _nColumnNames;
    if (columnNames)
      _nColumnNames = cast(size_t)columnNames.length;

    char*[] _tmpcolumnNames;
    foreach (s; columnNames)
      _tmpcolumnNames ~= s.toCString(No.Alloc);
    const(char*)* _columnNames = _tmpcolumnNames.ptr;
    garrow_csv_read_options_set_column_names(cast(GArrowCSVReadOptions*)cPtr, _columnNames, _nColumnNames);
  }

  /** */
  void setFalseValues(string[] falseValues)
  {
    size_t _nFalseValues;
    if (falseValues)
      _nFalseValues = cast(size_t)falseValues.length;

    char*[] _tmpfalseValues;
    foreach (s; falseValues)
      _tmpfalseValues ~= s.toCString(No.Alloc);
    const(char*)* _falseValues = _tmpfalseValues.ptr;
    garrow_csv_read_options_set_false_values(cast(GArrowCSVReadOptions*)cPtr, _falseValues, _nFalseValues);
  }

  /** */
  void setNullValues(string[] nullValues)
  {
    size_t _nNullValues;
    if (nullValues)
      _nNullValues = cast(size_t)nullValues.length;

    char*[] _tmpnullValues;
    foreach (s; nullValues)
      _tmpnullValues ~= s.toCString(No.Alloc);
    const(char*)* _nullValues = _tmpnullValues.ptr;
    garrow_csv_read_options_set_null_values(cast(GArrowCSVReadOptions*)cPtr, _nullValues, _nNullValues);
  }

  /** */
  void setTimestampParsers(arrow.timestamp_parser.TimestampParser[] parsers)
  {
    auto _parsers = gListFromD!(arrow.timestamp_parser.TimestampParser)(parsers);
    scope(exit) containerFree!(GList*, arrow.timestamp_parser.TimestampParser, GidOwnership.None)(_parsers);
    garrow_csv_read_options_set_timestamp_parsers(cast(GArrowCSVReadOptions*)cPtr, _parsers);
  }

  /** */
  void setTrueValues(string[] trueValues)
  {
    size_t _nTrueValues;
    if (trueValues)
      _nTrueValues = cast(size_t)trueValues.length;

    char*[] _tmptrueValues;
    foreach (s; trueValues)
      _tmptrueValues ~= s.toCString(No.Alloc);
    const(char*)* _trueValues = _tmptrueValues.ptr;
    garrow_csv_read_options_set_true_values(cast(GArrowCSVReadOptions*)cPtr, _trueValues, _nTrueValues);
  }
}
