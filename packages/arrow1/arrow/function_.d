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

/** */
class Function : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_function_get_type != &gidSymbolNotFound ? garrow_function_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  static arrow.function_.Function[] all()
  {
    GList* _cretval;
    _cretval = garrow_function_all();
    auto _retval = gListToD!(arrow.function_.Function, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  static arrow.function_.Function find(string name)
  {
    GArrowFunction* _cretval;
    const(char)* _name = name.toCString(No.alloc);
    _cretval = garrow_function_find(_name);
    auto _retval = ObjectG.getDObject!(arrow.function_.Function)(cast(GArrowFunction*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  bool equal(arrow.function_.Function otherFunction)
  {
    bool _retval;
    _retval = garrow_function_equal(cast(GArrowFunction*)cPtr, otherFunction ? cast(GArrowFunction*)otherFunction.cPtr(No.dup) : null);
    return _retval;
  }

  /** */
  arrow.datum.Datum execute(arrow.datum.Datum[] args, arrow.function_options.FunctionOptions options = null, arrow.execute_context.ExecuteContext context = null)
  {
    GArrowDatum* _cretval;
    auto _args = gListFromD!(arrow.datum.Datum)(args);
    scope(exit) containerFree!(GList*, arrow.datum.Datum, GidOwnership.None)(_args);
    GError *_err;
    _cretval = garrow_function_execute(cast(GArrowFunction*)cPtr, _args, options ? cast(GArrowFunctionOptions*)options.cPtr(No.dup) : null, context ? cast(GArrowExecuteContext*)context.cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.datum.Datum)(cast(GArrowDatum*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  arrow.function_options.FunctionOptions getDefaultOptions()
  {
    GArrowFunctionOptions* _cretval;
    _cretval = garrow_function_get_default_options(cast(GArrowFunction*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.function_options.FunctionOptions)(cast(GArrowFunctionOptions*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  arrow.function_doc.FunctionDoc getDoc()
  {
    GArrowFunctionDoc* _cretval;
    _cretval = garrow_function_get_doc(cast(GArrowFunction*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.function_doc.FunctionDoc)(cast(GArrowFunctionDoc*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  string getName()
  {
    const(char)* _cretval;
    _cretval = garrow_function_get_name(cast(GArrowFunction*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /** */
  gobject.types.GType getOptionsType()
  {
    gobject.types.GType _retval;
    _retval = garrow_function_get_options_type(cast(GArrowFunction*)cPtr);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    _cretval = garrow_function_to_string(cast(GArrowFunction*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.free);
    return _retval;
  }
}
