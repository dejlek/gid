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

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gst.PluginDesc");

    cInstance = *cast(GstPluginDesc*)ptr;

    if (take)
      safeFree(ptr);
  }

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
    return (cast(GstPluginDesc*)cPtr).name.fromCString(No.Free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(GstPluginDesc*)cPtr).name);
    (cast(GstPluginDesc*)cPtr).name = propval.toCString(Yes.Alloc);
  }

  @property string description()
  {
    return (cast(GstPluginDesc*)cPtr).description.fromCString(No.Free);
  }

  @property void description(string propval)
  {
    safeFree(cast(void*)(cast(GstPluginDesc*)cPtr).description);
    (cast(GstPluginDesc*)cPtr).description = propval.toCString(Yes.Alloc);
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
    return (cast(GstPluginDesc*)cPtr).version_.fromCString(No.Free);
  }

  @property void version_(string propval)
  {
    safeFree(cast(void*)(cast(GstPluginDesc*)cPtr).version_);
    (cast(GstPluginDesc*)cPtr).version_ = propval.toCString(Yes.Alloc);
  }

  @property string license()
  {
    return (cast(GstPluginDesc*)cPtr).license.fromCString(No.Free);
  }

  @property void license(string propval)
  {
    safeFree(cast(void*)(cast(GstPluginDesc*)cPtr).license);
    (cast(GstPluginDesc*)cPtr).license = propval.toCString(Yes.Alloc);
  }

  @property string source()
  {
    return (cast(GstPluginDesc*)cPtr).source.fromCString(No.Free);
  }

  @property void source(string propval)
  {
    safeFree(cast(void*)(cast(GstPluginDesc*)cPtr).source);
    (cast(GstPluginDesc*)cPtr).source = propval.toCString(Yes.Alloc);
  }

  @property string package_()
  {
    return (cast(GstPluginDesc*)cPtr).package_.fromCString(No.Free);
  }

  @property void package_(string propval)
  {
    safeFree(cast(void*)(cast(GstPluginDesc*)cPtr).package_);
    (cast(GstPluginDesc*)cPtr).package_ = propval.toCString(Yes.Alloc);
  }

  @property string origin()
  {
    return (cast(GstPluginDesc*)cPtr).origin.fromCString(No.Free);
  }

  @property void origin(string propval)
  {
    safeFree(cast(void*)(cast(GstPluginDesc*)cPtr).origin);
    (cast(GstPluginDesc*)cPtr).origin = propval.toCString(Yes.Alloc);
  }

  @property string releaseDatetime()
  {
    return (cast(GstPluginDesc*)cPtr).releaseDatetime.fromCString(No.Free);
  }

  @property void releaseDatetime(string propval)
  {
    safeFree(cast(void*)(cast(GstPluginDesc*)cPtr).releaseDatetime);
    (cast(GstPluginDesc*)cPtr).releaseDatetime = propval.toCString(Yes.Alloc);
  }
}
