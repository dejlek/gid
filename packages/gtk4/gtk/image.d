module gtk.image;

import gdk.paintable;
import gdkpixbuf.pixbuf;
import gid.gid;
import gio.icon;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
 * The `GtkImage` widget displays an image.
 * ![An example GtkImage](image.png)
 * Various kinds of object can be displayed as an image; most typically,
 * you would load a `GdkTexture` from a file, using the convenience function
 * [gtk.image.Image.newFromFile], for instance:
 * ```c
 * GtkWidget *image \= gtk_image_new_from_file $(LPAREN)"myfile.png"$(RPAREN);
 * ```
 * If the file isn’t loaded successfully, the image will contain a
 * “broken image” icon similar to that used in many web browsers.
 * If you want to handle errors in loading the file yourself,
 * for example by displaying an error message, then load the image with
 * [gdk.texture.Texture.newFromFile], then create the `GtkImage` with
 * [gtk.image.Image.newFromPaintable].
 * Sometimes an application will want to avoid depending on external data
 * files, such as image files. See the documentation of `GResource` inside
 * GIO, for details. In this case, [gtk.image.Image.utf8],
 * [gtk.image.Image.newFromResource], and [gtk.image.Image.setFromResource]
 * should be used.
 * `GtkImage` displays its image as an icon, with a size that is determined
 * by the application. See [gtk.picture.Picture] if you want to show an image
 * at is actual size.
 * ## CSS nodes
 * `GtkImage` has a single CSS node with the name `image`. The style classes
 * `.normal-icons` or `.large-icons` may appear, depending on the
 * property@Gtk.Image:icon-size property.
 * ## Accessibility
 * `GtkImage` uses the `GTK_ACCESSIBLE_ROLE_IMG` role.
 */
class Image : gtk.widget.Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_image_get_type != &gidSymbolNotFound ? gtk_image_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new empty `GtkImage` widget.
   * Returns: a newly created `GtkImage` widget.
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_image_new();
    this(_cretval, No.Take);
  }

  /**
   * Creates a new `GtkImage` displaying the file filename.
   * If the file isn’t found or can’t be loaded, the resulting `GtkImage`
   * will display a “broken image” icon. This function never returns %NULL,
   * it always returns a valid `GtkImage` widget.
   * If you need to detect failures to load the file, use
   * [gdk.texture.Texture.newFromFile] to load the file yourself,
   * then create the `GtkImage` from the texture.
   * The storage type $(LPAREN)see [gtk.image.Image.getStorageType]$(RPAREN)
   * of the returned image is not defined, it will be whatever
   * is appropriate for displaying the file.
   * Params:
   *   filename = a filename
   * Returns: a new `GtkImage`
   */
  static gtk.image.Image newFromFile(string filename)
  {
    GtkWidget* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    _cretval = gtk_image_new_from_file(_filename);
    auto _retval = ObjectG.getDObject!(gtk.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Creates a `GtkImage` displaying an icon from the current icon theme.
   * If the icon name isn’t known, a “broken image” icon will be
   * displayed instead. If the current icon theme is changed, the icon
   * will be updated appropriately.
   * Params:
   *   icon = an icon
   * Returns: a new `GtkImage` displaying the themed icon
   */
  static gtk.image.Image newFromGicon(gio.icon.Icon icon)
  {
    GtkWidget* _cretval;
    _cretval = gtk_image_new_from_gicon(icon ? cast(GIcon*)(cast(ObjectG)icon).cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Creates a `GtkImage` displaying an icon from the current icon theme.
   * If the icon name isn’t known, a “broken image” icon will be
   * displayed instead. If the current icon theme is changed, the icon
   * will be updated appropriately.
   * Params:
   *   iconName = an icon name
   * Returns: a new `GtkImage` displaying the themed icon
   */
  static gtk.image.Image newFromIconName(string iconName)
  {
    GtkWidget* _cretval;
    const(char)* _iconName = iconName.toCString(No.Alloc);
    _cretval = gtk_image_new_from_icon_name(_iconName);
    auto _retval = ObjectG.getDObject!(gtk.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Creates a new `GtkImage` displaying paintable.
   * The `GtkImage` does not assume a reference to the paintable; you still
   * need to unref it if you own references. `GtkImage` will add its own
   * reference rather than adopting yours.
   * The `GtkImage` will track changes to the paintable and update
   * its size and contents in response to it.
   * Params:
   *   paintable = a `GdkPaintable`
   * Returns: a new `GtkImage`
   */
  static gtk.image.Image newFromPaintable(gdk.paintable.Paintable paintable)
  {
    GtkWidget* _cretval;
    _cretval = gtk_image_new_from_paintable(paintable ? cast(GdkPaintable*)(cast(ObjectG)paintable).cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Creates a new `GtkImage` displaying pixbuf.
   * The `GtkImage` does not assume a reference to the pixbuf; you still
   * need to unref it if you own references. `GtkImage` will add its own
   * reference rather than adopting yours.
   * This is a helper for [gtk.image.Image.newFromPaintable], and you can't
   * get back the exact pixbuf once this is called, only a texture.
   * Note that this function just creates an `GtkImage` from the pixbuf.
   * The `GtkImage` created will not react to state changes. Should you
   * want that, you should use [gtk.image.Image.newFromIconName].
   * Params:
   *   pixbuf = a `GdkPixbuf`
   * Returns: a new `GtkImage`

   * Deprecated: Use [gtk.image.Image.newFromPaintable] and
   *   [gdk.texture.Texture.newForPixbuf] instead
   */
  static gtk.image.Image newFromPixbuf(gdkpixbuf.pixbuf.Pixbuf pixbuf)
  {
    GtkWidget* _cretval;
    _cretval = gtk_image_new_from_pixbuf(pixbuf ? cast(PixbufC*)pixbuf.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Creates a new `GtkImage` displaying the resource file resource_path.
   * If the file isn’t found or can’t be loaded, the resulting `GtkImage` will
   * display a “broken image” icon. This function never returns %NULL,
   * it always returns a valid `GtkImage` widget.
   * If you need to detect failures to load the file, use
   * [gdkpixbuf.pixbuf.Pixbuf.newFromFile] to load the file yourself,
   * then create the `GtkImage` from the pixbuf.
   * The storage type $(LPAREN)see [gtk.image.Image.getStorageType]$(RPAREN) of
   * the returned image is not defined, it will be whatever is
   * appropriate for displaying the file.
   * Params:
   *   resourcePath = a resource path
   * Returns: a new `GtkImage`
   */
  static gtk.image.Image newFromResource(string resourcePath)
  {
    GtkWidget* _cretval;
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    _cretval = gtk_image_new_from_resource(_resourcePath);
    auto _retval = ObjectG.getDObject!(gtk.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Resets the image to be empty.
   */
  void clear()
  {
    gtk_image_clear(cast(GtkImage*)cPtr);
  }

  /**
   * Gets the `GIcon` being displayed by the `GtkImage`.
   * The storage type of the image must be %GTK_IMAGE_EMPTY or
   * %GTK_IMAGE_GICON $(LPAREN)see [gtk.image.Image.getStorageType]$(RPAREN).
   * The caller of this function does not own a reference to the
   * returned `GIcon`.
   * Returns: a `GIcon`
   */
  gio.icon.Icon getGicon()
  {
    GIcon* _cretval;
    _cretval = gtk_image_get_gicon(cast(GtkImage*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the icon name and size being displayed by the `GtkImage`.
   * The storage type of the image must be %GTK_IMAGE_EMPTY or
   * %GTK_IMAGE_ICON_NAME $(LPAREN)see [gtk.image.Image.getStorageType]$(RPAREN).
   * The returned string is owned by the `GtkImage` and should not
   * be freed.
   * Returns: the icon name
   */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_image_get_icon_name(cast(GtkImage*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets the icon size used by the image when rendering icons.
   * Returns: the image size used by icons
   */
  gtk.types.IconSize getIconSize()
  {
    GtkIconSize _cretval;
    _cretval = gtk_image_get_icon_size(cast(GtkImage*)cPtr);
    gtk.types.IconSize _retval = cast(gtk.types.IconSize)_cretval;
    return _retval;
  }

  /**
   * Gets the image `GdkPaintable` being displayed by the `GtkImage`.
   * The storage type of the image must be %GTK_IMAGE_EMPTY or
   * %GTK_IMAGE_PAINTABLE $(LPAREN)see [gtk.image.Image.getStorageType]$(RPAREN).
   * The caller of this function does not own a reference to the
   * returned paintable.
   * Returns: the displayed paintable
   */
  gdk.paintable.Paintable getPaintable()
  {
    GdkPaintable* _cretval;
    _cretval = gtk_image_get_paintable(cast(GtkImage*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.paintable.Paintable)(cast(GdkPaintable*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the pixel size used for named icons.
   * Returns: the pixel size used for named icons.
   */
  int getPixelSize()
  {
    int _retval;
    _retval = gtk_image_get_pixel_size(cast(GtkImage*)cPtr);
    return _retval;
  }

  /**
   * Gets the type of representation being used by the `GtkImage`
   * to store image data.
   * If the `GtkImage` has no image data, the return value will
   * be %GTK_IMAGE_EMPTY.
   * Returns: image representation being used
   */
  gtk.types.ImageType getStorageType()
  {
    GtkImageType _cretval;
    _cretval = gtk_image_get_storage_type(cast(GtkImage*)cPtr);
    gtk.types.ImageType _retval = cast(gtk.types.ImageType)_cretval;
    return _retval;
  }

  /**
   * Sets a `GtkImage` to show a file.
   * See [gtk.image.Image.newFromFile] for details.
   * Params:
   *   filename = a filename
   */
  void setFromFile(string filename)
  {
    const(char)* _filename = filename.toCString(No.Alloc);
    gtk_image_set_from_file(cast(GtkImage*)cPtr, _filename);
  }

  /**
   * Sets a `GtkImage` to show a `GIcon`.
   * See [gtk.image.Image.newFromGicon] for details.
   * Params:
   *   icon = an icon
   */
  void setFromGicon(gio.icon.Icon icon)
  {
    gtk_image_set_from_gicon(cast(GtkImage*)cPtr, icon ? cast(GIcon*)(cast(ObjectG)icon).cPtr(No.Dup) : null);
  }

  /**
   * Sets a `GtkImage` to show a named icon.
   * See [gtk.image.Image.newFromIconName] for details.
   * Params:
   *   iconName = an icon name
   */
  void setFromIconName(string iconName)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_image_set_from_icon_name(cast(GtkImage*)cPtr, _iconName);
  }

  /**
   * Sets a `GtkImage` to show a `GdkPaintable`.
   * See [gtk.image.Image.newFromPaintable] for details.
   * Params:
   *   paintable = a `GdkPaintable`
   */
  void setFromPaintable(gdk.paintable.Paintable paintable)
  {
    gtk_image_set_from_paintable(cast(GtkImage*)cPtr, paintable ? cast(GdkPaintable*)(cast(ObjectG)paintable).cPtr(No.Dup) : null);
  }

  /**
   * Sets a `GtkImage` to show a `GdkPixbuf`.
   * See [gtk.image.Image.newFromPixbuf] for details.
   * Note: This is a helper for [gtk.image.Image.setFromPaintable],
   * and you can't get back the exact pixbuf once this is called,
   * only a paintable.
   * Params:
   *   pixbuf = a `GdkPixbuf` or `NULL`

   * Deprecated: Use [gtk.image.Image.setFromPaintable] instead
   */
  void setFromPixbuf(gdkpixbuf.pixbuf.Pixbuf pixbuf)
  {
    gtk_image_set_from_pixbuf(cast(GtkImage*)cPtr, pixbuf ? cast(PixbufC*)pixbuf.cPtr(No.Dup) : null);
  }

  /**
   * Sets a `GtkImage` to show a resource.
   * See [gtk.image.Image.newFromResource] for details.
   * Params:
   *   resourcePath = a resource path
   */
  void setFromResource(string resourcePath)
  {
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    gtk_image_set_from_resource(cast(GtkImage*)cPtr, _resourcePath);
  }

  /**
   * Suggests an icon size to the theme for named icons.
   * Params:
   *   iconSize = the new icon size
   */
  void setIconSize(gtk.types.IconSize iconSize)
  {
    gtk_image_set_icon_size(cast(GtkImage*)cPtr, iconSize);
  }

  /**
   * Sets the pixel size to use for named icons.
   * If the pixel size is set to a value !\= -1, it is used instead
   * of the icon size set by [gtk.image.Image.setFromIconName].
   * Params:
   *   pixelSize = the new pixel size
   */
  void setPixelSize(int pixelSize)
  {
    gtk_image_set_pixel_size(cast(GtkImage*)cPtr, pixelSize);
  }
}
