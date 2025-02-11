module ArrowFlight.PathDescriptor;

import ArrowFlight.Descriptor;
import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import Gid.gid;

class PathDescriptor : Descriptor
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gaflight_path_descriptor_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(string[] paths)
  {
    GAFlightPathDescriptor* _cretval;
    size_t _nPaths;
    if (paths)
      _nPaths = cast(size_t)paths.length;

    char*[] _tmppaths;
    foreach (s; paths)
      _tmppaths ~= s.toCString(No.Alloc);
    const(char*)* _paths = _tmppaths.ptr;
    _cretval = gaflight_path_descriptor_new(_paths, _nPaths);
    this(_cretval, Yes.Take);
  }

  string[] getPaths()
  {
    char** _cretval;
    _cretval = gaflight_path_descriptor_get_paths(cast(GAFlightPathDescriptor*)cPtr);
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
}
