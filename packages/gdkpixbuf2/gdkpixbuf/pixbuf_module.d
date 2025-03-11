module gdkpixbuf.pixbuf_module;

import gdkpixbuf.c.functions;
import gdkpixbuf.c.types;
import gdkpixbuf.pixbuf_format;
import gdkpixbuf.types;
import gid.gid;
import gmodule.module_;

/**
    A [gdkpixbuf.pixbuf_module.PixbufModule] contains the necessary functions to load and save
  images in a certain file format.
  
  If [gdkpixbuf.pixbuf.Pixbuf] has been compiled with [gmodule.module_.Module] support, it can be extended
  by modules which can load (and perhaps also save) new image and animation
  formats.
  
  ## Implementing modules
  
  The [gdkpixbuf.pixbuf.Pixbuf] interfaces needed for implementing modules are contained in
  `gdk-pixbuf-io.h` (and `gdk-pixbuf-animation.h` if the module supports
  animations). They are not covered by the same stability guarantees as the
  regular GdkPixbuf API. To underline this fact, they are protected by the
  `GDK_PIXBUF_ENABLE_BACKEND` pre-processor symbol.
  
  Each loadable module must contain a [gdkpixbuf.types.PixbufModuleFillVtableFunc] function
  named `fill_vtable`, which will get called when the module
  is loaded and must set the function pointers of the [gdkpixbuf.pixbuf_module.PixbufModule].
  
  In order to make format-checking work before actually loading the modules
  (which may require calling `dlopen` to load image libraries), modules export
  their signatures (and other information) via the `fill_info` function. An
  external utility, `gdk-pixbuf-query-loaders`, uses this to create a text
  file containing a list of all available loaders and  their signatures.
  This file is then read at runtime by [gdkpixbuf.pixbuf.Pixbuf] to obtain the list of
  available loaders and their signatures.
  
  Modules may only implement a subset of the functionality available via
  [gdkpixbuf.pixbuf_module.PixbufModule]. If a particular functionality is not implemented, the
  `fill_vtable` function will simply not set the corresponding
  function pointers of the [gdkpixbuf.pixbuf_module.PixbufModule] structure. If a module supports
  incremental loading (i.e. provides `begin_load`, `stop_load` and
  `load_increment`), it doesn't have to implement `load`, since [gdkpixbuf.pixbuf.Pixbuf]
  can supply a generic `load` implementation wrapping the incremental loading.
  
  ## Installing modules
  
  Installing a module is a two-step process:
  
   $(LIST
      * copy the module file(s) to the loader directory (normally
        `$libdir/gdk-pixbuf-2.0/$version/loaders`, unless overridden by the
        environment variable `GDK_PIXBUF_MODULEDIR`)
      * call `gdk-pixbuf-query-loaders` to update the module file (normally
        `$libdir/gdk-pixbuf-2.0/$version/loaders.cache`, unless overridden
        by the environment variable `GDK_PIXBUF_MODULE_FILE`)
   )
*/
class PixbufModule
{
  GdkPixbufModule cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GdkPixbuf.PixbufModule");

    cInstance = *cast(GdkPixbufModule*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string moduleName()
  {
    return cToD!(string)(cast(void*)(cast(GdkPixbufModule*)cPtr).moduleName);
  }

  @property void moduleName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdkPixbufModule*)cPtr).moduleName);
    dToC(propval, cast(void*)&(cast(GdkPixbufModule*)cPtr).moduleName);
  }

  @property string modulePath()
  {
    return cToD!(string)(cast(void*)(cast(GdkPixbufModule*)cPtr).modulePath);
  }

  @property void modulePath(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdkPixbufModule*)cPtr).modulePath);
    dToC(propval, cast(void*)&(cast(GdkPixbufModule*)cPtr).modulePath);
  }

  @property gmodule.module_.Module module_()
  {
    return new gmodule.module_.Module(cast(ModuleC*)(cast(GdkPixbufModule*)cPtr).module_);
  }

  @property gdkpixbuf.pixbuf_format.PixbufFormat info()
  {
    return cToD!(gdkpixbuf.pixbuf_format.PixbufFormat)(cast(void*)(cast(GdkPixbufModule*)cPtr).info);
  }

  @property void info(gdkpixbuf.pixbuf_format.PixbufFormat propval)
  {
    cValueFree!(gdkpixbuf.pixbuf_format.PixbufFormat)(cast(void*)(cast(GdkPixbufModule*)cPtr).info);
    dToC(propval, cast(void*)&(cast(GdkPixbufModule*)cPtr).info);
  }

  @property GdkPixbufModuleLoadFunc load()
  {
    return (cast(GdkPixbufModule*)cPtr).load;
  }

  @property void load(GdkPixbufModuleLoadFunc propval)
  {
    (cast(GdkPixbufModule*)cPtr).load = propval;
  }

  @property GdkPixbufModuleLoadXpmDataFunc loadXpmData()
  {
    return (cast(GdkPixbufModule*)cPtr).loadXpmData;
  }

  @property void loadXpmData(GdkPixbufModuleLoadXpmDataFunc propval)
  {
    (cast(GdkPixbufModule*)cPtr).loadXpmData = propval;
  }

  @property GdkPixbufModuleStopLoadFunc stopLoad()
  {
    return (cast(GdkPixbufModule*)cPtr).stopLoad;
  }

  @property void stopLoad(GdkPixbufModuleStopLoadFunc propval)
  {
    (cast(GdkPixbufModule*)cPtr).stopLoad = propval;
  }

  @property GdkPixbufModuleIncrementLoadFunc loadIncrement()
  {
    return (cast(GdkPixbufModule*)cPtr).loadIncrement;
  }

  @property void loadIncrement(GdkPixbufModuleIncrementLoadFunc propval)
  {
    (cast(GdkPixbufModule*)cPtr).loadIncrement = propval;
  }

  @property GdkPixbufModuleLoadAnimationFunc loadAnimation()
  {
    return (cast(GdkPixbufModule*)cPtr).loadAnimation;
  }

  @property void loadAnimation(GdkPixbufModuleLoadAnimationFunc propval)
  {
    (cast(GdkPixbufModule*)cPtr).loadAnimation = propval;
  }

  @property GdkPixbufModuleSaveFunc save()
  {
    return (cast(GdkPixbufModule*)cPtr).save;
  }

  @property void save(GdkPixbufModuleSaveFunc propval)
  {
    (cast(GdkPixbufModule*)cPtr).save = propval;
  }

  @property GdkPixbufModuleSaveOptionSupportedFunc isSaveOptionSupported()
  {
    return (cast(GdkPixbufModule*)cPtr).isSaveOptionSupported;
  }

  @property void isSaveOptionSupported(GdkPixbufModuleSaveOptionSupportedFunc propval)
  {
    (cast(GdkPixbufModule*)cPtr).isSaveOptionSupported = propval;
  }
}
