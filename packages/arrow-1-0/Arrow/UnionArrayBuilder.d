module Arrow.UnionArrayBuilder;

import Arrow.ArrayBuilder;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class UnionArrayBuilder : ArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_union_array_builder_get_type != &gidSymbolNotFound ? garrow_union_array_builder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  byte appendChild(ArrayBuilder child, string fieldName)
  {
    byte _retval;
    const(char)* _fieldName = fieldName.toCString(No.Alloc);
    _retval = garrow_union_array_builder_append_child(cast(GArrowUnionArrayBuilder*)cPtr, child ? cast(GArrowArrayBuilder*)child.cPtr(No.Dup) : null, _fieldName);
    return _retval;
  }

  /**
   * Append an element to the union array.
   * If builder is #GArrowDenseUnionArrayBuilder, this must be followed by an
   * append to the appropriate child builder.
   * If builder is #GArrowSparseUnionArrayBuilder, this must be
   * followed by appends to all child builders. The corresponding child
   * builder must be appended to independently after this method is
   * called, and all other child builders must have null or empty value
   * appended.
   * Params:
   *   value = A type ID value.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool appendValue(byte value)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_union_array_builder_append_value(cast(GArrowUnionArrayBuilder*)cPtr, value, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
