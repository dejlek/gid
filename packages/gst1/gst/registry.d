module gst.registry;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gobject.types;
import gst.c.functions;
import gst.c.types;
import gst.object;
import gst.plugin;
import gst.plugin_feature;
import gst.types;

/**
    One registry holds the metadata of a set of plugins.
  
  <emphasis role="bold">Design:</emphasis>
  
  The #GstRegistry object is a list of plugins and some functions for dealing
  with them. Each #GstPlugin is matched 1-1 with a file on disk, and may or may
  not be loaded at a given time.
  
  The primary source, at all times, of plugin information is each plugin file
  itself. Thus, if an application wants information about a particular plugin,
  or wants to search for a feature that satisfies given criteria, the primary
  means of doing so is to load every plugin and look at the resulting
  information that is gathered in the default registry. Clearly, this is a time
  consuming process, so we cache information in the registry file. The format
  and location of the cache file is internal to gstreamer.
  
  On startup, plugins are searched for in the plugin search path. The following
  locations are checked in this order:
  
  $(LIST
    * location from --gst-plugin-path commandline option.
    * the GST_PLUGIN_PATH environment variable.
    * the GST_PLUGIN_SYSTEM_PATH environment variable.
    * default locations (if GST_PLUGIN_SYSTEM_PATH is not set).
      Those default locations are:
      `$XDG_DATA_HOME/gstreamer-$GST_API_VERSION/plugins/`
      and `$prefix/libs/gstreamer-$GST_API_VERSION/`.
      [$XDG_DATA_HOME](http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html) defaults to
      `$HOME/.local/share`.
  )
    
  The registry cache file is loaded from
  `$XDG_CACHE_HOME/gstreamer-$GST_API_VERSION/registry-$ARCH.bin`
  (where $XDG_CACHE_HOME defaults to `$HOME/.cache`) or the file listed in the `GST_REGISTRY`
  env var. One reason to change the registry location is for testing.
  
  For each plugin that is found in the plugin search path, there could be 3
  possibilities for cached information:
  
    $(LIST
        * the cache may not contain information about a given file.
        * the cache may have stale information.
        * the cache may have current information.
    )
      
  In the first two cases, the plugin is loaded and the cache updated. In
  addition to these cases, the cache may have entries for plugins that are not
  relevant to the current process. These are marked as not available to the
  current process. If the cache is updated for whatever reason, it is marked
  dirty.
  
  A dirty cache is written out at the end of initialization. Each entry is
  checked to make sure the information is minimally valid. If not, the entry is
  simply dropped.
  
  ## Implementation notes:
  
  The "cache" and "registry" are different concepts and can represent
  different sets of plugins. For various reasons, at init time, the cache is
  stored in the default registry, and plugins not relevant to the current
  process are marked with the [gst.types.PluginFlags.cached] bit. These plugins are
  removed at the end of initialization.
*/
class Registry : gst.object.ObjectGst
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_registry_get_type != &gidSymbolNotFound ? gst_registry_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      By default GStreamer will perform scanning and rebuilding of the
    registry file using a helper child process.
    
    Applications might want to disable this behaviour with the
    [gst.registry.Registry.forkSetEnabled] function, in which case new plugins
    are scanned (and loaded) into the application process.
    Returns:     true if GStreamer will use the child helper process when
      rebuilding the registry.
  */
  static bool forkIsEnabled()
  {
    bool _retval;
    _retval = gst_registry_fork_is_enabled();
    return _retval;
  }

  /**
      Applications might want to disable/enable spawning of a child helper process
    when rebuilding the registry. See [gst.registry.Registry.forkIsEnabled] for more
    information.
    Params:
      enabled =       whether rebuilding the registry can use a temporary child helper process.
  */
  static void forkSetEnabled(bool enabled)
  {
    gst_registry_fork_set_enabled(enabled);
  }

  /**
      Retrieves the singleton plugin registry. The caller does not own a
    reference on the registry, as it is alive as long as GStreamer is
    initialized.
    Returns:     the #GstRegistry.
  */
  static gst.registry.Registry get()
  {
    GstRegistry* _cretval;
    _cretval = gst_registry_get();
    auto _retval = ObjectG.getDObject!(gst.registry.Registry)(cast(GstRegistry*)_cretval, No.take);
    return _retval;
  }

  /**
      Add the feature to the registry. The feature-added signal will be emitted.
    
    feature's reference count will be incremented, and any floating
    reference will be removed (see [gst.object.ObjectGst.refSink])
    Params:
      feature =       the feature to add
    Returns:     true on success.
      
      MT safe.
  */
  bool addFeature(gst.plugin_feature.PluginFeature feature)
  {
    bool _retval;
    _retval = gst_registry_add_feature(cast(GstRegistry*)cPtr, feature ? cast(GstPluginFeature*)feature.cPtr(No.dup) : null);
    return _retval;
  }

  /**
      Add the plugin to the registry. The plugin-added signal will be emitted.
    
    plugin's reference count will be incremented, and any floating
    reference will be removed (see [gst.object.ObjectGst.refSink])
    Params:
      plugin =       the plugin to add
    Returns:     true on success.
      
      MT safe.
  */
  bool addPlugin(gst.plugin.Plugin plugin)
  {
    bool _retval;
    _retval = gst_registry_add_plugin(cast(GstRegistry*)cPtr, plugin ? cast(GstPlugin*)plugin.cPtr(No.dup) : null);
    return _retval;
  }

  /**
      Checks whether a plugin feature by the given name exists in
    registry and whether its version is at least the
    version required.
    Params:
      featureName =       the name of the feature (e.g. "oggdemux")
      minMajor =       the minimum major version number
      minMinor =       the minimum minor version number
      minMicro =       the minimum micro version number
    Returns:     true if the feature could be found and the version is
      the same as the required version or newer, and false otherwise.
  */
  bool checkFeatureVersion(string featureName, uint minMajor, uint minMinor, uint minMicro)
  {
    bool _retval;
    const(char)* _featureName = featureName.toCString(No.alloc);
    _retval = gst_registry_check_feature_version(cast(GstRegistry*)cPtr, _featureName, minMajor, minMinor, minMicro);
    return _retval;
  }

  /**
      Runs a filter against all features of the plugins in the registry
    and returns a GList with the results.
    If the first flag is set, only the first match is
    returned (as a list with a single object).
    Params:
      filter =       the filter to use
      first =       only return first match
    Returns:     a #GList of
          #GstPluginFeature. Use [gst.plugin_feature.PluginFeature.listFree] after usage.
      
      MT safe.
  */
  gst.plugin_feature.PluginFeature[] featureFilter(gst.types.PluginFeatureFilter filter, bool first)
  {
    extern(C) bool _filterCallback(GstPluginFeature* feature, void* userData)
    {
      auto _dlg = cast(gst.types.PluginFeatureFilter*)userData;

      bool _retval = (*_dlg)(ObjectG.getDObject!(gst.plugin_feature.PluginFeature)(cast(void*)feature, No.take));
      return _retval;
    }
    auto _filterCB = filter ? &_filterCallback : null;

    GList* _cretval;
    auto _filter = filter ? cast(void*)&(filter) : null;
    _cretval = gst_registry_feature_filter(cast(GstRegistry*)cPtr, _filterCB, first, _filter);
    auto _retval = gListToD!(gst.plugin_feature.PluginFeature, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Find the pluginfeature with the given name and type in the registry.
    Params:
      name =       the pluginfeature name to find
      type =       the pluginfeature type to find
    Returns:     the pluginfeature with the
          given name and type or null if the plugin was not
          found. [gst.object.ObjectGst.unref] after usage.
      
      MT safe.
  */
  gst.plugin_feature.PluginFeature findFeature(string name, gobject.types.GType type)
  {
    GstPluginFeature* _cretval;
    const(char)* _name = name.toCString(No.alloc);
    _cretval = gst_registry_find_feature(cast(GstRegistry*)cPtr, _name, type);
    auto _retval = ObjectG.getDObject!(gst.plugin_feature.PluginFeature)(cast(GstPluginFeature*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Find the plugin with the given name in the registry.
    The plugin will be reffed; caller is responsible for unreffing.
    Params:
      name =       the plugin name to find
    Returns:     the plugin with the given name
          or null if the plugin was not found. [gst.object.ObjectGst.unref] after
          usage.
      
      MT safe.
  */
  gst.plugin.Plugin findPlugin(string name)
  {
    GstPlugin* _cretval;
    const(char)* _name = name.toCString(No.alloc);
    _cretval = gst_registry_find_plugin(cast(GstRegistry*)cPtr, _name);
    auto _retval = ObjectG.getDObject!(gst.plugin.Plugin)(cast(GstPlugin*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Retrieves a #GList of #GstPluginFeature of type.
    Params:
      type =       a #GType.
    Returns:     a #GList of
          #GstPluginFeature of type. Use [gst.plugin_feature.PluginFeature.listFree] after use
      
      MT safe.
  */
  gst.plugin_feature.PluginFeature[] getFeatureList(gobject.types.GType type)
  {
    GList* _cretval;
    _cretval = gst_registry_get_feature_list(cast(GstRegistry*)cPtr, type);
    auto _retval = gListToD!(gst.plugin_feature.PluginFeature, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Retrieves a #GList of features of the plugin with name name.
    Params:
      name =       a plugin name.
    Returns:     a #GList of
          #GstPluginFeature. Use [gst.plugin_feature.PluginFeature.listFree] after usage.
  */
  gst.plugin_feature.PluginFeature[] getFeatureListByPlugin(string name)
  {
    GList* _cretval;
    const(char)* _name = name.toCString(No.alloc);
    _cretval = gst_registry_get_feature_list_by_plugin(cast(GstRegistry*)cPtr, _name);
    auto _retval = gListToD!(gst.plugin_feature.PluginFeature, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Returns the registry's feature list cookie. This changes
    every time a feature is added or removed from the registry.
    Returns:     the feature list cookie.
  */
  uint getFeatureListCookie()
  {
    uint _retval;
    _retval = gst_registry_get_feature_list_cookie(cast(GstRegistry*)cPtr);
    return _retval;
  }

  /**
      Get a copy of all plugins registered in the given registry. The refcount
    of each element in the list in incremented.
    Returns:     a #GList of #GstPlugin.
          Use [gst.plugin.Plugin.listFree] after usage.
      
      MT safe.
  */
  gst.plugin.Plugin[] getPluginList()
  {
    GList* _cretval;
    _cretval = gst_registry_get_plugin_list(cast(GstRegistry*)cPtr);
    auto _retval = gListToD!(gst.plugin.Plugin, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Look up a plugin in the given registry with the given filename.
    If found, plugin is reffed.
    Params:
      filename =       the name of the file to look up
    Returns:     the #GstPlugin if found, or
          null if not.  [gst.object.ObjectGst.unref] after usage.
  */
  gst.plugin.Plugin lookup(string filename)
  {
    GstPlugin* _cretval;
    const(char)* _filename = filename.toCString(No.alloc);
    _cretval = gst_registry_lookup(cast(GstRegistry*)cPtr, _filename);
    auto _retval = ObjectG.getDObject!(gst.plugin.Plugin)(cast(GstPlugin*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Find a #GstPluginFeature with name in registry.
    Params:
      name =       a #GstPluginFeature name
    Returns:     a #GstPluginFeature with its refcount incremented,
          use [gst.object.ObjectGst.unref] after usage.
      
      MT safe.
  */
  gst.plugin_feature.PluginFeature lookupFeature(string name)
  {
    GstPluginFeature* _cretval;
    const(char)* _name = name.toCString(No.alloc);
    _cretval = gst_registry_lookup_feature(cast(GstRegistry*)cPtr, _name);
    auto _retval = ObjectG.getDObject!(gst.plugin_feature.PluginFeature)(cast(GstPluginFeature*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Runs a filter against all plugins in the registry and returns a #GList with
    the results. If the first flag is set, only the first match is
    returned (as a list with a single object).
    Every plugin is reffed; use [gst.plugin.Plugin.listFree] after use, which
    will unref again.
    Params:
      filter =       the filter to use
      first =       only return first match
    Returns:     a #GList of #GstPlugin.
          Use [gst.plugin.Plugin.listFree] after usage.
      
      MT safe.
  */
  gst.plugin.Plugin[] pluginFilter(gst.types.PluginFilter filter, bool first)
  {
    extern(C) bool _filterCallback(GstPlugin* plugin, void* userData)
    {
      auto _dlg = cast(gst.types.PluginFilter*)userData;

      bool _retval = (*_dlg)(ObjectG.getDObject!(gst.plugin.Plugin)(cast(void*)plugin, No.take));
      return _retval;
    }
    auto _filterCB = filter ? &_filterCallback : null;

    GList* _cretval;
    auto _filter = filter ? cast(void*)&(filter) : null;
    _cretval = gst_registry_plugin_filter(cast(GstRegistry*)cPtr, _filterCB, first, _filter);
    auto _retval = gListToD!(gst.plugin.Plugin, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Remove the feature from the registry.
    
    MT safe.
    Params:
      feature =       the feature to remove
  */
  void removeFeature(gst.plugin_feature.PluginFeature feature)
  {
    gst_registry_remove_feature(cast(GstRegistry*)cPtr, feature ? cast(GstPluginFeature*)feature.cPtr(No.dup) : null);
  }

  /**
      Remove the plugin from the registry.
    
    MT safe.
    Params:
      plugin =       the plugin to remove
  */
  void removePlugin(gst.plugin.Plugin plugin)
  {
    gst_registry_remove_plugin(cast(GstRegistry*)cPtr, plugin ? cast(GstPlugin*)plugin.cPtr(No.dup) : null);
  }

  /**
      Scan the given path for plugins to add to the registry. The syntax of the
    path is specific to the registry.
    Params:
      path =       the path to scan
    Returns:     true if registry changed
  */
  bool scanPath(string path)
  {
    bool _retval;
    const(char)* _path = path.toCString(No.alloc);
    _retval = gst_registry_scan_path(cast(GstRegistry*)cPtr, _path);
    return _retval;
  }

  /**
      Signals that a feature has been added to the registry (possibly
    replacing a previously-added one by the same name)
  
    ## Parameters
    $(LIST
      * $(B feature)       the feature that has been added
      * $(B registry) the instance the signal is connected to
    )
  */
  alias FeatureAddedCallbackDlg = void delegate(gst.plugin_feature.PluginFeature feature, gst.registry.Registry registry);

  /** ditto */
  alias FeatureAddedCallbackFunc = void function(gst.plugin_feature.PluginFeature feature, gst.registry.Registry registry);

  /**
    Connect to FeatureAdded signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectFeatureAdded(T)(T callback, Flag!"after" after = No.after)
  if (is(T : FeatureAddedCallbackDlg) || is(T : FeatureAddedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto registry = getVal!(gst.registry.Registry)(_paramVals);
      auto feature = getVal!(gst.plugin_feature.PluginFeature)(&_paramVals[1]);
      _dClosure.dlg(feature, registry);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("feature-added", closure, after);
  }

  /**
      Signals that a plugin has been added to the registry (possibly
    replacing a previously-added one by the same name)
  
    ## Parameters
    $(LIST
      * $(B plugin)       the plugin that has been added
      * $(B registry) the instance the signal is connected to
    )
  */
  alias PluginAddedCallbackDlg = void delegate(gst.plugin.Plugin plugin, gst.registry.Registry registry);

  /** ditto */
  alias PluginAddedCallbackFunc = void function(gst.plugin.Plugin plugin, gst.registry.Registry registry);

  /**
    Connect to PluginAdded signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectPluginAdded(T)(T callback, Flag!"after" after = No.after)
  if (is(T : PluginAddedCallbackDlg) || is(T : PluginAddedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto registry = getVal!(gst.registry.Registry)(_paramVals);
      auto plugin = getVal!(gst.plugin.Plugin)(&_paramVals[1]);
      _dClosure.dlg(plugin, registry);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("plugin-added", closure, after);
  }
}
