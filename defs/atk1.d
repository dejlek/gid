//!gir Atk-1.0

//!subdtype Object ObjectAtk

//# Rename Text.remove_selection which conflicts with Selection.remove_selection which are both implemented by NoOpObject
//!set interface[Text].method[remove_selection][name] text_remove_selection

//!set interface[Text].function[free_ranges][ignore] 1
//!set record[Attribute].function[set_free][ignore] 1

//# Set arrays to zero terminated
//!set interface[Text].method[get_bounded_ranges].return-value.array[][zero-terminated] 1

//# Set parameters to inout
//!set interface[EditableText].method[insert_text].parameters.parameter[position][direction] inout
//!set record[EditableTextIface].field[insert_text].callback[insert_text].parameters.parameter[position][direction] inout

//# The following methods have an output array parameter and the return value is the length (use -1 for length, not GIR standard)
//!set interface[Table].method[get_selected_columns].parameters.parameter[selected][direction] out
//!set interface[Table].method[get_selected_columns].parameters.parameter[selected][transfer-ownership] full
//!set interface[Table].method[get_selected_columns].parameters.parameter[selected].type '<array length="-1" zero-terminated="0" c:type="int **"><type name="int" c:type="int"/></array>'
//!set interface[Table].method[get_selected_rows].parameters.parameter[selected][direction] out
//!set interface[Table].method[get_selected_rows].parameters.parameter[selected][transfer-ownership] full
//!set interface[Table].method[get_selected_rows].parameters.parameter[selected].type '<array length="-1" zero-terminated="0" c:type="int **"><type name="int" c:type="int"/></array>'
//!set record[TableIface].field[get_selected_columns].callback[get_selected_columns].parameters.parameter[selected][direction] out
//!set record[TableIface].field[get_selected_columns].callback[get_selected_columns].parameters.parameter[selected][transfer-ownership] full
//!set record[TableIface].field[get_selected_columns].callback[get_selected_columns].parameters.parameter[selected].type '<array length="-1" zero-terminated="0" c:type="int **"><type name="int" c:type="int"/></array>'
//!set record[TableIface].field[get_selected_rows].callback[get_selected_rows].parameters.parameter[selected][direction] out
//!set record[TableIface].field[get_selected_rows].callback[get_selected_rows].parameters.parameter[selected][transfer-ownership] full
//!set record[TableIface].field[get_selected_rows].callback[get_selected_rows].parameters.parameter[selected].type '<array length="-1" zero-terminated="0" c:type="int **"><type name="int" c:type="int"/></array>'
