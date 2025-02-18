module Atk.NoOpObjectFactory;

import Atk.ObjectFactory;
import Atk.Types;
import Atk.c.functions;
import Atk.c.types;
import Gid.gid;

/**
 * The AtkObjectFactory which creates an AtkNoOpObject.
 * The AtkObjectFactory which creates an AtkNoOpObject. An instance of
 * this is created by an AtkRegistry if no factory type has not been
 * specified to create an accessible object of a particular type.
 */
class NoOpObjectFactory : ObjectFactory
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())atk_no_op_object_factory_get_type != &gidSymbolNotFound ? atk_no_op_object_factory_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates an instance of an #AtkObjectFactory which generates primitive
   * $(LPAREN)non-functioning$(RPAREN) #AtkObjects.
   * Returns: an instance of an #AtkObjectFactory
   */
  this()
  {
    AtkObjectFactory* _cretval;
    _cretval = atk_no_op_object_factory_new();
    this(_cretval, Yes.Take);
  }
}
