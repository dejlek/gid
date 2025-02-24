module gio.file_icon;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.file;
import gio.file_mixin;
import gio.icon;
import gio.icon_mixin;
import gio.loadable_icon;
import gio.loadable_icon_mixin;
import gio.types;
import gobject.object;

/**
 * `GFileIcon` specifies an icon by pointing to an image file
 * to be used as icon.
 * It implements [Gio.LoadableIcon].
 */
class FileIcon : ObjectG, Icon, LoadableIcon
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_file_icon_get_type != &gidSymbolNotFound ? g_file_icon_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin IconT!();
  mixin LoadableIconT!();

  /**
   * Creates a new icon for a file.
   * Params:
   *   file = a #GFile.
   * Returns: a #GIcon for the given
   *   file, or %NULL on error.
   */
  this(File file)
  {
    GIcon* _cretval;
    _cretval = g_file_icon_new(file ? cast(GFile*)(cast(ObjectG)file).cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the #GFile associated with the given icon.
   * Returns: a #GFile.
   */
  File getFile()
  {
    GFile* _cretval;
    _cretval = g_file_icon_get_file(cast(GFileIcon*)cPtr);
    auto _retval = ObjectG.getDObject!File(cast(GFile*)_cretval, No.Take);
    return _retval;
  }
}
