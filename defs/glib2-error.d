//!class ErrorG pre
//!kind ErrorG Wrap
//!inhibit init funcs

import glib.types;

class ErrorG : Exception
{
  private GError* errPtr;

  this(void* err, bool unused=false)
  {
    errPtr = cast(GError*)err;
    super(errPtr.message.fromCString(No.Free));
  }

  this(Quark domain, int code, string message)
  {
    this(g_error_new_literal(domain, code, message.toCString(No.Alloc)));
  }

  ~this()
  {
    g_error_free(errPtr);
  }

  void* cPtr()
  {
    return cast(void*)errPtr;
  }

  @property Quark domain()
  {
    return errPtr.domain;
  }

  @property void domain(Quark propval)
  {
    errPtr.domain = propval;
  }

  @property int code()
  {
    return errPtr.code;
  }

  @property void code(int propval)
  {
    errPtr.code = propval;
  }

  @property string message()
  {
    return errPtr.message.fromCString(No.Free);
  }

  @property void message(string propval)
  {
    g_free(cast(void*)errPtr.message);
    errPtr.message = propval.toCString(Yes.Alloc);
  }

  /**
   * a new #GError
   */
  static ErrorG newLiteral(Quark domain, int code, string message)
  {
    GError* _cretval;
    const(char)* _message = message.toCString(No.Alloc);
    _cretval = g_error_new_literal(domain, code, _message);
    ErrorG _retval = new ErrorG(cast(GError*)_cretval);
    return _retval;
  }

  /**
   * a new #GError
   */
  ErrorG copy()
  {
    GError* _cretval;
    _cretval = g_error_copy(errPtr);
    ErrorG _retval = new ErrorG(cast(GError*)_cretval);
    return _retval;
  }

  /**
   * whether @error has @domain and @code
   */
  bool matches(Quark domain, int code)
  {
    bool _retval;
    _retval = g_error_matches(errPtr, domain, code);
    return _retval;
  }
}
