//!gir Secret-1

//!subdtype Value ValueSecret

//# Rename secret parameter since it conflicts with "secret" module path
//!set record[Value].constructor[new_full].parameters.parameter[secret][name] secretData
