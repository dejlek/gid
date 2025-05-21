/// Module for [CommandDescriptor] class
module arrowflight.command_descriptor;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.descriptor;
import arrowflight.types;
import gid.gid;

/** */
class CommandDescriptor : arrowflight.descriptor.Descriptor
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_command_descriptor_get_type != &gidSymbolNotFound ? gaflight_command_descriptor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CommandDescriptor self()
  {
    return this;
  }

  /** */
  this(string command)
  {
    GAFlightCommandDescriptor* _cretval;
    const(char)* _command = command.toCString(No.Alloc);
    _cretval = gaflight_command_descriptor_new(_command);
    this(_cretval, Yes.Take);
  }

  /** */
  string getCommand()
  {
    char* _cretval;
    _cretval = gaflight_command_descriptor_get_command(cast(GAFlightCommandDescriptor*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
