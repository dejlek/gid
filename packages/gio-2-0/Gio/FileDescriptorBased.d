module Gio.FileDescriptorBased;

public import Gio.FileDescriptorBasedIfaceProxy;
import Gid.gid;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * `GFileDescriptorBased` is an interface for file descriptor based IO.
 * It is implemented by streams $(LPAREN)implementations of [Gio.InputStream] or
 * [Gio.OutputStream]$(RPAREN) that are based on file descriptors.
 * Note that `<gio/gfiledescriptorbased.h>` belongs to the UNIX-specific
 * GIO interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
 * file or the `GioUnix-2.0` GIR namespace when using it.
 */
interface FileDescriptorBased
{

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())g_file_descriptor_based_get_type != &gidSymbolNotFound ? g_file_descriptor_based_get_type() : cast(GType)0;
  }

  /**
   * Gets the underlying file descriptor.
   * Returns: The file descriptor
   */
  int getFd();
}
