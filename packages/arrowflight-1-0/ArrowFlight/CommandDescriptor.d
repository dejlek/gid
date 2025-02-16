module ArrowFlight.CommandDescriptor;

import ArrowFlight.Descriptor;
import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import Gid.gid;

class CommandDescriptor : Descriptor
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_command_descriptor_get_type != &gidSymbolNotFound ? gaflight_command_descriptor_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(string command)
  {
    GAFlightCommandDescriptor* _cretval;
    const(char)* _command = command.toCString(No.Alloc);
    _cretval = gaflight_command_descriptor_new(_command);
    this(_cretval, Yes.Take);
  }

  string getCommand()
  {
    char* _cretval;
    _cretval = gaflight_command_descriptor_get_command(cast(GAFlightCommandDescriptor*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }
}
