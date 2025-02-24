module gmodule.c.functions;

public import gid.basictypes;
import gid.loader;
import gmodule.c.types;
public import glib.c.types;

version(Windows)
  private immutable LIBS = ["libgmodule-2.0-0.dll;gmodule-2.0-0.dll;gmodule-2.dll"];
else version(OSX)
  private immutable LIBS = ["libgmodule-2.0.0.dylib"];
else
  private immutable LIBS = ["libgmodule-2.0.so.0"];

__gshared extern(C)
{
  // Module
  bool function(ModuleC* module_) c_g_module_close;
  void function(ModuleC* module_) c_g_module_make_resident;
  const(char)* function(ModuleC* module_) c_g_module_name;
  bool function(ModuleC* module_, const(char)* symbolName, void** symbol) c_g_module_symbol;
  char* function(const(char)* directory, const(char)* moduleName) c_g_module_build_path;
  const(char)* function() c_g_module_error;
  GQuark function() c_g_module_error_quark;
  ModuleC* function(const(char)* fileName, GModuleFlags flags) c_g_module_open;
  ModuleC* function(const(char)* fileName, GModuleFlags flags, GError** _err) c_g_module_open_full;
  bool function() c_g_module_supported;
}

// Module
alias g_module_close = c_g_module_close;
alias g_module_make_resident = c_g_module_make_resident;
alias g_module_name = c_g_module_name;
alias g_module_symbol = c_g_module_symbol;
alias g_module_build_path = c_g_module_build_path;
alias g_module_error = c_g_module_error;
alias g_module_error_quark = c_g_module_error_quark;
alias g_module_open = c_g_module_open;
alias g_module_open_full = c_g_module_open_full;
alias g_module_supported = c_g_module_supported;

shared static this()
{
  // Module
  gidLink(cast(void**)&g_module_close, "g_module_close", LIBS);
  gidLink(cast(void**)&g_module_make_resident, "g_module_make_resident", LIBS);
  gidLink(cast(void**)&g_module_name, "g_module_name", LIBS);
  gidLink(cast(void**)&g_module_symbol, "g_module_symbol", LIBS);
  gidLink(cast(void**)&g_module_build_path, "g_module_build_path", LIBS);
  gidLink(cast(void**)&g_module_error, "g_module_error", LIBS);
  gidLink(cast(void**)&g_module_error_quark, "g_module_error_quark", LIBS);
  gidLink(cast(void**)&g_module_open, "g_module_open", LIBS);
  gidLink(cast(void**)&g_module_open_full, "g_module_open_full", LIBS);
  gidLink(cast(void**)&g_module_supported, "g_module_supported", LIBS);
}
