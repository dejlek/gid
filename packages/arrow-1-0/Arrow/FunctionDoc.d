module Arrow.FunctionDoc;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class FunctionDoc : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_function_doc_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

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

  string getDescription()
  {
    char* _cretval;
    _cretval = garrow_function_doc_get_description(cast(GArrowFunctionDoc*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  string getOptionsClassName()
  {
    char* _cretval;
    _cretval = garrow_function_doc_get_options_class_name(cast(GArrowFunctionDoc*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  string getSummary()
  {
    char* _cretval;
    _cretval = garrow_function_doc_get_summary(cast(GArrowFunctionDoc*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }
}
