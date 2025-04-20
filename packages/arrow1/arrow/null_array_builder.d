/// Module for [NullArrayBuilder] class
module arrow.null_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;

/** */
class NullArrayBuilder : arrow.array_builder.ArrayBuilder
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_null_array_builder_get_type != &gidSymbolNotFound ? garrow_null_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NullArrayBuilder self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowNullArrayBuilder* _cretval;
    _cretval = garrow_null_array_builder_new();
    this(_cretval, Yes.Take);
  }
}
