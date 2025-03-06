module gmodule.types;

import gid.gid;
import gmodule.c.functions;
import gmodule.c.types;
import gmodule.module_;


// Enums

/** */
alias ModuleError = GModuleError;

/** */
alias ModuleFlags = GModuleFlags;

// Callbacks

/**
    Specifies the type of the module initialization function.
  If a module contains a function named g_module_check_init() it is called
  automatically when the module is loaded. It is passed the #GModule structure
  and should return null on success or a string describing the initialization
  error.

  ## Parameters
  $(LIST
    * $(B module_)       the #GModule corresponding to the module which has just been loaded
  )
  Returns:     null on success, or a string describing the initialization error
*/
alias ModuleCheckInit = string delegate(gmodule.module_.Module module_);

/**
    Specifies the type of the module function called when it is unloaded.
  If a module contains a function named g_module_unload() it is called
  automatically when the module is unloaded.
  It is passed the #GModule structure.

  ## Parameters
  $(LIST
    * $(B module_)       the #GModule about to be unloaded
  )
*/
alias ModuleUnload = void delegate(gmodule.module_.Module module_);

/** */
enum MODULE_IMPL_AR = 7;

/** */
enum MODULE_IMPL_DL = 1;

/** */
enum MODULE_IMPL_NONE = 0;

/** */
enum MODULE_IMPL_WIN32 = 3;
