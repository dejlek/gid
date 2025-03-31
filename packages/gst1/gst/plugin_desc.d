/// Module for [PluginDesc] class
module gst.plugin_desc;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    A plugin should export a variable of this type called plugin_desc. The plugin
    loader will use the data provided there to initialize the plugin.
    
    The @licence parameter must be one of: LGPL, GPL, QPL, GPL/QPL, MPL,
    BSD, MIT/X11, Proprietary, unknown.
*/
class PluginDesc
{
  GstPluginDesc cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gst.PluginDesc");

    cInstance = *cast(GstPluginDesc*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property int majorVersion()
  {
    return (cast(GstPluginDesc*)cPtr).majorVersion;
  }

  @property void majorVersion(int propval)
  {
    (cast(GstPluginDesc*)cPtr).majorVersion = propval;
  }

  @property int minorVersion()
  {
    return (cast(GstPluginDesc*)cPtr).minorVersion;
  }

  @property void minorVersion(int propval)
  {
    (cast(GstPluginDesc*)cPtr).minorVersion = propval;
  }

  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GstPluginDesc*)cPtr).name);
  }

  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstPluginDesc*)cPtr).name);
    dToC(propval, cast(void*)&(cast(GstPluginDesc*)cPtr).name);
  }

  @property string description()
  {
    return cToD!(string)(cast(void*)(cast(GstPluginDesc*)cPtr).description);
  }

  @property void description(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstPluginDesc*)cPtr).description);
    dToC(propval, cast(void*)&(cast(GstPluginDesc*)cPtr).description);
  }

  @property GstPluginInitFunc pluginInit()
  {
    return (cast(GstPluginDesc*)cPtr).pluginInit;
  }

  @property void pluginInit(GstPluginInitFunc propval)
  {
    (cast(GstPluginDesc*)cPtr).pluginInit = propval;
  }

  @property string version_()
  {
    return cToD!(string)(cast(void*)(cast(GstPluginDesc*)cPtr).version_);
  }

  @property void version_(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstPluginDesc*)cPtr).version_);
    dToC(propval, cast(void*)&(cast(GstPluginDesc*)cPtr).version_);
  }

  @property string license()
  {
    return cToD!(string)(cast(void*)(cast(GstPluginDesc*)cPtr).license);
  }

  @property void license(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstPluginDesc*)cPtr).license);
    dToC(propval, cast(void*)&(cast(GstPluginDesc*)cPtr).license);
  }

  @property string source()
  {
    return cToD!(string)(cast(void*)(cast(GstPluginDesc*)cPtr).source);
  }

  @property void source(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstPluginDesc*)cPtr).source);
    dToC(propval, cast(void*)&(cast(GstPluginDesc*)cPtr).source);
  }

  @property string package_()
  {
    return cToD!(string)(cast(void*)(cast(GstPluginDesc*)cPtr).package_);
  }

  @property void package_(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstPluginDesc*)cPtr).package_);
    dToC(propval, cast(void*)&(cast(GstPluginDesc*)cPtr).package_);
  }

  @property string origin()
  {
    return cToD!(string)(cast(void*)(cast(GstPluginDesc*)cPtr).origin);
  }

  @property void origin(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstPluginDesc*)cPtr).origin);
    dToC(propval, cast(void*)&(cast(GstPluginDesc*)cPtr).origin);
  }

  @property string releaseDatetime()
  {
    return cToD!(string)(cast(void*)(cast(GstPluginDesc*)cPtr).releaseDatetime);
  }

  @property void releaseDatetime(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstPluginDesc*)cPtr).releaseDatetime);
    dToC(propval, cast(void*)&(cast(GstPluginDesc*)cPtr).releaseDatetime);
  }
}
