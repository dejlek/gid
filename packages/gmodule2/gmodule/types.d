module gmodule.types;

import gid.gid;
import gmodule.c.functions;
import gmodule.c.types;
import gmodule.module_;


// Enums
alias ModuleError = GModuleError;
alias ModuleFlags = GModuleFlags;

// Callbacks
alias ModuleCheckInit = string delegate(gmodule.module_.Module module_);
alias ModuleUnload = void delegate(gmodule.module_.Module module_);

enum MODULE_IMPL_AR = 7;


enum MODULE_IMPL_DL = 1;


enum MODULE_IMPL_NONE = 0;


enum MODULE_IMPL_WIN32 = 3;

