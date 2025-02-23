module arrow.function_;

import arrow.c.functions;
import arrow.c.types;
import arrow.datum;
import arrow.execute_context;
import arrow.function_doc;
import arrow.function_options;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;
import gobject.types;

class Function : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_function_get_type != &gidSymbolNotFound ? garrow_function_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  static Function[] all()
  {
    GList* _cretval;
    _cretval = garrow_function_all();
    auto _retval = gListToD!(Function, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  static Function find(string name)
  {
    GArrowFunction* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = garrow_function_find(_name);
    auto _retval = ObjectG.getDObject!Function(cast(GArrowFunction*)_cretval, Yes.Take);
    return _retval;
  }

  bool equal(Function otherFunction)
  {
    bool _retval;
    _retval = garrow_function_equal(cast(GArrowFunction*)cPtr, otherFunction ? cast(GArrowFunction*)otherFunction.cPtr(No.Dup) : null);
    return _retval;
  }

  Datum execute(Datum[] args, FunctionOptions options, ExecuteContext context)
  {
    GArrowDatum* _cretval;
    auto _args = gListFromD!(Datum)(args);
    scope(exit) containerFree!(GList*, Datum, GidOwnership.None)(_args);
    GError *_err;
    _cretval = garrow_function_execute(cast(GArrowFunction*)cPtr, _args, options ? cast(GArrowFunctionOptions*)options.cPtr(No.Dup) : null, context ? cast(GArrowExecuteContext*)context.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Datum(cast(GArrowDatum*)_cretval, Yes.Take);
    return _retval;
  }

  FunctionOptions getDefaultOptions()
  {
    GArrowFunctionOptions* _cretval;
    _cretval = garrow_function_get_default_options(cast(GArrowFunction*)cPtr);
    auto _retval = ObjectG.getDObject!FunctionOptions(cast(GArrowFunctionOptions*)_cretval, Yes.Take);
    return _retval;
  }

  FunctionDoc getDoc()
  {
    GArrowFunctionDoc* _cretval;
    _cretval = garrow_function_get_doc(cast(GArrowFunction*)cPtr);
    auto _retval = ObjectG.getDObject!FunctionDoc(cast(GArrowFunctionDoc*)_cretval, Yes.Take);
    return _retval;
  }

  string getName()
  {
    const(char)* _cretval;
    _cretval = garrow_function_get_name(cast(GArrowFunction*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  GType getOptionsType()
  {
    GType _retval;
    _retval = garrow_function_get_options_type(cast(GArrowFunction*)cPtr);
    return _retval;
  }

  string toString_()
  {
    char* _cretval;
    _cretval = garrow_function_to_string(cast(GArrowFunction*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }
}
