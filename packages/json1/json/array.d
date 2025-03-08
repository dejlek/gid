module json.array;

import gid.gid;
import gobject.boxed;
import json.c.functions;
import json.c.types;
import json.node;
import json.object;
import json.types;

/**
    [json.array.Array] is the representation of the array type inside JSON.
  
  A [json.array.Array] contains [json.node.Node] elements, which may contain
  fundamental types, other arrays or objects.
  
  Since arrays can be arbitrarily big, copying them can be expensive; for
  this reason, they are reference counted. You can control the lifetime of
  a [json.array.Array] using [json.array.Array.ref_] and [json.array.Array.unref].
  
  To append an element, use [json.array.Array.addElement].
  
  To extract an element at a given index, use [json.array.Array.getElement].
  
  To retrieve the entire array in list form, use [json.array.Array.getElements].
  
  To retrieve the length of the array, use [json.array.Array.getLength].
*/
class Array : gobject.boxed.Boxed
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"dup" dup = No.dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())json_array_get_type != &gidSymbolNotFound ? json_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new array.
    Returns:     the newly created array
  */
  this()
  {
    JsonArray* _cretval;
    _cretval = json_array_new();
    this(_cretval, Yes.take);
  }

  /**
      Creates a new array with `n_elements` slots already allocated.
    Params:
      nElements =       number of slots to pre-allocate
    Returns:     the newly created array
  */
  static json.array.Array sizedNew(uint nElements)
  {
    JsonArray* _cretval;
    _cretval = json_array_sized_new(nElements);
    auto _retval = _cretval ? new json.array.Array(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Conveniently adds an array element into an array.
    
    If `value` is `NULL`, a `null` element will be added instead.
    
    See also: [json.array.Array.addElement], [json.node.Node.takeArray]
    Params:
      value =       the array to add
  */
  void addArrayElement(json.array.Array value = null)
  {
    json_array_add_array_element(cast(JsonArray*)cPtr, value ? cast(JsonArray*)value.cPtr(Yes.dup) : null);
  }

  /**
      Conveniently adds the given boolean value into an array.
    
    See also: [json.array.Array.addElement], [json.node.Node.setBoolean]
    Params:
      value =       the boolean value to add
  */
  void addBooleanElement(bool value)
  {
    json_array_add_boolean_element(cast(JsonArray*)cPtr, value);
  }

  /**
      Conveniently adds the given floating point value into an array.
    
    See also: [json.array.Array.addElement], [json.node.Node.setDouble]
    Params:
      value =       the floating point value to add
  */
  void addDoubleElement(double value)
  {
    json_array_add_double_element(cast(JsonArray*)cPtr, value);
  }

  /**
      Appends the given `node` inside an array.
    Params:
      node =       the element to add
  */
  void addElement(json.node.Node node)
  {
    json_array_add_element(cast(JsonArray*)cPtr, node ? cast(JsonNode*)node.cPtr(Yes.dup) : null);
  }

  /**
      Conveniently adds the given integer value into an array.
    
    See also: [json.array.Array.addElement], [json.node.Node.setInt]
    Params:
      value =       the integer value to add
  */
  void addIntElement(long value)
  {
    json_array_add_int_element(cast(JsonArray*)cPtr, value);
  }

  /**
      Conveniently adds a `null` element into an array
    
    See also: [json.array.Array.addElement], [json.types.NodeType.null_]
  */
  void addNullElement()
  {
    json_array_add_null_element(cast(JsonArray*)cPtr);
  }

  /**
      Conveniently adds an object into an array.
    
    If `value` is `NULL`, a `null` element will be added instead.
    
    See also: [json.array.Array.addElement], [json.node.Node.takeObject]
    Params:
      value =       the object to add
  */
  void addObjectElement(json.object.ObjectJson value = null)
  {
    json_array_add_object_element(cast(JsonArray*)cPtr, value ? cast(JsonObject*)value.cPtr(Yes.dup) : null);
  }

  /**
      Conveniently adds the given string value into an array.
    
    See also: [json.array.Array.addElement], [json.node.Node.setString]
    Params:
      value =       the string value to add
  */
  void addStringElement(string value)
  {
    const(char)* _value = value.toCString(No.alloc);
    json_array_add_string_element(cast(JsonArray*)cPtr, _value);
  }

  /**
      Retrieves a copy of the element at the given position in the array.
    Params:
      index =       the index of the element to retrieve
    Returns:     a copy of the element at the given position
  */
  json.node.Node dupElement(uint index)
  {
    JsonNode* _cretval;
    _cretval = json_array_dup_element(cast(JsonArray*)cPtr, index);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Check whether two arrays are equal.
    
    Equality is defined as:
    
     $(LIST
        * the array have the same number of elements
        * the values of elements in corresponding positions are equal
     )
    Params:
      b =       another JSON array
    Returns:     `TRUE` if the arrays are equal, and `FALSE` otherwise
  */
  bool equal(json.array.Array b)
  {
    bool _retval;
    _retval = json_array_equal(cast(JsonArray*)cPtr, b ? cast(JsonArray*)b.cPtr(No.dup) : null);
    return _retval;
  }

  /**
      Iterates over all elements of an array, and calls a function on
    each one of them.
    
    It is safe to change the value of an element of the array while
    iterating over it, but it is not safe to add or remove elements
    from the array.
    Params:
      func =       the function to be called on each element
  */
  void foreachElement(json.types.ArrayForeach func)
  {
    extern(C) void _funcCallback(JsonArray* array, uint index, JsonNode* elementNode, void* userData)
    {
      auto _dlg = cast(json.types.ArrayForeach*)userData;

      (*_dlg)(array ? new json.array.Array(cast(void*)array, No.take) : null, index, elementNode ? new json.node.Node(cast(void*)elementNode, No.take) : null);
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? cast(void*)&(func) : null;
    json_array_foreach_element(cast(JsonArray*)cPtr, _funcCB, _func);
  }

  /**
      Conveniently retrieves the array at the given position inside an array.
    
    See also: [json.array.Array.getElement], [json.node.Node.getArray]
    Params:
      index =       the index of the element to retrieve
    Returns:     the array
  */
  json.array.Array getArrayElement(uint index)
  {
    JsonArray* _cretval;
    _cretval = json_array_get_array_element(cast(JsonArray*)cPtr, index);
    auto _retval = _cretval ? new json.array.Array(cast(void*)_cretval, No.take) : null;
    return _retval;
  }

  /**
      Conveniently retrieves the boolean value of the element at the given
    position inside an array.
    
    See also: [json.array.Array.getElement], [json.node.Node.getBoolean]
    Params:
      index =       the index of the element to retrieve
    Returns:     the boolean value
  */
  bool getBooleanElement(uint index)
  {
    bool _retval;
    _retval = json_array_get_boolean_element(cast(JsonArray*)cPtr, index);
    return _retval;
  }

  /**
      Conveniently retrieves the floating point value of the element at
    the given position inside an array.
    
    See also: [json.array.Array.getElement], [json.node.Node.getDouble]
    Params:
      index =       the index of the element to retrieve
    Returns:     the floating point value
  */
  double getDoubleElement(uint index)
  {
    double _retval;
    _retval = json_array_get_double_element(cast(JsonArray*)cPtr, index);
    return _retval;
  }

  /**
      Retrieves the element at the given position in the array.
    Params:
      index =       the index of the element to retrieve
    Returns:     the element at the given position
  */
  json.node.Node getElement(uint index)
  {
    JsonNode* _cretval;
    _cretval = json_array_get_element(cast(JsonArray*)cPtr, index);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, No.take) : null;
    return _retval;
  }

  /**
      Retrieves all the elements of an array as a list of nodes.
    Returns:     the elements
        of the array
  */
  json.node.Node[] getElements()
  {
    GList* _cretval;
    _cretval = json_array_get_elements(cast(JsonArray*)cPtr);
    auto _retval = gListToD!(json.node.Node, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Conveniently retrieves the integer value of the element at the given
    position inside an array.
    
    See also: [json.array.Array.getElement], [json.node.Node.getInt]
    Params:
      index =       the index of the element to retrieve
    Returns:     the integer value
  */
  long getIntElement(uint index)
  {
    long _retval;
    _retval = json_array_get_int_element(cast(JsonArray*)cPtr, index);
    return _retval;
  }

  /**
      Retrieves the length of the given array
    Returns:     the length of the array
  */
  uint getLength()
  {
    uint _retval;
    _retval = json_array_get_length(cast(JsonArray*)cPtr);
    return _retval;
  }

  /**
      Conveniently checks whether the element at the given position inside the
    array contains a `null` value.
    
    See also: [json.array.Array.getElement], [json.node.Node.isNull]
    Params:
      index =       the index of the element to retrieve
    Returns:     `TRUE` if the element is `null`
  */
  bool getNullElement(uint index)
  {
    bool _retval;
    _retval = json_array_get_null_element(cast(JsonArray*)cPtr, index);
    return _retval;
  }

  /**
      Conveniently retrieves the object at the given position inside an array.
    
    See also: [json.array.Array.getElement], [json.node.Node.getObject]
    Params:
      index =       the index of the element to retrieve
    Returns:     the object
  */
  json.object.ObjectJson getObjectElement(uint index)
  {
    JsonObject* _cretval;
    _cretval = json_array_get_object_element(cast(JsonArray*)cPtr, index);
    auto _retval = _cretval ? new json.object.ObjectJson(cast(void*)_cretval, No.take) : null;
    return _retval;
  }

  /**
      Conveniently retrieves the string value of the element at the given
    position inside an array.
    
    See also: [json.array.Array.getElement], [json.node.Node.getString]
    Params:
      index =       the index of the element to retrieve
    Returns:     the string value
  */
  string getStringElement(uint index)
  {
    const(char)* _cretval;
    _cretval = json_array_get_string_element(cast(JsonArray*)cPtr, index);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Calculates a hash value for the given `key`.
    
    The hash is calculated over the array and all its elements, recursively.
    
    If the array is immutable, this is a fast operation; otherwise, it scales
    proportionally with the length of the array.
    Returns:     hash value for the key
  */
  uint hash()
  {
    uint _retval;
    _retval = json_array_hash(cast(JsonArray*)cPtr);
    return _retval;
  }

  /**
      Check whether the given `array` has been marked as immutable by calling
    [json.array.Array.seal] on it.
    Returns:     true if the array is immutable
  */
  bool isImmutable()
  {
    bool _retval;
    _retval = json_array_is_immutable(cast(JsonArray*)cPtr);
    return _retval;
  }

  /**
      Removes the element at the given position inside an array.
    
    This function will release the reference held on the element.
    Params:
      index =       the position of the element to be removed
  */
  void removeElement(uint index)
  {
    json_array_remove_element(cast(JsonArray*)cPtr, index);
  }

  /**
      Seals the given array, making it immutable to further changes.
    
    This function will recursively seal all elements in the array too.
    
    If the `array` is already immutable, this is a no-op.
  */
  void seal()
  {
    json_array_seal(cast(JsonArray*)cPtr);
  }
}
