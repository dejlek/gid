module Arrow.SlowFileSystem;

import Arrow.FileSystem;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class SlowFileSystem : FileSystem
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_slow_file_system_get_type != &gidSymbolNotFound ? garrow_slow_file_system_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * The latency is normally distributed with a standard deviation of
   * average_latency * 0.1.
   * The random seed is given by the default random device.
   * Params:
   *   baseFileSystem = A #GArrowFileSystem as the base file system.
   *   averageLatency = The average value of the latency.
   * Returns: A newly created #GArrowSlowFileSystem.
   */
  static SlowFileSystem newAverageLatency(FileSystem baseFileSystem, double averageLatency)
  {
    GArrowSlowFileSystem* _cretval;
    _cretval = garrow_slow_file_system_new_average_latency(baseFileSystem ? cast(GArrowFileSystem*)baseFileSystem.cPtr(No.Dup) : null, averageLatency);
    auto _retval = ObjectG.getDObject!SlowFileSystem(cast(GArrowSlowFileSystem*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * The latency is normally distributed with a standard deviation of
   * average_latency * 0.1.
   * Params:
   *   baseFileSystem = A #GArrowFileSystem as the base file system.
   *   averageLatency = The average value of the latency.
   *   seed = A random seed.
   * Returns: A newly created #GArrowSlowFileSystem.
   */
  static SlowFileSystem newAverageLatencyAndSeed(FileSystem baseFileSystem, double averageLatency, int seed)
  {
    GArrowSlowFileSystem* _cretval;
    _cretval = garrow_slow_file_system_new_average_latency_and_seed(baseFileSystem ? cast(GArrowFileSystem*)baseFileSystem.cPtr(No.Dup) : null, averageLatency, seed);
    auto _retval = ObjectG.getDObject!SlowFileSystem(cast(GArrowSlowFileSystem*)_cretval, Yes.Take);
    return _retval;
  }
}
