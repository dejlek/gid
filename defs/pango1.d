//!gir Pango-1.0

//# LayoutLine isParagraphStart conflicts with property, disable it
//!set record[LayoutLine].method[is_paragraph_start][ignore] 1

//# Change Layout.setText() text parameter to an array of chars with a length to remove length param and optimize
//!set class[Layout].method[set_text].parameters.parameter[text].type '<array length="1" c:type="gchar*"><type name="char" c:type="char"/></array>'

//# Set arrays to be zero-terminated=1
//!set class[Font].method[get_languages].return-value.array[][zero-terminated] 1
//!set record[Language].function[get_preferred].return-value.array[][zero-terminated] 1

//# Use array of characters with a length, to remove the length and optimize
//!set function[attr_break].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[break].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[default_break].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[find_base_dir].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[find_paragraph_boundary].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[get_log_attrs].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[parse_markup].parameters.parameter[markup_text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[shape].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[shape_full].parameters.parameter[item_text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[shape_full].parameters.parameter[paragraph_text].type '<array length="3" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[shape_item].parameters.parameter[paragraph_text].type '<array length="2" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[shape_with_flags].parameters.parameter[item_text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[shape_with_flags].parameters.parameter[paragraph_text].type '<array length="3" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[tailor_break].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set record[GlyphString].method[index_to_x].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set record[GlyphString].method[index_to_x_full].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set record[GlyphString].method[x_to_index].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[Layout].method[set_markup].parameters.parameter[markup].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[Layout].method[set_markup_with_accel].parameters.parameter[markup].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set record[ScriptIter].constructor[new].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
