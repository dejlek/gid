//!repo Arrow-1.0

//# Set arrays to be zero-terminated=1
//!set class[CSVReadOptions].method[get_column_names].return-value.array[][zero-terminated] 1
//!set class[CSVReadOptions].method[get_false_values].return-value.array[][zero-terminated] 1
//!set class[CSVReadOptions].method[get_null_values].return-value.array[][zero-terminated] 1
//!set class[CSVReadOptions].method[get_true_values].return-value.array[][zero-terminated] 1
//!set class[FunctionDoc].method[get_arg_names].return-value.array[][zero-terminated] 1

//# Seems like the ExtensionDataTypeClass.deserialize field is introspectable and doesn't throw
//!set record[ExtensionDataTypeClass].field[deserialize].callback[deserialize][introspectable] 1
//!set record[ExtensionDataTypeClass].field[deserialize].callback[deserialize][throws] 0
