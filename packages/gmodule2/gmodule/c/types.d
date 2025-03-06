module gmodule.c.types;

public import gid.basictypes;
public import glib.c.types;
import gmodule.types;


// Enums
alias GModuleError = gmodule.types.ModuleError;
alias GModuleFlags = gmodule.types.ModuleFlags;
/**
    The #GModule struct is an opaque data structure to represent a
  [dynamically-loaded module][glib-Dynamic-Loading-of-Modules].
  It should only be accessed via the following functions.
*/
struct ModuleC;

alias extern(C) const(char)* function(ModuleC* module_) GModuleCheckInit;

alias extern(C) void function(ModuleC* module_) GModuleUnload;

