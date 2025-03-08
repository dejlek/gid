module json.parser;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.input_stream;
import gio.types;
import glib.error;
import gobject.dclosure;
import gobject.object;
import json.array;
import json.c.functions;
import json.c.types;
import json.node;
import json.object;
import json.types;

/**
    [json.parser.Parser] provides an object for parsing a JSON data stream, either
  inside a file or inside a static buffer.
  
  ## Using [json.parser.Parser]
  
  The [json.parser.Parser] API is fairly simple:
  
  ```c
  gboolean
  parse_json (const char *filename)
  {
    g_autoptr(JsonParser) parser = json_parser_new ();
    g_autoptr(GError) error = NULL
  
    json_parser_load_from_file (parser, filename, &error);
    if (error != NULL)
      {
        g_critical ("Unable to parse '%s': %s", filename, error->message);
        return FALSE;
      }
  
    g_autoptr(JsonNode) root = json_parser_get_root (parser);
  
    // manipulate the object tree from the root node
  
    return TRUE
  }
  ```
  
  By default, the entire process of loading the data and parsing it is
  synchronous; the [json.parser.Parser.loadFromStreamAsync] API will
  load the data asynchronously, but parse it in the main context as the
  signals of the parser must be emitted in the same thread. If you do
  not use signals, and you wish to also parse the JSON data without blocking,
  you should use a [gio.task.Task] and the synchronous [json.parser.Parser] API inside the
  task itself.
*/
class Parser : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())json_parser_get_type != &gidSymbolNotFound ? json_parser_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new JSON parser.
    
    You can use the [json.parser.Parser] to load a JSON stream from either a file or a
    buffer and then walk the hierarchy using the data types API.
    Returns:     the newly created parser
  */
  this()
  {
    JsonParser* _cretval;
    _cretval = json_parser_new();
    this(_cretval, Yes.take);
  }

  /**
      Creates a new parser instance with its [json.parser.Parser.gboolean]
    property set to `TRUE` to create immutable output trees.
    Returns:     the newly created parser
  */
  static json.parser.Parser newImmutable()
  {
    JsonParser* _cretval;
    _cretval = json_parser_new_immutable();
    auto _retval = ObjectG.getDObject!(json.parser.Parser)(cast(JsonParser*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Retrieves the line currently parsed, starting from 1.
    
    This function has defined behaviour only while parsing; calling this
    function from outside the signal handlers emitted by the parser will
    yield 0.
    Returns:     the currently parsed line, or 0.
  */
  uint getCurrentLine()
  {
    uint _retval;
    _retval = json_parser_get_current_line(cast(JsonParser*)cPtr);
    return _retval;
  }

  /**
      Retrieves the current position inside the current line, starting
    from 0.
    
    This function has defined behaviour only while parsing; calling this
    function from outside the signal handlers emitted by the parser will
    yield 0.
    Returns:     the position in the current line, or 0.
  */
  uint getCurrentPos()
  {
    uint _retval;
    _retval = json_parser_get_current_pos(cast(JsonParser*)cPtr);
    return _retval;
  }

  /**
      Retrieves the top level node from the parsed JSON stream.
    
    If the parser input was an empty string, or if parsing failed, the root
    will be `NULL`. It will also be `NULL` if it has been stolen using
    [json.parser.Parser.stealRoot].
    Returns:     the root node.
  */
  json.node.Node getRoot()
  {
    JsonNode* _cretval;
    _cretval = json_parser_get_root(cast(JsonParser*)cPtr);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, No.take) : null;
    return _retval;
  }

  /**
      A JSON data stream might sometimes contain an assignment, like:
    
    ```
    var _json_data = { "member_name" : [ ...
    ```
    
    even though it would technically constitute a violation of the RFC.
    
    [json.parser.Parser] will ignore the left hand identifier and parse the right
    hand value of the assignment. [json.parser.Parser] will record, though, the
    existence of the assignment in the data stream and the variable name
    used.
    Params:
      variableName =       the variable name
    Returns:     `TRUE` if there was an assignment, and `FALSE` otherwise
  */
  bool hasAssignment(out string variableName)
  {
    bool _retval;
    char* _variableName;
    _retval = json_parser_has_assignment(cast(JsonParser*)cPtr, &_variableName);
    variableName = _variableName.fromCString(No.free);
    return _retval;
  }

  /**
      Loads a JSON stream from a buffer and parses it.
    
    You can call this function multiple times with the same parser, but the
    contents of the parser will be destroyed each time.
    Params:
      data =       the buffer to parse
      length =       the length of the buffer, or -1 if it is `NUL` terminated
    Returns:     `TRUE` if the buffer was succesfully parsed
  */
  bool loadFromData(string data, ptrdiff_t length)
  {
    bool _retval;
    const(char)* _data = data.toCString(No.alloc);
    GError *_err;
    _retval = json_parser_load_from_data(cast(JsonParser*)cPtr, _data, length, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Loads a JSON stream from the content of `filename` and parses it.
    
    If the file is large or shared between processes,
    [json.parser.Parser.loadFromMappedFile] may be a more efficient
    way to load it.
    
    See also: [json.parser.Parser.loadFromData]
    Params:
      filename =       the path for the file to parse
    Returns:     `TRUE` if the file was successfully loaded and parsed.
  */
  bool loadFromFile(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString(No.alloc);
    GError *_err;
    _retval = json_parser_load_from_file(cast(JsonParser*)cPtr, _filename, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Loads a JSON stream from the content of `filename` and parses it.
    
    Unlike [json.parser.Parser.loadFromFile], `filename` will be memory
    mapped as read-only and parsed. `filename` will be unmapped before this
    function returns.
    
    If mapping or reading the file fails, a `G_FILE_ERROR` will be returned.
    Params:
      filename =       the path for the file to parse
    Returns:     `TRUE` if the file was successfully loaded and parsed.
  */
  bool loadFromMappedFile(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString(No.alloc);
    GError *_err;
    _retval = json_parser_load_from_mapped_file(cast(JsonParser*)cPtr, _filename, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Loads the contents of an input stream and parses them.
    
    If `cancellable` is not `NULL`, then the operation can be cancelled by
    triggering the cancellable object from another thread. If the
    operation was cancelled, [gio.types.IOErrorEnum.cancelled] will be set
    on the given `error`.
    Params:
      stream =       the input stream with the JSON data
      cancellable =       a #GCancellable
    Returns:     `TRUE` if the data stream was successfully read and
        parsed, and `FALSE` otherwise
  */
  bool loadFromStream(gio.input_stream.InputStream stream, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = json_parser_load_from_stream(cast(JsonParser*)cPtr, stream ? cast(GInputStream*)stream.cPtr(No.dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Asynchronously reads the contents of a stream.
    
    For more details, see [json.parser.Parser.loadFromStream], which is the
    synchronous version of this call.
    
    When the operation is finished, callback will be called. You should
    then call [json.parser.Parser.loadFromStreamFinish] to get the result
    of the operation.
    Params:
      stream =       the input stream with the JSON data
      cancellable =       a #GCancellable
      callback =       the function to call when the request is satisfied
  */
  void loadFromStreamAsync(gio.input_stream.InputStream stream, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    json_parser_load_from_stream_async(cast(JsonParser*)cPtr, stream ? cast(GInputStream*)stream.cPtr(No.dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous stream loading started with
    [json.parser.Parser.loadFromStreamAsync].
    Params:
      result =       the result of the asynchronous operation
    Returns:     `TRUE` if the content of the stream was successfully retrieved
        and parsed, and `FALSE` otherwise
  */
  bool loadFromStreamFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = json_parser_load_from_stream_finish(cast(JsonParser*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Steals the top level node from the parsed JSON stream.
    
    This will be `NULL` in the same situations as [json.parser.Parser.getRoot]
    return `NULL`.
    Returns:     the root node
  */
  json.node.Node stealRoot()
  {
    JsonNode* _cretval;
    _cretval = json_parser_steal_root(cast(JsonParser*)cPtr);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      The `::array-element` signal is emitted each time a parser
    has successfully parsed a single element of a JSON array.
  
    ## Parameters
    $(LIST
      * $(B array)       a JSON array
      * $(B index)       the index of the newly parsed array element
      * $(B parser) the instance the signal is connected to
    )
  */
  alias ArrayElementCallbackDlg = void delegate(json.array.Array array, int index, json.parser.Parser parser);

  /** ditto */
  alias ArrayElementCallbackFunc = void function(json.array.Array array, int index, json.parser.Parser parser);

  /**
    Connect to ArrayElement signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectArrayElement(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ArrayElementCallbackDlg) || is(T : ArrayElementCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto parser = getVal!(json.parser.Parser)(_paramVals);
      auto array = getVal!(json.array.Array)(&_paramVals[1]);
      auto index = getVal!(int)(&_paramVals[2]);
      _dClosure.dlg(array, index, parser);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("array-element", closure, after);
  }

  /**
      The `::array-end` signal is emitted each time a parser
    has successfully parsed an entire JSON array.
  
    ## Parameters
    $(LIST
      * $(B array)       the parsed JSON array
      * $(B parser) the instance the signal is connected to
    )
  */
  alias ArrayEndCallbackDlg = void delegate(json.array.Array array, json.parser.Parser parser);

  /** ditto */
  alias ArrayEndCallbackFunc = void function(json.array.Array array, json.parser.Parser parser);

  /**
    Connect to ArrayEnd signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectArrayEnd(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ArrayEndCallbackDlg) || is(T : ArrayEndCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto parser = getVal!(json.parser.Parser)(_paramVals);
      auto array = getVal!(json.array.Array)(&_paramVals[1]);
      _dClosure.dlg(array, parser);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("array-end", closure, after);
  }

  /**
      The `::array-start` signal is emitted each time a parser
    starts parsing a JSON array.
  
    ## Parameters
    $(LIST
      * $(B parser) the instance the signal is connected to
    )
  */
  alias ArrayStartCallbackDlg = void delegate(json.parser.Parser parser);

  /** ditto */
  alias ArrayStartCallbackFunc = void function(json.parser.Parser parser);

  /**
    Connect to ArrayStart signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectArrayStart(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ArrayStartCallbackDlg) || is(T : ArrayStartCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto parser = getVal!(json.parser.Parser)(_paramVals);
      _dClosure.dlg(parser);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("array-start", closure, after);
  }

  /**
      The `::error` signal is emitted each time a parser encounters
    an error in a JSON stream.
  
    ## Parameters
    $(LIST
      * $(B error)       the error
      * $(B parser) the instance the signal is connected to
    )
  */
  alias ErrorCallbackDlg = void delegate(void* error, json.parser.Parser parser);

  /** ditto */
  alias ErrorCallbackFunc = void function(void* error, json.parser.Parser parser);

  /**
    Connect to Error signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectError(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ErrorCallbackDlg) || is(T : ErrorCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto parser = getVal!(json.parser.Parser)(_paramVals);
      auto error = getVal!(void*)(&_paramVals[1]);
      _dClosure.dlg(error, parser);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("error", closure, after);
  }

  /**
      The `::object-end` signal is emitted each time a parser
    has successfully parsed an entire JSON object.
  
    ## Parameters
    $(LIST
      * $(B object)       the parsed JSON object
      * $(B parser) the instance the signal is connected to
    )
  */
  alias ObjectEndCallbackDlg = void delegate(json.object.ObjectJson object, json.parser.Parser parser);

  /** ditto */
  alias ObjectEndCallbackFunc = void function(json.object.ObjectJson object, json.parser.Parser parser);

  /**
    Connect to ObjectEnd signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectObjectEnd(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ObjectEndCallbackDlg) || is(T : ObjectEndCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto parser = getVal!(json.parser.Parser)(_paramVals);
      auto object = getVal!(json.object.ObjectJson)(&_paramVals[1]);
      _dClosure.dlg(object, parser);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("object-end", closure, after);
  }

  /**
      The `::object-member` signal is emitted each time a parser
    has successfully parsed a single member of a JSON object
  
    ## Parameters
    $(LIST
      * $(B object)       the JSON object being parsed
      * $(B memberName)       the name of the newly parsed member
      * $(B parser) the instance the signal is connected to
    )
  */
  alias ObjectMemberCallbackDlg = void delegate(json.object.ObjectJson object, string memberName, json.parser.Parser parser);

  /** ditto */
  alias ObjectMemberCallbackFunc = void function(json.object.ObjectJson object, string memberName, json.parser.Parser parser);

  /**
    Connect to ObjectMember signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectObjectMember(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ObjectMemberCallbackDlg) || is(T : ObjectMemberCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto parser = getVal!(json.parser.Parser)(_paramVals);
      auto object = getVal!(json.object.ObjectJson)(&_paramVals[1]);
      auto memberName = getVal!(string)(&_paramVals[2]);
      _dClosure.dlg(object, memberName, parser);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("object-member", closure, after);
  }

  /**
      This signal is emitted each time a parser starts parsing a JSON object.
  
    ## Parameters
    $(LIST
      * $(B parser) the instance the signal is connected to
    )
  */
  alias ObjectStartCallbackDlg = void delegate(json.parser.Parser parser);

  /** ditto */
  alias ObjectStartCallbackFunc = void function(json.parser.Parser parser);

  /**
    Connect to ObjectStart signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectObjectStart(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ObjectStartCallbackDlg) || is(T : ObjectStartCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto parser = getVal!(json.parser.Parser)(_paramVals);
      _dClosure.dlg(parser);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("object-start", closure, after);
  }

  /**
      This signal is emitted when a parser successfully finished parsing a
    JSON data stream
  
    ## Parameters
    $(LIST
      * $(B parser) the instance the signal is connected to
    )
  */
  alias ParseEndCallbackDlg = void delegate(json.parser.Parser parser);

  /** ditto */
  alias ParseEndCallbackFunc = void function(json.parser.Parser parser);

  /**
    Connect to ParseEnd signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectParseEnd(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ParseEndCallbackDlg) || is(T : ParseEndCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto parser = getVal!(json.parser.Parser)(_paramVals);
      _dClosure.dlg(parser);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("parse-end", closure, after);
  }

  /**
      This signal is emitted when a parser starts parsing a JSON data stream.
  
    ## Parameters
    $(LIST
      * $(B parser) the instance the signal is connected to
    )
  */
  alias ParseStartCallbackDlg = void delegate(json.parser.Parser parser);

  /** ditto */
  alias ParseStartCallbackFunc = void function(json.parser.Parser parser);

  /**
    Connect to ParseStart signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectParseStart(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ParseStartCallbackDlg) || is(T : ParseStartCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto parser = getVal!(json.parser.Parser)(_paramVals);
      _dClosure.dlg(parser);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("parse-start", closure, after);
  }
}
