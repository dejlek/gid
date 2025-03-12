module soup.cache;

import gid.gid;
import gobject.object;
import soup.c.functions;
import soup.c.types;
import soup.session_feature;
import soup.session_feature_mixin;
import soup.types;

/**
    File-based cache for HTTP resources.
*/
class Cache : gobject.object.ObjectG, soup.session_feature.SessionFeature
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_cache_get_type != &gidSymbolNotFound ? soup_cache_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Cache self()
  {
    return this;
  }

  mixin SessionFeatureT!();

  /**
      Creates a new #SoupCache.
    Params:
      cacheDir =       the directory to store the cached data, or null
          to use the default one. Note that since the cache isn't safe to access for
          multiple processes at once, and the default directory isn't namespaced by
          process, clients are strongly discouraged from passing null.
      cacheType =       the #SoupCacheType of the cache
    Returns:     a new #SoupCache
  */
  this(string cacheDir, soup.types.CacheType cacheType)
  {
    SoupCache* _cretval;
    const(char)* _cacheDir = cacheDir.toCString(No.Alloc);
    _cretval = soup_cache_new(_cacheDir, cacheType);
    this(_cretval, Yes.Take);
  }

  /**
      Will remove all entries in the cache plus all the cache files.
    
    This is not thread safe and must be called only from the thread that created the #SoupCache
  */
  void clear()
  {
    soup_cache_clear(cast(SoupCache*)cPtr);
  }

  /**
      Synchronously writes the cache index out to disk.
    
    Contrast with [soup.cache.Cache.flush], which writes pending cache *entries* to
    disk.
    
    You must call this before exiting if you want your cache data to
    persist between sessions.
    
    This is not thread safe and must be called only from the thread that created the #SoupCache
  */
  void dump()
  {
    soup_cache_dump(cast(SoupCache*)cPtr);
  }

  /**
      Forces all pending writes in the cache to be
    committed to disk.
    
    For doing so it will iterate the [glib.main_context.MainContext] associated with
    cache's session as long as needed.
    
    Contrast with [soup.cache.Cache.dump], which writes out the cache index file.
  */
  void flush()
  {
    soup_cache_flush(cast(SoupCache*)cPtr);
  }

  /**
      Gets the maximum size of the cache.
    Returns:     the maximum size of the cache, in bytes.
  */
  uint getMaxSize()
  {
    uint _retval;
    _retval = soup_cache_get_max_size(cast(SoupCache*)cPtr);
    return _retval;
  }

  /**
      Loads the contents of cache's index into memory.
    
    This is not thread safe and must be called only from the thread that created the #SoupCache
  */
  void load()
  {
    soup_cache_load(cast(SoupCache*)cPtr);
  }

  /**
      Sets the maximum size of the cache.
    Params:
      maxSize =       the maximum size of the cache, in bytes
  */
  void setMaxSize(uint maxSize)
  {
    soup_cache_set_max_size(cast(SoupCache*)cPtr, maxSize);
  }
}
