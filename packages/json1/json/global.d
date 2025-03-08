module json.global;

import gid.gid;
import glib.error;
import glib.variant;
import gobject.object;
import gobject.types;
import json.c.functions;
import json.c.types;
import json.node;
import json.types;


/**
    Checks whether it is possible to deserialize a `GBoxed` of
  type `gboxed_type` from a [json.node.Node] of type `node_type`.
  Params:
    gboxedType =       a boxed type
    nodeType =       a node type
  Returns:     `TRUE` if the type can be deserialized, and `FALSE` otherwise
*/
bool boxedCanDeserialize(gobject.types.GType gboxedType, json.types.NodeType nodeType)
{
  bool _retval;
  _retval = json_boxed_can_deserialize(gboxedType, nodeType);
  return _retval;
}

/**
    Checks whether it is possible to serialize a `GBoxed` of
  type `gboxed_type` into a [json.node.Node].
  
  The type of the node is placed inside `node_type` if the function
  returns `TRUE`, and it's undefined otherwise.
  Params:
    gboxedType =       a boxed type
    nodeType =       the node type to which the boxed type
        can be serialized into
  Returns:     `TRUE` if the type can be serialized, and `FALSE` otherwise
*/
bool boxedCanSerialize(gobject.types.GType gboxedType, out json.types.NodeType nodeType)
{
  bool _retval;
  _retval = json_boxed_can_serialize(gboxedType, &nodeType);
  return _retval;
}

/**
    Deserializes the given [json.node.Node] into a `GBoxed` of the given type.
  Params:
    gboxedType =       a boxed type
    node =       a node
  Returns:     the newly allocated boxed data
*/
void* boxedDeserialize(gobject.types.GType gboxedType, json.node.Node node)
{
  auto _retval = json_boxed_deserialize(gboxedType, node ? cast(JsonNode*)node.cPtr(No.dup) : null);
  return _retval;
}

/**
    Serializes a pointer to a `GBoxed` of the given type into a [json.node.Node].
  
  If the serialization is not possible, this function will return `NULL`.
  Params:
    gboxedType =       a boxed type
    boxed =       a pointer to a boxed of type `gboxed_type`
  Returns:     a node with the serialized boxed type
*/
json.node.Node boxedSerialize(gobject.types.GType gboxedType, const(void)* boxed = null)
{
  JsonNode* _cretval;
  _cretval = json_boxed_serialize(gboxedType, boxed);
  auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, Yes.take) : null;
  return _retval;
}

/**
    Deserializes a JSON data stream and creates an instance of the given
  type.
  
  If the given type implements the [json.serializable.Serializable] interface, it
  will be asked to deserialize all the JSON members into their respective
  properties; otherwise, the default implementation will be used to translate
  the compatible JSON native types.
  
  **Note**: the JSON data stream must be an object.
  
  For historical reasons, the `length` argument is unused. The given `data`
  must be a `NUL`-terminated string.
  Params:
    gtype =       the type of the object to construct
    data =       a JSON data stream
    length =       length of the data stream (unused)
  Returns:     a new object instance of the given
      type

  Deprecated:     Use `funcJson.gobject_from_data` instead
*/
gobject.object.ObjectG constructGobject(gobject.types.GType gtype, string data, size_t length)
{
  ObjectC* _cretval;
  const(char)* _data = data.toCString(No.alloc);
  GError *_err;
  _cretval = json_construct_gobject(gtype, _data, length, &_err);
  if (_err)
    throw new ErrorG(_err);
  auto _retval = ObjectG.getDObject!(gobject.object.ObjectG)(cast(ObjectC*)_cretval, Yes.take);
  return _retval;
}

/**
    Parses the given string and returns the corresponding JSON tree.
  
  If the string is empty, this function will return `NULL`.
  
  In case of parsing error, this function returns `NULL` and sets
  the error appropriately.
  Params:
    str =       a valid UTF-8 string containing JSON data
  Returns:     the root node of the JSON tree
*/
json.node.Node fromString(string str)
{
  JsonNode* _cretval;
  const(char)* _str = str.toCString(No.alloc);
  GError *_err;
  _cretval = json_from_string(_str, &_err);
  if (_err)
    throw new ErrorG(_err);
  auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, Yes.take) : null;
  return _retval;
}

/**
    Creates a new [gobject.object.ObjectG] instance of the given type, and constructs it
  using the members of the object in the given node.
  Params:
    gtype =       the type of the object to create
    node =       a node of type [json.types.NodeType.object] describing the
        object instance for the given type
  Returns:     The newly created instance
*/
gobject.object.ObjectG gobjectDeserialize(gobject.types.GType gtype, json.node.Node node)
{
  ObjectC* _cretval;
  _cretval = json_gobject_deserialize(gtype, node ? cast(JsonNode*)node.cPtr(No.dup) : null);
  auto _retval = ObjectG.getDObject!(gobject.object.ObjectG)(cast(ObjectC*)_cretval, Yes.take);
  return _retval;
}

/**
    Deserializes a JSON data stream and creates an instance of the
  given type.
  
  If the type implements the [json.serializable.Serializable] interface, it will
  be asked to deserialize all the JSON members into their respective properties;
  otherwise, the default implementation will be used to translate the
  compatible JSON native types.
  
  **Note**: the JSON data stream must be an object
  Params:
    gtype =       the type of the object to construct
    data =       a JSON data stream
    length =       length of the data stream, or -1 if it is `NUL`-terminated
  Returns:     a new object instance of the given type
*/
gobject.object.ObjectG gobjectFromData(gobject.types.GType gtype, string data, ptrdiff_t length)
{
  ObjectC* _cretval;
  const(char)* _data = data.toCString(No.alloc);
  GError *_err;
  _cretval = json_gobject_from_data(gtype, _data, length, &_err);
  if (_err)
    throw new ErrorG(_err);
  auto _retval = ObjectG.getDObject!(gobject.object.ObjectG)(cast(ObjectC*)_cretval, Yes.take);
  return _retval;
}

/**
    Creates a JSON tree representing the passed object instance.
  
  Each member of the returned JSON object will map to a property of
  the object type.
  
  The returned JSON tree will be returned as a [json.node.Node] with a type
  of [json.types.NodeType.object].
  Params:
    gobject =       the object to serialize
  Returns:     the newly created JSON tree
*/
json.node.Node gobjectSerialize(gobject.object.ObjectG gobject)
{
  JsonNode* _cretval;
  _cretval = json_gobject_serialize(gobject ? cast(ObjectC*)gobject.cPtr(No.dup) : null);
  auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, Yes.take) : null;
  return _retval;
}

/**
    Serializes a [gobject.object.ObjectG] instance into a JSON data stream, iterating
  recursively over each property.
  
  If the given object implements the [json.serializable.Serializable] interface,
  it will be asked to serialize all its properties; otherwise, the default
  implementation will be use to translate the compatible types into
  JSON native types.
  Params:
    gobject =       the object to serialize
    length =       return value for the length of the buffer
  Returns:     a JSON data stream representing the given object
*/
string gobjectToData(gobject.object.ObjectG gobject, out size_t length)
{
  char* _cretval;
  _cretval = json_gobject_to_data(gobject ? cast(ObjectC*)gobject.cPtr(No.dup) : null, cast(size_t*)&length);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.free);
  return _retval;
}

/**
    Converts a JSON data structure to a [glib.variant.VariantG].
  
  If `signature` is not `NULL`, it will be used to resolve ambiguous
  data types.
  
  If no error occurs, the resulting [glib.variant.VariantG] is guaranteed to conform
  to `signature`.
  
  If `signature` is not `NULL` but does not represent a valid [glib.variant.VariantG] type
  string, `NULL` is returned and the `error` is set to
  [gio.types.IOErrorEnum.invalidArgument].
  
  If a `signature` is provided but the JSON structure cannot be mapped to it,
  `NULL` is returned and the `error` is set to [gio.types.IOErrorEnum.invalidData].
  
  If `signature` is `NULL`, the conversion is done based strictly on the types
  in the JSON nodes.
  
  The returned variant has a floating reference that will need to be sunk
  by the caller code.
  Params:
    jsonNode =       the node to convert
    signature =       a valid [glib.variant.VariantG] type string
  Returns:     A newly created [glib.variant.VariantG]
*/
glib.variant.VariantG gvariantDeserialize(json.node.Node jsonNode, string signature = null)
{
  VariantC* _cretval;
  const(char)* _signature = signature.toCString(No.alloc);
  GError *_err;
  _cretval = json_gvariant_deserialize(jsonNode ? cast(JsonNode*)jsonNode.cPtr(No.dup) : null, _signature, &_err);
  if (_err)
    throw new ErrorG(_err);
  auto _retval = _cretval ? new glib.variant.VariantG(cast(VariantC*)_cretval, No.take) : null;
  return _retval;
}

/**
    Converts a JSON string to a [glib.variant.VariantG] value.
  
  This function works exactly like `funcJson.gvariant_deserialize`, but
  takes a JSON encoded string instead.
  
  The string is first converted to a [json.node.Node] using
  [json.parser.Parser], and then [json.global.gvariantDeserialize] is called on
  the node.
  
  The returned variant has a floating reference that will need to be sunk
  by the caller code.
  Params:
    json =       A JSON data string
    length =       The length of json, or -1 if `NUL`-terminated
    signature =       A valid [glib.variant.VariantG] type string
  Returns:     A newly created [glib.variant.VariantG]D compliant
*/
glib.variant.VariantG gvariantDeserializeData(string json, ptrdiff_t length, string signature = null)
{
  VariantC* _cretval;
  const(char)* _json = json.toCString(No.alloc);
  const(char)* _signature = signature.toCString(No.alloc);
  GError *_err;
  _cretval = json_gvariant_deserialize_data(_json, length, _signature, &_err);
  if (_err)
    throw new ErrorG(_err);
  auto _retval = _cretval ? new glib.variant.VariantG(cast(VariantC*)_cretval, No.take) : null;
  return _retval;
}

/**
    Converts `variant` to a JSON tree.
  Params:
    variant =       A [glib.variant.VariantG] to convert
  Returns:     the root of the JSON data structure
      obtained from `variant`
*/
json.node.Node gvariantSerialize(glib.variant.VariantG variant)
{
  JsonNode* _cretval;
  _cretval = json_gvariant_serialize(variant ? cast(VariantC*)variant.cPtr(No.dup) : null);
  auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, Yes.take) : null;
  return _retval;
}

/**
    Converts variant to its JSON encoded string representation.
  
  This is a convenience function around `funcJson.gvariant_serialize`, to
  obtain the JSON tree, and then [json.generator.Generator] to stringify it.
  Params:
    variant =       A #GVariant to convert
    length =       the length of the returned string
  Returns:     The JSON encoded string corresponding to
      the given variant
*/
string gvariantSerializeData(glib.variant.VariantG variant, out size_t length)
{
  char* _cretval;
  _cretval = json_gvariant_serialize_data(variant ? cast(VariantC*)variant.cPtr(No.dup) : null, cast(size_t*)&length);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.free);
  return _retval;
}

/**
    Serializes a [gobject.object.ObjectG] instance into a JSON data stream.
  
  If the object implements the [json.serializable.Serializable] interface, it will be
  asked to serizalize all its properties; otherwise, the default
  implementation will be use to translate the compatible types into JSON
  native types.
  Params:
    gobject =       the object to serialize
    length =       return value for the length of the buffer
  Returns:     a JSON data stream representing the given object

  Deprecated:     Use `funcJson.gobject_to_data` instead
*/
string serializeGobject(gobject.object.ObjectG gobject, out size_t length)
{
  char* _cretval;
  _cretval = json_serialize_gobject(gobject ? cast(ObjectC*)gobject.cPtr(No.dup) : null, cast(size_t*)&length);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.free);
  return _retval;
}

/**
    Check whether a and b are equal UTF-8 JSON strings and return an ordering
  over them in `strcmp()` style.
  Params:
    a =       a JSON string
    b =       another JSON string
  Returns:     an integer less than zero if `a < b`, equal to zero if `a == b`, and
      greater than zero if `a > b`
*/
int stringCompare(string a, string b)
{
  int _retval;
  const(void)* _a = a.toCString(No.alloc);
  const(void)* _b = b.toCString(No.alloc);
  _retval = json_string_compare(_a, _b);
  return _retval;
}

/**
    Check whether a and b are equal UTF-8 JSON strings.
  Params:
    a =       a JSON string
    b =       another JSON string
  Returns:     `TRUE` if a and b are equal; `FALSE` otherwise
*/
bool stringEqual(string a, string b)
{
  bool _retval;
  const(void)* _a = a.toCString(No.alloc);
  const(void)* _b = b.toCString(No.alloc);
  _retval = json_string_equal(_a, _b);
  return _retval;
}

/**
    Calculate a hash value for the given key (a UTF-8 JSON string).
  
  Note: Member names are compared byte-wise, without applying any Unicode
  decomposition or normalisation. This is not explicitly mentioned in the JSON
  standard (ECMA-404), but is assumed.
  Params:
    key =       a JSON string to hash
  Returns:     hash value for key
*/
uint stringHash(string key)
{
  uint _retval;
  const(void)* _key = key.toCString(No.alloc);
  _retval = json_string_hash(_key);
  return _retval;
}

/**
    Generates a stringified JSON representation of the contents of
  the given `node`.
  Params:
    node =       a JSON tree
    pretty =       whether the output should be prettyfied for printing
  Returns:     the string representation of the node
*/
string toString_(json.node.Node node, bool pretty)
{
  char* _cretval;
  _cretval = json_to_string(node ? cast(JsonNode*)node.cPtr(No.dup) : null, pretty);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.free);
  return _retval;
}
