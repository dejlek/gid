/// C functions for javascriptcore6 library
module javascriptcore.c.functions;

public import gid.basictypes;
import gid.loader;
import javascriptcore.c.types;
public import gobject.c.types;

version(Windows)
  private immutable LIBS = ["libjavascriptcoregtk-6.0-1.dll;javascriptcoregtk-6.0-1.dll;javascriptcoregtk-6.dll"];
else version(OSX)
  private immutable LIBS = ["libjavascriptcoregtk-6.0.1.dylib"];
else
  private immutable LIBS = ["libjavascriptcoregtk-6.0.so.1"];

__gshared extern(C)
{
  // Class
  GType function() c_jsc_class_get_type; ///
  JSCValue* function(JSCClass* jscClass, const(char)* name, GCallback callback, void* userData, GDestroyNotify destroyNotify, GType returnType, uint nParams,  ...) c_jsc_class_add_constructor; ///
  JSCValue* function(JSCClass* jscClass, const(char)* name, GCallback callback, void* userData, GDestroyNotify destroyNotify, GType returnType) c_jsc_class_add_constructor_variadic; ///
  JSCValue* function(JSCClass* jscClass, const(char)* name, GCallback callback, void* userData, GDestroyNotify destroyNotify, GType returnType, uint nParameters, GType* parameterTypes) c_jsc_class_add_constructorv; ///
  void function(JSCClass* jscClass, const(char)* name, GCallback callback, void* userData, GDestroyNotify destroyNotify, GType returnType, uint nParams,  ...) c_jsc_class_add_method; ///
  void function(JSCClass* jscClass, const(char)* name, GCallback callback, void* userData, GDestroyNotify destroyNotify, GType returnType) c_jsc_class_add_method_variadic; ///
  void function(JSCClass* jscClass, const(char)* name, GCallback callback, void* userData, GDestroyNotify destroyNotify, GType returnType, uint nParameters, GType* parameterTypes) c_jsc_class_add_methodv; ///
  void function(JSCClass* jscClass, const(char)* name, GType propertyType, GCallback getter, GCallback setter, void* userData, GDestroyNotify destroyNotify) c_jsc_class_add_property; ///
  const(char)* function(JSCClass* jscClass) c_jsc_class_get_name; ///
  JSCClass* function(JSCClass* jscClass) c_jsc_class_get_parent; ///

  // Context
  GType function() c_jsc_context_get_type; ///
  JSCContext* function() c_jsc_context_new; ///
  JSCContext* function(JSCVirtualMachine* vm) c_jsc_context_new_with_virtual_machine; ///
  JSCContext* function() c_jsc_context_get_current; ///
  JSCCheckSyntaxResult function(JSCContext* context, const(char)* code, ptrdiff_t length, JSCCheckSyntaxMode mode, const(char)* uri, uint lineNumber, JSCException** exception) c_jsc_context_check_syntax; ///
  void function(JSCContext* context) c_jsc_context_clear_exception; ///
  JSCValue* function(JSCContext* context, const(char)* code, ptrdiff_t length) c_jsc_context_evaluate; ///
  JSCValue* function(JSCContext* context, const(char)* code, ptrdiff_t length, void* objectInstance, JSCClass* objectClass, const(char)* uri, uint lineNumber, JSCValue** object) c_jsc_context_evaluate_in_object; ///
  JSCValue* function(JSCContext* context, const(char)* code, ptrdiff_t length, const(char)* uri, uint lineNumber) c_jsc_context_evaluate_with_source_uri; ///
  JSCException* function(JSCContext* context) c_jsc_context_get_exception; ///
  JSCValue* function(JSCContext* context) c_jsc_context_get_global_object; ///
  JSCValue* function(JSCContext* context, const(char)* name) c_jsc_context_get_value; ///
  JSCVirtualMachine* function(JSCContext* context) c_jsc_context_get_virtual_machine; ///
  void function(JSCContext* context) c_jsc_context_pop_exception_handler; ///
  void function(JSCContext* context, JSCExceptionHandler handler, void* userData, GDestroyNotify destroyNotify) c_jsc_context_push_exception_handler; ///
  JSCClass* function(JSCContext* context, const(char)* name, JSCClass* parentClass, JSCClassVTable* vtable, GDestroyNotify destroyNotify) c_jsc_context_register_class; ///
  void function(JSCContext* context, const(char)* name, JSCValue* value) c_jsc_context_set_value; ///
  void function(JSCContext* context, const(char)* errorMessage) c_jsc_context_throw; ///
  void function(JSCContext* context, JSCException* exception) c_jsc_context_throw_exception; ///
  void function(JSCContext* context, const(char)* format,  ...) c_jsc_context_throw_printf; ///
  void function(JSCContext* context, const(char)* errorName, const(char)* errorMessage) c_jsc_context_throw_with_name; ///
  void function(JSCContext* context, const(char)* errorName, const(char)* format,  ...) c_jsc_context_throw_with_name_printf; ///

  // ExceptionWrap
  GType function() c_jsc_exception_get_type; ///
  JSCException* function(JSCContext* context, const(char)* message) c_jsc_exception_new; ///
  JSCException* function(JSCContext* context, const(char)* format,  ...) c_jsc_exception_new_printf; ///
  JSCException* function(JSCContext* context, const(char)* format, void* args) c_jsc_exception_new_vprintf; ///
  JSCException* function(JSCContext* context, const(char)* name, const(char)* message) c_jsc_exception_new_with_name; ///
  JSCException* function(JSCContext* context, const(char)* name, const(char)* format,  ...) c_jsc_exception_new_with_name_printf; ///
  JSCException* function(JSCContext* context, const(char)* name, const(char)* format, void* args) c_jsc_exception_new_with_name_vprintf; ///
  const(char)* function(JSCException* exception) c_jsc_exception_get_backtrace_string; ///
  uint function(JSCException* exception) c_jsc_exception_get_column_number; ///
  uint function(JSCException* exception) c_jsc_exception_get_line_number; ///
  const(char)* function(JSCException* exception) c_jsc_exception_get_message; ///
  const(char)* function(JSCException* exception) c_jsc_exception_get_name; ///
  const(char)* function(JSCException* exception) c_jsc_exception_get_source_uri; ///
  char* function(JSCException* exception) c_jsc_exception_report; ///
  char* function(JSCException* exception) c_jsc_exception_to_string; ///

  // Value
  GType function() c_jsc_value_get_type; ///
  JSCValue* function(JSCContext* context, GType firstItemType,  ...) c_jsc_value_new_array; ///
  JSCValue* function(JSCContext* context, void* data, size_t size, GDestroyNotify destroyNotify, void* userData) c_jsc_value_new_array_buffer; ///
  JSCValue* function(JSCContext* context, GPtrArray* array) c_jsc_value_new_array_from_garray; ///
  JSCValue* function(JSCContext* context, const(char*)* strv) c_jsc_value_new_array_from_strv; ///
  JSCValue* function(JSCContext* context, bool value) c_jsc_value_new_boolean; ///
  JSCValue* function(JSCContext* context, const(char)* json) c_jsc_value_new_from_json; ///
  JSCValue* function(JSCContext* context, const(char)* name, GCallback callback, void* userData, GDestroyNotify destroyNotify, GType returnType, uint nParams,  ...) c_jsc_value_new_function; ///
  JSCValue* function(JSCContext* context, const(char)* name, GCallback callback, void* userData, GDestroyNotify destroyNotify, GType returnType) c_jsc_value_new_function_variadic; ///
  JSCValue* function(JSCContext* context, const(char)* name, GCallback callback, void* userData, GDestroyNotify destroyNotify, GType returnType, uint nParameters, GType* parameterTypes) c_jsc_value_new_functionv; ///
  JSCValue* function(JSCContext* context) c_jsc_value_new_null; ///
  JSCValue* function(JSCContext* context, double number) c_jsc_value_new_number; ///
  JSCValue* function(JSCContext* context, void* instance, JSCClass* jscClass) c_jsc_value_new_object; ///
  JSCValue* function(JSCContext* context, JSCExecutor executor, void* userData) c_jsc_value_new_promise; ///
  JSCValue* function(JSCContext* context, const(char)* string_) c_jsc_value_new_string; ///
  JSCValue* function(JSCContext* context, GBytes* bytes) c_jsc_value_new_string_from_bytes; ///
  JSCValue* function(JSCContext* context, JSCTypedArrayType type, size_t length) c_jsc_value_new_typed_array; ///
  JSCValue* function(JSCContext* context) c_jsc_value_new_undefined; ///
  void* function(JSCValue* value, size_t* size) c_jsc_value_array_buffer_get_data; ///
  size_t function(JSCValue* value) c_jsc_value_array_buffer_get_size; ///
  JSCValue* function(JSCValue* value, GType firstParameterType,  ...) c_jsc_value_constructor_call; ///
  JSCValue* function(JSCValue* value, uint nParameters, JSCValue** parameters) c_jsc_value_constructor_callv; ///
  JSCValue* function(JSCValue* value, GType firstParameterType,  ...) c_jsc_value_function_call; ///
  JSCValue* function(JSCValue* value, uint nParameters, JSCValue** parameters) c_jsc_value_function_callv; ///
  JSCContext* function(JSCValue* value) c_jsc_value_get_context; ///
  bool function(JSCValue* value) c_jsc_value_is_array; ///
  bool function(JSCValue* value) c_jsc_value_is_array_buffer; ///
  bool function(JSCValue* value) c_jsc_value_is_boolean; ///
  bool function(JSCValue* value) c_jsc_value_is_constructor; ///
  bool function(JSCValue* value) c_jsc_value_is_function; ///
  bool function(JSCValue* value) c_jsc_value_is_null; ///
  bool function(JSCValue* value) c_jsc_value_is_number; ///
  bool function(JSCValue* value) c_jsc_value_is_object; ///
  bool function(JSCValue* value) c_jsc_value_is_string; ///
  bool function(JSCValue* value) c_jsc_value_is_typed_array; ///
  bool function(JSCValue* value) c_jsc_value_is_undefined; ///
  JSCValue* function(JSCValue* arrayBuffer, JSCTypedArrayType type, size_t offset, ptrdiff_t length) c_jsc_value_new_typed_array_with_buffer; ///
  void function(JSCValue* value, const(char)* propertyName, JSCValuePropertyFlags flags, GType propertyType, GCallback getter, GCallback setter, void* userData, GDestroyNotify destroyNotify) c_jsc_value_object_define_property_accessor; ///
  void function(JSCValue* value, const(char)* propertyName, JSCValuePropertyFlags flags, JSCValue* propertyValue) c_jsc_value_object_define_property_data; ///
  bool function(JSCValue* value, const(char)* name) c_jsc_value_object_delete_property; ///
  char** function(JSCValue* value) c_jsc_value_object_enumerate_properties; ///
  JSCValue* function(JSCValue* value, const(char)* name) c_jsc_value_object_get_property; ///
  JSCValue* function(JSCValue* value, uint index) c_jsc_value_object_get_property_at_index; ///
  bool function(JSCValue* value, const(char)* name) c_jsc_value_object_has_property; ///
  JSCValue* function(JSCValue* value, const(char)* name, GType firstParameterType,  ...) c_jsc_value_object_invoke_method; ///
  JSCValue* function(JSCValue* value, const(char)* name, uint nParameters, JSCValue** parameters) c_jsc_value_object_invoke_methodv; ///
  bool function(JSCValue* value, const(char)* name) c_jsc_value_object_is_instance_of; ///
  void function(JSCValue* value, const(char)* name, JSCValue* property) c_jsc_value_object_set_property; ///
  void function(JSCValue* value, uint index, JSCValue* property) c_jsc_value_object_set_property_at_index; ///
  bool function(JSCValue* value) c_jsc_value_to_boolean; ///
  double function(JSCValue* value) c_jsc_value_to_double; ///
  int function(JSCValue* value) c_jsc_value_to_int32; ///
  char* function(JSCValue* value, uint indent) c_jsc_value_to_json; ///
  char* function(JSCValue* value) c_jsc_value_to_string; ///
  GBytes* function(JSCValue* value) c_jsc_value_to_string_as_bytes; ///
  JSCValue* function(JSCValue* value) c_jsc_value_typed_array_get_buffer; ///
  void* function(JSCValue* value, size_t* length) c_jsc_value_typed_array_get_data; ///
  size_t function(JSCValue* value) c_jsc_value_typed_array_get_length; ///
  size_t function(JSCValue* value) c_jsc_value_typed_array_get_offset; ///
  size_t function(JSCValue* value) c_jsc_value_typed_array_get_size; ///
  JSCTypedArrayType function(JSCValue* value) c_jsc_value_typed_array_get_type; ///

  // VirtualMachine
  GType function() c_jsc_virtual_machine_get_type; ///
  JSCVirtualMachine* function() c_jsc_virtual_machine_new; ///

  // WeakValue
  GType function() c_jsc_weak_value_get_type; ///
  JSCWeakValue* function(JSCValue* value) c_jsc_weak_value_new; ///
  JSCValue* function(JSCWeakValue* weakValue) c_jsc_weak_value_get_value; ///

  // global
  uint function() c_jsc_get_major_version; ///
  uint function() c_jsc_get_micro_version; ///
  uint function() c_jsc_get_minor_version; ///
  void function(JSCOptionsFunc function_, void* userData) c_jsc_options_foreach; ///
  bool function(const(char)* option, bool* value) c_jsc_options_get_boolean; ///
  bool function(const(char)* option, double* value) c_jsc_options_get_double; ///
  bool function(const(char)* option, int* value) c_jsc_options_get_int; ///
  GOptionGroup* function() c_jsc_options_get_option_group; ///
  bool function(const(char)* option, char** value) c_jsc_options_get_range_string; ///
  bool function(const(char)* option, size_t* value) c_jsc_options_get_size; ///
  bool function(const(char)* option, char** value) c_jsc_options_get_string; ///
  bool function(const(char)* option, uint* value) c_jsc_options_get_uint; ///
  bool function(const(char)* option, bool value) c_jsc_options_set_boolean; ///
  bool function(const(char)* option, double value) c_jsc_options_set_double; ///
  bool function(const(char)* option, int value) c_jsc_options_set_int; ///
  bool function(const(char)* option, const(char)* value) c_jsc_options_set_range_string; ///
  bool function(const(char)* option, size_t value) c_jsc_options_set_size; ///
  bool function(const(char)* option, const(char)* value) c_jsc_options_set_string; ///
  bool function(const(char)* option, uint value) c_jsc_options_set_uint; ///
}

// Class

/** */
alias jsc_class_get_type = c_jsc_class_get_type;

/** */
alias jsc_class_add_constructor = c_jsc_class_add_constructor;

/** */
alias jsc_class_add_constructor_variadic = c_jsc_class_add_constructor_variadic;

/** */
alias jsc_class_add_constructorv = c_jsc_class_add_constructorv;

/** */
alias jsc_class_add_method = c_jsc_class_add_method;

/** */
alias jsc_class_add_method_variadic = c_jsc_class_add_method_variadic;

/** */
alias jsc_class_add_methodv = c_jsc_class_add_methodv;

/** */
alias jsc_class_add_property = c_jsc_class_add_property;

/** */
alias jsc_class_get_name = c_jsc_class_get_name;

/** */
alias jsc_class_get_parent = c_jsc_class_get_parent;

// Context

/** */
alias jsc_context_get_type = c_jsc_context_get_type;

/** */
alias jsc_context_new = c_jsc_context_new;

/** */
alias jsc_context_new_with_virtual_machine = c_jsc_context_new_with_virtual_machine;

/** */
alias jsc_context_get_current = c_jsc_context_get_current;

/** */
alias jsc_context_check_syntax = c_jsc_context_check_syntax;

/** */
alias jsc_context_clear_exception = c_jsc_context_clear_exception;

/** */
alias jsc_context_evaluate = c_jsc_context_evaluate;

/** */
alias jsc_context_evaluate_in_object = c_jsc_context_evaluate_in_object;

/** */
alias jsc_context_evaluate_with_source_uri = c_jsc_context_evaluate_with_source_uri;

/** */
alias jsc_context_get_exception = c_jsc_context_get_exception;

/** */
alias jsc_context_get_global_object = c_jsc_context_get_global_object;

/** */
alias jsc_context_get_value = c_jsc_context_get_value;

/** */
alias jsc_context_get_virtual_machine = c_jsc_context_get_virtual_machine;

/** */
alias jsc_context_pop_exception_handler = c_jsc_context_pop_exception_handler;

/** */
alias jsc_context_push_exception_handler = c_jsc_context_push_exception_handler;

/** */
alias jsc_context_register_class = c_jsc_context_register_class;

/** */
alias jsc_context_set_value = c_jsc_context_set_value;

/** */
alias jsc_context_throw = c_jsc_context_throw;

/** */
alias jsc_context_throw_exception = c_jsc_context_throw_exception;

/** */
alias jsc_context_throw_printf = c_jsc_context_throw_printf;

/** */
alias jsc_context_throw_with_name = c_jsc_context_throw_with_name;

/** */
alias jsc_context_throw_with_name_printf = c_jsc_context_throw_with_name_printf;

// ExceptionWrap

/** */
alias jsc_exception_get_type = c_jsc_exception_get_type;

/** */
alias jsc_exception_new = c_jsc_exception_new;

/** */
alias jsc_exception_new_printf = c_jsc_exception_new_printf;

/** */
alias jsc_exception_new_vprintf = c_jsc_exception_new_vprintf;

/** */
alias jsc_exception_new_with_name = c_jsc_exception_new_with_name;

/** */
alias jsc_exception_new_with_name_printf = c_jsc_exception_new_with_name_printf;

/** */
alias jsc_exception_new_with_name_vprintf = c_jsc_exception_new_with_name_vprintf;

/** */
alias jsc_exception_get_backtrace_string = c_jsc_exception_get_backtrace_string;

/** */
alias jsc_exception_get_column_number = c_jsc_exception_get_column_number;

/** */
alias jsc_exception_get_line_number = c_jsc_exception_get_line_number;

/** */
alias jsc_exception_get_message = c_jsc_exception_get_message;

/** */
alias jsc_exception_get_name = c_jsc_exception_get_name;

/** */
alias jsc_exception_get_source_uri = c_jsc_exception_get_source_uri;

/** */
alias jsc_exception_report = c_jsc_exception_report;

/** */
alias jsc_exception_to_string = c_jsc_exception_to_string;

// Value

/** */
alias jsc_value_get_type = c_jsc_value_get_type;

/** */
alias jsc_value_new_array = c_jsc_value_new_array;

/** */
alias jsc_value_new_array_buffer = c_jsc_value_new_array_buffer;

/** */
alias jsc_value_new_array_from_garray = c_jsc_value_new_array_from_garray;

/** */
alias jsc_value_new_array_from_strv = c_jsc_value_new_array_from_strv;

/** */
alias jsc_value_new_boolean = c_jsc_value_new_boolean;

/** */
alias jsc_value_new_from_json = c_jsc_value_new_from_json;

/** */
alias jsc_value_new_function = c_jsc_value_new_function;

/** */
alias jsc_value_new_function_variadic = c_jsc_value_new_function_variadic;

/** */
alias jsc_value_new_functionv = c_jsc_value_new_functionv;

/** */
alias jsc_value_new_null = c_jsc_value_new_null;

/** */
alias jsc_value_new_number = c_jsc_value_new_number;

/** */
alias jsc_value_new_object = c_jsc_value_new_object;

/** */
alias jsc_value_new_promise = c_jsc_value_new_promise;

/** */
alias jsc_value_new_string = c_jsc_value_new_string;

/** */
alias jsc_value_new_string_from_bytes = c_jsc_value_new_string_from_bytes;

/** */
alias jsc_value_new_typed_array = c_jsc_value_new_typed_array;

/** */
alias jsc_value_new_undefined = c_jsc_value_new_undefined;

/** */
alias jsc_value_array_buffer_get_data = c_jsc_value_array_buffer_get_data;

/** */
alias jsc_value_array_buffer_get_size = c_jsc_value_array_buffer_get_size;

/** */
alias jsc_value_constructor_call = c_jsc_value_constructor_call;

/** */
alias jsc_value_constructor_callv = c_jsc_value_constructor_callv;

/** */
alias jsc_value_function_call = c_jsc_value_function_call;

/** */
alias jsc_value_function_callv = c_jsc_value_function_callv;

/** */
alias jsc_value_get_context = c_jsc_value_get_context;

/** */
alias jsc_value_is_array = c_jsc_value_is_array;

/** */
alias jsc_value_is_array_buffer = c_jsc_value_is_array_buffer;

/** */
alias jsc_value_is_boolean = c_jsc_value_is_boolean;

/** */
alias jsc_value_is_constructor = c_jsc_value_is_constructor;

/** */
alias jsc_value_is_function = c_jsc_value_is_function;

/** */
alias jsc_value_is_null = c_jsc_value_is_null;

/** */
alias jsc_value_is_number = c_jsc_value_is_number;

/** */
alias jsc_value_is_object = c_jsc_value_is_object;

/** */
alias jsc_value_is_string = c_jsc_value_is_string;

/** */
alias jsc_value_is_typed_array = c_jsc_value_is_typed_array;

/** */
alias jsc_value_is_undefined = c_jsc_value_is_undefined;

/** */
alias jsc_value_new_typed_array_with_buffer = c_jsc_value_new_typed_array_with_buffer;

/** */
alias jsc_value_object_define_property_accessor = c_jsc_value_object_define_property_accessor;

/** */
alias jsc_value_object_define_property_data = c_jsc_value_object_define_property_data;

/** */
alias jsc_value_object_delete_property = c_jsc_value_object_delete_property;

/** */
alias jsc_value_object_enumerate_properties = c_jsc_value_object_enumerate_properties;

/** */
alias jsc_value_object_get_property = c_jsc_value_object_get_property;

/** */
alias jsc_value_object_get_property_at_index = c_jsc_value_object_get_property_at_index;

/** */
alias jsc_value_object_has_property = c_jsc_value_object_has_property;

/** */
alias jsc_value_object_invoke_method = c_jsc_value_object_invoke_method;

/** */
alias jsc_value_object_invoke_methodv = c_jsc_value_object_invoke_methodv;

/** */
alias jsc_value_object_is_instance_of = c_jsc_value_object_is_instance_of;

/** */
alias jsc_value_object_set_property = c_jsc_value_object_set_property;

/** */
alias jsc_value_object_set_property_at_index = c_jsc_value_object_set_property_at_index;

/** */
alias jsc_value_to_boolean = c_jsc_value_to_boolean;

/** */
alias jsc_value_to_double = c_jsc_value_to_double;

/** */
alias jsc_value_to_int32 = c_jsc_value_to_int32;

/** */
alias jsc_value_to_json = c_jsc_value_to_json;

/** */
alias jsc_value_to_string = c_jsc_value_to_string;

/** */
alias jsc_value_to_string_as_bytes = c_jsc_value_to_string_as_bytes;

/** */
alias jsc_value_typed_array_get_buffer = c_jsc_value_typed_array_get_buffer;

/** */
alias jsc_value_typed_array_get_data = c_jsc_value_typed_array_get_data;

/** */
alias jsc_value_typed_array_get_length = c_jsc_value_typed_array_get_length;

/** */
alias jsc_value_typed_array_get_offset = c_jsc_value_typed_array_get_offset;

/** */
alias jsc_value_typed_array_get_size = c_jsc_value_typed_array_get_size;

/** */
alias jsc_value_typed_array_get_type = c_jsc_value_typed_array_get_type;

// VirtualMachine

/** */
alias jsc_virtual_machine_get_type = c_jsc_virtual_machine_get_type;

/** */
alias jsc_virtual_machine_new = c_jsc_virtual_machine_new;

// WeakValue

/** */
alias jsc_weak_value_get_type = c_jsc_weak_value_get_type;

/** */
alias jsc_weak_value_new = c_jsc_weak_value_new;

/** */
alias jsc_weak_value_get_value = c_jsc_weak_value_get_value;

// global

/** */
alias jsc_get_major_version = c_jsc_get_major_version;

/** */
alias jsc_get_micro_version = c_jsc_get_micro_version;

/** */
alias jsc_get_minor_version = c_jsc_get_minor_version;

/** */
alias jsc_options_foreach = c_jsc_options_foreach;

/** */
alias jsc_options_get_boolean = c_jsc_options_get_boolean;

/** */
alias jsc_options_get_double = c_jsc_options_get_double;

/** */
alias jsc_options_get_int = c_jsc_options_get_int;

/** */
alias jsc_options_get_option_group = c_jsc_options_get_option_group;

/** */
alias jsc_options_get_range_string = c_jsc_options_get_range_string;

/** */
alias jsc_options_get_size = c_jsc_options_get_size;

/** */
alias jsc_options_get_string = c_jsc_options_get_string;

/** */
alias jsc_options_get_uint = c_jsc_options_get_uint;

/** */
alias jsc_options_set_boolean = c_jsc_options_set_boolean;

/** */
alias jsc_options_set_double = c_jsc_options_set_double;

/** */
alias jsc_options_set_int = c_jsc_options_set_int;

/** */
alias jsc_options_set_range_string = c_jsc_options_set_range_string;

/** */
alias jsc_options_set_size = c_jsc_options_set_size;

/** */
alias jsc_options_set_string = c_jsc_options_set_string;

/** */
alias jsc_options_set_uint = c_jsc_options_set_uint;

shared static this()
{
  // Class
  gidLink(cast(void**)&jsc_class_get_type, "jsc_class_get_type", LIBS);
  gidLink(cast(void**)&jsc_class_add_constructor, "jsc_class_add_constructor", LIBS);
  gidLink(cast(void**)&jsc_class_add_constructor_variadic, "jsc_class_add_constructor_variadic", LIBS);
  gidLink(cast(void**)&jsc_class_add_constructorv, "jsc_class_add_constructorv", LIBS);
  gidLink(cast(void**)&jsc_class_add_method, "jsc_class_add_method", LIBS);
  gidLink(cast(void**)&jsc_class_add_method_variadic, "jsc_class_add_method_variadic", LIBS);
  gidLink(cast(void**)&jsc_class_add_methodv, "jsc_class_add_methodv", LIBS);
  gidLink(cast(void**)&jsc_class_add_property, "jsc_class_add_property", LIBS);
  gidLink(cast(void**)&jsc_class_get_name, "jsc_class_get_name", LIBS);
  gidLink(cast(void**)&jsc_class_get_parent, "jsc_class_get_parent", LIBS);

  // Context
  gidLink(cast(void**)&jsc_context_get_type, "jsc_context_get_type", LIBS);
  gidLink(cast(void**)&jsc_context_new, "jsc_context_new", LIBS);
  gidLink(cast(void**)&jsc_context_new_with_virtual_machine, "jsc_context_new_with_virtual_machine", LIBS);
  gidLink(cast(void**)&jsc_context_get_current, "jsc_context_get_current", LIBS);
  gidLink(cast(void**)&jsc_context_check_syntax, "jsc_context_check_syntax", LIBS);
  gidLink(cast(void**)&jsc_context_clear_exception, "jsc_context_clear_exception", LIBS);
  gidLink(cast(void**)&jsc_context_evaluate, "jsc_context_evaluate", LIBS);
  gidLink(cast(void**)&jsc_context_evaluate_in_object, "jsc_context_evaluate_in_object", LIBS);
  gidLink(cast(void**)&jsc_context_evaluate_with_source_uri, "jsc_context_evaluate_with_source_uri", LIBS);
  gidLink(cast(void**)&jsc_context_get_exception, "jsc_context_get_exception", LIBS);
  gidLink(cast(void**)&jsc_context_get_global_object, "jsc_context_get_global_object", LIBS);
  gidLink(cast(void**)&jsc_context_get_value, "jsc_context_get_value", LIBS);
  gidLink(cast(void**)&jsc_context_get_virtual_machine, "jsc_context_get_virtual_machine", LIBS);
  gidLink(cast(void**)&jsc_context_pop_exception_handler, "jsc_context_pop_exception_handler", LIBS);
  gidLink(cast(void**)&jsc_context_push_exception_handler, "jsc_context_push_exception_handler", LIBS);
  gidLink(cast(void**)&jsc_context_register_class, "jsc_context_register_class", LIBS);
  gidLink(cast(void**)&jsc_context_set_value, "jsc_context_set_value", LIBS);
  gidLink(cast(void**)&jsc_context_throw, "jsc_context_throw", LIBS);
  gidLink(cast(void**)&jsc_context_throw_exception, "jsc_context_throw_exception", LIBS);
  gidLink(cast(void**)&jsc_context_throw_printf, "jsc_context_throw_printf", LIBS);
  gidLink(cast(void**)&jsc_context_throw_with_name, "jsc_context_throw_with_name", LIBS);
  gidLink(cast(void**)&jsc_context_throw_with_name_printf, "jsc_context_throw_with_name_printf", LIBS);

  // ExceptionWrap
  gidLink(cast(void**)&jsc_exception_get_type, "jsc_exception_get_type", LIBS);
  gidLink(cast(void**)&jsc_exception_new, "jsc_exception_new", LIBS);
  gidLink(cast(void**)&jsc_exception_new_printf, "jsc_exception_new_printf", LIBS);
  gidLink(cast(void**)&jsc_exception_new_vprintf, "jsc_exception_new_vprintf", LIBS);
  gidLink(cast(void**)&jsc_exception_new_with_name, "jsc_exception_new_with_name", LIBS);
  gidLink(cast(void**)&jsc_exception_new_with_name_printf, "jsc_exception_new_with_name_printf", LIBS);
  gidLink(cast(void**)&jsc_exception_new_with_name_vprintf, "jsc_exception_new_with_name_vprintf", LIBS);
  gidLink(cast(void**)&jsc_exception_get_backtrace_string, "jsc_exception_get_backtrace_string", LIBS);
  gidLink(cast(void**)&jsc_exception_get_column_number, "jsc_exception_get_column_number", LIBS);
  gidLink(cast(void**)&jsc_exception_get_line_number, "jsc_exception_get_line_number", LIBS);
  gidLink(cast(void**)&jsc_exception_get_message, "jsc_exception_get_message", LIBS);
  gidLink(cast(void**)&jsc_exception_get_name, "jsc_exception_get_name", LIBS);
  gidLink(cast(void**)&jsc_exception_get_source_uri, "jsc_exception_get_source_uri", LIBS);
  gidLink(cast(void**)&jsc_exception_report, "jsc_exception_report", LIBS);
  gidLink(cast(void**)&jsc_exception_to_string, "jsc_exception_to_string", LIBS);

  // Value
  gidLink(cast(void**)&jsc_value_get_type, "jsc_value_get_type", LIBS);
  gidLink(cast(void**)&jsc_value_new_array, "jsc_value_new_array", LIBS);
  gidLink(cast(void**)&jsc_value_new_array_buffer, "jsc_value_new_array_buffer", LIBS);
  gidLink(cast(void**)&jsc_value_new_array_from_garray, "jsc_value_new_array_from_garray", LIBS);
  gidLink(cast(void**)&jsc_value_new_array_from_strv, "jsc_value_new_array_from_strv", LIBS);
  gidLink(cast(void**)&jsc_value_new_boolean, "jsc_value_new_boolean", LIBS);
  gidLink(cast(void**)&jsc_value_new_from_json, "jsc_value_new_from_json", LIBS);
  gidLink(cast(void**)&jsc_value_new_function, "jsc_value_new_function", LIBS);
  gidLink(cast(void**)&jsc_value_new_function_variadic, "jsc_value_new_function_variadic", LIBS);
  gidLink(cast(void**)&jsc_value_new_functionv, "jsc_value_new_functionv", LIBS);
  gidLink(cast(void**)&jsc_value_new_null, "jsc_value_new_null", LIBS);
  gidLink(cast(void**)&jsc_value_new_number, "jsc_value_new_number", LIBS);
  gidLink(cast(void**)&jsc_value_new_object, "jsc_value_new_object", LIBS);
  gidLink(cast(void**)&jsc_value_new_promise, "jsc_value_new_promise", LIBS);
  gidLink(cast(void**)&jsc_value_new_string, "jsc_value_new_string", LIBS);
  gidLink(cast(void**)&jsc_value_new_string_from_bytes, "jsc_value_new_string_from_bytes", LIBS);
  gidLink(cast(void**)&jsc_value_new_typed_array, "jsc_value_new_typed_array", LIBS);
  gidLink(cast(void**)&jsc_value_new_undefined, "jsc_value_new_undefined", LIBS);
  gidLink(cast(void**)&jsc_value_array_buffer_get_data, "jsc_value_array_buffer_get_data", LIBS);
  gidLink(cast(void**)&jsc_value_array_buffer_get_size, "jsc_value_array_buffer_get_size", LIBS);
  gidLink(cast(void**)&jsc_value_constructor_call, "jsc_value_constructor_call", LIBS);
  gidLink(cast(void**)&jsc_value_constructor_callv, "jsc_value_constructor_callv", LIBS);
  gidLink(cast(void**)&jsc_value_function_call, "jsc_value_function_call", LIBS);
  gidLink(cast(void**)&jsc_value_function_callv, "jsc_value_function_callv", LIBS);
  gidLink(cast(void**)&jsc_value_get_context, "jsc_value_get_context", LIBS);
  gidLink(cast(void**)&jsc_value_is_array, "jsc_value_is_array", LIBS);
  gidLink(cast(void**)&jsc_value_is_array_buffer, "jsc_value_is_array_buffer", LIBS);
  gidLink(cast(void**)&jsc_value_is_boolean, "jsc_value_is_boolean", LIBS);
  gidLink(cast(void**)&jsc_value_is_constructor, "jsc_value_is_constructor", LIBS);
  gidLink(cast(void**)&jsc_value_is_function, "jsc_value_is_function", LIBS);
  gidLink(cast(void**)&jsc_value_is_null, "jsc_value_is_null", LIBS);
  gidLink(cast(void**)&jsc_value_is_number, "jsc_value_is_number", LIBS);
  gidLink(cast(void**)&jsc_value_is_object, "jsc_value_is_object", LIBS);
  gidLink(cast(void**)&jsc_value_is_string, "jsc_value_is_string", LIBS);
  gidLink(cast(void**)&jsc_value_is_typed_array, "jsc_value_is_typed_array", LIBS);
  gidLink(cast(void**)&jsc_value_is_undefined, "jsc_value_is_undefined", LIBS);
  gidLink(cast(void**)&jsc_value_new_typed_array_with_buffer, "jsc_value_new_typed_array_with_buffer", LIBS);
  gidLink(cast(void**)&jsc_value_object_define_property_accessor, "jsc_value_object_define_property_accessor", LIBS);
  gidLink(cast(void**)&jsc_value_object_define_property_data, "jsc_value_object_define_property_data", LIBS);
  gidLink(cast(void**)&jsc_value_object_delete_property, "jsc_value_object_delete_property", LIBS);
  gidLink(cast(void**)&jsc_value_object_enumerate_properties, "jsc_value_object_enumerate_properties", LIBS);
  gidLink(cast(void**)&jsc_value_object_get_property, "jsc_value_object_get_property", LIBS);
  gidLink(cast(void**)&jsc_value_object_get_property_at_index, "jsc_value_object_get_property_at_index", LIBS);
  gidLink(cast(void**)&jsc_value_object_has_property, "jsc_value_object_has_property", LIBS);
  gidLink(cast(void**)&jsc_value_object_invoke_method, "jsc_value_object_invoke_method", LIBS);
  gidLink(cast(void**)&jsc_value_object_invoke_methodv, "jsc_value_object_invoke_methodv", LIBS);
  gidLink(cast(void**)&jsc_value_object_is_instance_of, "jsc_value_object_is_instance_of", LIBS);
  gidLink(cast(void**)&jsc_value_object_set_property, "jsc_value_object_set_property", LIBS);
  gidLink(cast(void**)&jsc_value_object_set_property_at_index, "jsc_value_object_set_property_at_index", LIBS);
  gidLink(cast(void**)&jsc_value_to_boolean, "jsc_value_to_boolean", LIBS);
  gidLink(cast(void**)&jsc_value_to_double, "jsc_value_to_double", LIBS);
  gidLink(cast(void**)&jsc_value_to_int32, "jsc_value_to_int32", LIBS);
  gidLink(cast(void**)&jsc_value_to_json, "jsc_value_to_json", LIBS);
  gidLink(cast(void**)&jsc_value_to_string, "jsc_value_to_string", LIBS);
  gidLink(cast(void**)&jsc_value_to_string_as_bytes, "jsc_value_to_string_as_bytes", LIBS);
  gidLink(cast(void**)&jsc_value_typed_array_get_buffer, "jsc_value_typed_array_get_buffer", LIBS);
  gidLink(cast(void**)&jsc_value_typed_array_get_data, "jsc_value_typed_array_get_data", LIBS);
  gidLink(cast(void**)&jsc_value_typed_array_get_length, "jsc_value_typed_array_get_length", LIBS);
  gidLink(cast(void**)&jsc_value_typed_array_get_offset, "jsc_value_typed_array_get_offset", LIBS);
  gidLink(cast(void**)&jsc_value_typed_array_get_size, "jsc_value_typed_array_get_size", LIBS);
  gidLink(cast(void**)&jsc_value_typed_array_get_type, "jsc_value_typed_array_get_type", LIBS);

  // VirtualMachine
  gidLink(cast(void**)&jsc_virtual_machine_get_type, "jsc_virtual_machine_get_type", LIBS);
  gidLink(cast(void**)&jsc_virtual_machine_new, "jsc_virtual_machine_new", LIBS);

  // WeakValue
  gidLink(cast(void**)&jsc_weak_value_get_type, "jsc_weak_value_get_type", LIBS);
  gidLink(cast(void**)&jsc_weak_value_new, "jsc_weak_value_new", LIBS);
  gidLink(cast(void**)&jsc_weak_value_get_value, "jsc_weak_value_get_value", LIBS);

  // global
  gidLink(cast(void**)&jsc_get_major_version, "jsc_get_major_version", LIBS);
  gidLink(cast(void**)&jsc_get_micro_version, "jsc_get_micro_version", LIBS);
  gidLink(cast(void**)&jsc_get_minor_version, "jsc_get_minor_version", LIBS);
  gidLink(cast(void**)&jsc_options_foreach, "jsc_options_foreach", LIBS);
  gidLink(cast(void**)&jsc_options_get_boolean, "jsc_options_get_boolean", LIBS);
  gidLink(cast(void**)&jsc_options_get_double, "jsc_options_get_double", LIBS);
  gidLink(cast(void**)&jsc_options_get_int, "jsc_options_get_int", LIBS);
  gidLink(cast(void**)&jsc_options_get_option_group, "jsc_options_get_option_group", LIBS);
  gidLink(cast(void**)&jsc_options_get_range_string, "jsc_options_get_range_string", LIBS);
  gidLink(cast(void**)&jsc_options_get_size, "jsc_options_get_size", LIBS);
  gidLink(cast(void**)&jsc_options_get_string, "jsc_options_get_string", LIBS);
  gidLink(cast(void**)&jsc_options_get_uint, "jsc_options_get_uint", LIBS);
  gidLink(cast(void**)&jsc_options_set_boolean, "jsc_options_set_boolean", LIBS);
  gidLink(cast(void**)&jsc_options_set_double, "jsc_options_set_double", LIBS);
  gidLink(cast(void**)&jsc_options_set_int, "jsc_options_set_int", LIBS);
  gidLink(cast(void**)&jsc_options_set_range_string, "jsc_options_set_range_string", LIBS);
  gidLink(cast(void**)&jsc_options_set_size, "jsc_options_set_size", LIBS);
  gidLink(cast(void**)&jsc_options_set_string, "jsc_options_set_string", LIBS);
  gidLink(cast(void**)&jsc_options_set_uint, "jsc_options_set_uint", LIBS);
}
