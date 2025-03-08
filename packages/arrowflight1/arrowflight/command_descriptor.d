module arrowflight.command_descriptor;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.descriptor;
import arrowflight.types;
import gid.gid;

/** */
class CommandDescriptor : arrowflight.descriptor.Descriptor
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_command_descriptor_get_type != &gidSymbolNotFound ? gaflight_command_descriptor_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(string command)
  {
    GAFlightCommandDescriptor* _cretval;
    const(char)* _command = command.toCString(No.alloc);
    _cretval = gaflight_command_descriptor_new(_command);
    this(_cretval, Yes.take);
  }

  /** */
  string getCommand()
  {
    char* _cretval;
    _cretval = gaflight_command_descriptor_get_command(cast(GAFlightCommandDescriptor*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.free);
    return _retval;
  }
}
