/// Module for [VirtualMachine] class
module javascriptcore.virtual_machine;

import gid.gid;
import gobject.object;
import javascriptcore.c.functions;
import javascriptcore.c.types;
import javascriptcore.types;

/**
    JSCVirtualMachine represents a group of JSCContext<!-- -->s. It allows
    concurrent JavaScript execution by creating a different instance of
    JSCVirtualMachine in each thread.
    
    To create a group of JSCContext<!-- -->s pass the same JSCVirtualMachine
    instance to every JSCContext constructor.
*/
class VirtualMachine : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())jsc_virtual_machine_get_type != &gidSymbolNotFound ? jsc_virtual_machine_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VirtualMachine self()
  {
    return this;
  }

  /**
      Create a new #JSCVirtualMachine.
      Returns: the newly created #JSCVirtualMachine.
  */
  this()
  {
    JSCVirtualMachine* _cretval;
    _cretval = jsc_virtual_machine_new();
    this(_cretval, Yes.Take);
  }
}
