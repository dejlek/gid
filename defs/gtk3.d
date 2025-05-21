//!gir Gtk-3.0
//!info description "D binding for the Gtk3 library - Gtk3 graphics toolkit library"
//!info website https://gtk.org
//!info docs https://www.kymorphia.com/gid-old/gtk.html
//!info capi https://docs.gtk.org/gtk3/

//# Rename ToolShell.getOrientation since it conflicts with Orientable.getOrientation in ToolBar
//!set interface[ToolShell].method[get_orientation][name] tool_shell_get_orientation

//# GtkIconSize enum uses gint for the D type, set it to IconSize enum (the * after GtkIconSize is a wildcard to match a literal '*' also)
//!set *.type[c:type=GtkIconSize*,name=gint][name] IconSize

//# Change string arguments to character array with length
//!set callback[ClipboardRichTextReceivedFunc].parameters.parameter[text].type '<array length="3" c:type="const gchar*"><type name="char" c:type="char"/></array>'

//# Disable methods with arrays with sizes not described by parameters (FIXME)
//!set class[ListStore].method[reorder][unsupported] 1

//# axes param takes a GDK_AXIS_IGNORE terminated array (0 value) and expects the out values[] array to be the same size (use length of axes array)
//!set class[GestureStylus].method[get_axes].parameters.parameter[axes].array[][zero-terminated] 1
//!set class[GestureStylus].method[get_axes].parameters.parameter[values].array[][length] 0

//# Set arrays to be zero-terminated=1
//!set class[IconTheme].method[get_icon_sizes].return-value.array[][zero-terminated] 1
//!set function[accelerator_parse_with_keycode].parameters.parameter[accelerator_codes].array[][zero-terminated] 1
//!set function[init_with_args].parameters.parameter[entries].array[][zero-terminated] 1

//# Ignore unimportant APIs
//!set callback[ModuleInitFunc][ignore] 1

//# Ignore user data parameter
//!set interface[Buildable].method[custom_tag_end][ignore] 1

//# Set basic parameters to out
//!set function[rc_parse_priority].parameters.parameter[priority][direction] out

//# Return callback array should be transfer-ownership full
//!set callback[TextBufferSerializeFunc].return-value[][transfer-ownership] full
