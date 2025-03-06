module gmodule.types;

import gid.gid;
import gmodule.c.functions;
import gmodule.c.types;
import gmodule.module_;


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

/**
    Errors returned by [gmodule.module_.Module.openFull].
*/
enum ModuleError
{
  /**
      there was an error loading or opening a module file
  */
  Failed = 0,

  /**
      a module returned an error from its `g_module_check_init()` function
  */
  CheckFailed = 1,
}

/**
    Flags passed to [gmodule.module_.Module.open].
  Note that these flags are not supported on all platforms.
*/
enum ModuleFlags : uint
{
  /**
      specifies that symbols are only resolved when
        needed. The default action is to bind all symbols when the module
        is loaded.
  */
  Lazy = 1,

  /**
      specifies that symbols in the module should
        not be added to the global name space. The default action on most
        platforms is to place symbols in the module in the global name space,
        which may cause conflicts with existing symbols.
  */
  Local = 2,

  /**
      mask for all flags.
  */
  Mask = 3,
}

/** */
enum MODULE_IMPL_AR = 7;

/** */
enum MODULE_IMPL_DL = 1;

/** */
enum MODULE_IMPL_NONE = 0;

/** */
enum MODULE_IMPL_WIN32 = 3;
