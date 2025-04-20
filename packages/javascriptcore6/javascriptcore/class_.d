/// Module for [Class] class
module javascriptcore.class_;

import gid.gid;
import gobject.object;
import javascriptcore.c.functions;
import javascriptcore.c.types;
import javascriptcore.types;

/**
    A JSSClass represents a custom JavaScript class registered by the user in a #JSCContext.
    It allows to create new JavaScripts objects whose instances are created by the user using
    this API.
    It's possible to add constructors, properties and methods for a JSSClass by providing
    #GCallback<!-- -->s to implement them.
*/
class Class : gobject.object.ObjectWrap
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
    return cast(void function())jsc_class_get_type != &gidSymbolNotFound ? jsc_class_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Class self()
  {
    return this;
  }

  /**
      Get the class name of jsc_class
      Returns: the name of jsc_class
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = jsc_class_get_name(cast(JSCClass*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the parent class of jsc_class
      Returns: the parent class of jsc_class
  */
  javascriptcore.class_.Class getParent()
  {
    JSCClass* _cretval;
    _cretval = jsc_class_get_parent(cast(JSCClass*)cPtr);
    auto _retval = gobject.object.ObjectWrap.getDObject!(javascriptcore.class_.Class)(cast(JSCClass*)_cretval, No.Take);
    return _retval;
  }
}
