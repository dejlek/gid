module arrowflight.path_descriptor;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.descriptor;
import arrowflight.types;
import gid.gid;

/** */
class PathDescriptor : arrowflight.descriptor.Descriptor
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_path_descriptor_get_type != &gidSymbolNotFound ? gaflight_path_descriptor_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(string[] paths)
  {
    GAFlightPathDescriptor* _cretval;
    size_t _nPaths;
    if (paths)
      _nPaths = cast(size_t)paths.length;

    char*[] _tmppaths;
    foreach (s; paths)
      _tmppaths ~= s.toCString(No.alloc);
    const(char*)* _paths = _tmppaths.ptr;
    _cretval = gaflight_path_descriptor_new(_paths, _nPaths);
    this(_cretval, Yes.take);
  }

  /** */
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
        _retval[i] = _cretval[i].fromCString(Yes.free);
    }
    return _retval;
  }
}
