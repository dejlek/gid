module arrow.time32_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.time_data_type;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class Time32DataType : arrow.time_data_type.TimeDataType
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_time32_data_type_get_type != &gidSymbolNotFound ? garrow_time32_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.types.TimeUnit unit)
  {
    GArrowTime32DataType* _cretval;
    GError *_err;
    _cretval = garrow_time32_data_type_new(unit, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.take);
  }
}
