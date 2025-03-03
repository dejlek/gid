//!gir Gtk-3.0

//# Rename ToolShell.getOrientation since it conflicts with Orientable.getOrientation in ToolBar
//!set interface[ToolShell].method[get_orientation][name] tool_shell_get_orientation

//# GtkIconSize enum uses gint for the D type, set it to IconSize enum (the * after GtkIconSize is a wildcard to match a literal '*' also)
//!set *.type[c:type=GtkIconSize*,name=gint][name] IconSize

//# Change string arguments to character array with length
//!set callback[ClipboardRichTextReceivedFunc].parameters.parameter[text].type '<array length="3" c:type="const gchar*"><type name="char" c:type="char"/></array>'
