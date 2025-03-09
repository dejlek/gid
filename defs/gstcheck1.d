//!gir GstCheck-1.0

//# This function is missing its C type "Suite", remove it from the XML
//!del function[check_run_suite]

//# Set basic parameters to out
//!set function[check_init].parameters.parameter[argc][direction] inout
//!set function[check_init].parameters.parameter[argv][direction] inout
//!set function[check_init].parameters.parameter[argv].type '<array length="0" c:type="char***"><type name="utf8" c:type="char**"/></array>'
