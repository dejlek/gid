module arrow.function_doc;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class FunctionDoc : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_function_doc_get_type != &gidSymbolNotFound ? garrow_function_doc_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  string[] getArgNames()
  {
    char** _cretval;
    _cretval = garrow_function_doc_get_arg_names(cast(GArrowFunctionDoc*)cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
    }
    return _retval;
  }

  /** */
  string getDescription()
  {
    char* _cretval;
    _cretval = garrow_function_doc_get_description(cast(GArrowFunctionDoc*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  string getOptionsClassName()
  {
    char* _cretval;
    _cretval = garrow_function_doc_get_options_class_name(cast(GArrowFunctionDoc*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  string getSummary()
  {
    char* _cretval;
    _cretval = garrow_function_doc_get_summary(cast(GArrowFunctionDoc*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
