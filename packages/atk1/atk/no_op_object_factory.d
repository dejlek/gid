module atk.no_op_object_factory;

import atk.c.functions;
import atk.c.types;
import atk.object_factory;
import atk.types;
import gid.gid;

/**
    The AtkObjectFactory which creates an AtkNoOpObject.
  
  The AtkObjectFactory which creates an AtkNoOpObject. An instance of
  this is created by an AtkRegistry if no factory type has not been
  specified to create an accessible object of a particular type.
*/
class NoOpObjectFactory : atk.object_factory.ObjectFactory
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_no_op_object_factory_get_type != &gidSymbolNotFound ? atk_no_op_object_factory_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override NoOpObjectFactory self()
  {
    return this;
  }

  /**
      Creates an instance of an #AtkObjectFactory which generates primitive
    (non-functioning) #AtkObjects.
    Returns:     an instance of an #AtkObjectFactory
  */
  this()
  {
    AtkObjectFactory* _cretval;
    _cretval = atk_no_op_object_factory_new();
    this(_cretval, Yes.Take);
  }
}
