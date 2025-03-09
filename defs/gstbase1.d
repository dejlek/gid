//!gir GstBase-1.0

//# Disable methods with arrays with sizes not described by parameters (FIXME)
//!set record[BitWriter].method[free_and_get_data][unsupported] 1
//!set record[BitWriter].method[get_data][unsupported] 1
//!set record[BitWriter].method[reset_and_get_data][unsupported] 1
//!set record[ByteWriter].method[reset_and_get_data][unsupported] 1

//# Set length of array parameters
//!set record[BitWriter].method[put_bytes].parameters.parameter[data].array[][length] 1

//# Set arrays to be zero-terminated=1
//!set record[ByteReader].method[dup_string_utf16].parameters.parameter[str].array[][zero-terminated] 1
//!set record[ByteReader].method[dup_string_utf32].parameters.parameter[str].array[][zero-terminated] 1
//!set record[ByteWriter].method[put_string_utf16].parameters.parameter[data].array[][zero-terminated] 1
//!set record[ByteWriter].method[put_string_utf32].parameters.parameter[data].array[][zero-terminated] 1
