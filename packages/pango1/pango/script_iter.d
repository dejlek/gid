module pango.script_iter;

import gid.gid;
import gobject.boxed;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    A [pango.script_iter.ScriptIter] is used to iterate through a string
  and identify ranges in different scripts.
*/
class ScriptIter : gobject.boxed.Boxed
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"dup" dup = No.dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())pango_script_iter_get_type != &gidSymbolNotFound ? pango_script_iter_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Create a new [pango.script_iter.ScriptIter], used to break a string of
    Unicode text into runs by Unicode script.
    
    No copy is made of text, so the caller needs to make
    sure it remains valid until the iterator is freed with
    [pango.script_iter.ScriptIter.free].
    Params:
      text =       a UTF-8 string
    Returns:     the new script iterator, initialized
       to point at the first range in the text, which should be
       freed with [pango.script_iter.ScriptIter.free]. If the string is
       empty, it will point at an empty range.
  */
  this(string text)
  {
    PangoScriptIter* _cretval;
    int _length;
    if (text)
      _length = cast(int)text.length;

    auto _text = cast(const(char)*)text.ptr;
    _cretval = pango_script_iter_new(_text, _length);
    this(_cretval, Yes.take);
  }

  /**
      Gets information about the range to which iter currently points.
    
    The range is the set of locations p where *start <= p < *end.
    (That is, it doesn't include the character stored at *end)
    
    Note that while the type of the script argument is declared
    as [pango.types.Script], as of Pango 1.18, this function simply returns
    [glib.types.UnicodeScript] values. Callers must be prepared to handle unknown
    values.
    Params:
      start =       location to store start position of the range
      end =       location to store end position of the range
      script =       location to store script for range
  */
  void getRange(out string start, out string end, out pango.types.Script script)
  {
    char* _start;
    char* _end;
    pango_script_iter_get_range(cast(PangoScriptIter*)cPtr, &_start, &_end, &script);
    start = _start.fromCString(Yes.free);
    end = _end.fromCString(Yes.free);
  }

  /**
      Advances a [pango.script_iter.ScriptIter] to the next range.
    
    If iter is already at the end, it is left unchanged
    and false is returned.
    Returns:     true if iter was successfully advanced
  */
  bool next()
  {
    bool _retval;
    _retval = pango_script_iter_next(cast(PangoScriptIter*)cPtr);
    return _retval;
  }
}
