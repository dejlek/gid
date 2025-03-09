module adw.avatar;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gdk.paintable;
import gdk.texture;
import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A widget displaying an image, with a generated fallback.
  
  <picture>
    <source srcset="avatar-dark.png" media="(prefers-color-scheme: dark)">
    <img src="avatar.png" alt="avatar">
  </picture>
  
  [adw.avatar.Avatar] is a widget that shows a round avatar.
  
  [adw.avatar.Avatar] generates an avatar with the initials of  the
  `property@Avatar:text` on top of a colored background.
  
  The color is picked based on the hash of the `property@Avatar:text`.
  
  If `property@Avatar:show-initials` is set to `FALSE`,
  `property@Avatar:icon-name` or `avatar-default-symbolic` is shown instead of
  the initials.
  
  Use `property@Avatar:custom-image` to set a custom image.
  
  ## CSS nodes
  
  [adw.avatar.Avatar] has a single CSS node with name `avatar`.
*/
class Avatar : gtk.widget.Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_avatar_get_type != &gidSymbolNotFound ? adw_avatar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new [adw.avatar.Avatar].
    Params:
      size =       The size of the avatar
      text =       the text used to get the initials and color
      showInitials =       whether to use initials instead of an icon as fallback
    Returns:     the newly created [adw.avatar.Avatar]
  */
  this(int size, string text, bool showInitials)
  {
    GtkWidget* _cretval;
    const(char)* _text = text.toCString(No.Alloc);
    _cretval = adw_avatar_new(size, _text, showInitials);
    this(_cretval, No.Take);
  }

  /**
      Renders self into a [gdk.texture.Texture] at scale_factor.
    
    This can be used to export the fallback avatar.
    Params:
      scaleFactor =       The scale factor
    Returns:     the texture
  */
  gdk.texture.Texture drawToTexture(int scaleFactor)
  {
    GdkTexture* _cretval;
    _cretval = adw_avatar_draw_to_texture(cast(AdwAvatar*)cPtr, scaleFactor);
    auto _retval = ObjectG.getDObject!(gdk.texture.Texture)(cast(GdkTexture*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the custom image paintable.
    Returns:     the custom image
  */
  gdk.paintable.Paintable getCustomImage()
  {
    GdkPaintable* _cretval;
    _cretval = adw_avatar_get_custom_image(cast(AdwAvatar*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.paintable.Paintable)(cast(GdkPaintable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the name of an icon to use as a fallback.
    Returns:     the icon name
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = adw_avatar_get_icon_name(cast(AdwAvatar*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether initials are used instead of an icon on the fallback avatar.
    Returns:     whether initials are used instead of an icon as fallback
  */
  bool getShowInitials()
  {
    bool _retval;
    _retval = adw_avatar_get_show_initials(cast(AdwAvatar*)cPtr);
    return _retval;
  }

  alias getSize = gtk.widget.Widget.getSize;

  /**
      Gets the size of the avatar.
    Returns:     the size of the avatar
  */
  int getSize()
  {
    int _retval;
    _retval = adw_avatar_get_size(cast(AdwAvatar*)cPtr);
    return _retval;
  }

  /**
      Gets the text used to generate the fallback initials and color.
    Returns:     the text used to generate the fallback initials and
        color
  */
  string getText()
  {
    const(char)* _cretval;
    _cretval = adw_avatar_get_text(cast(AdwAvatar*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets the custom image paintable.
    
    Custom image is displayed instead of initials or icon.
    Params:
      customImage =       a custom image
  */
  void setCustomImage(gdk.paintable.Paintable customImage = null)
  {
    adw_avatar_set_custom_image(cast(AdwAvatar*)cPtr, customImage ? cast(GdkPaintable*)(cast(ObjectG)customImage).cPtr(No.Dup) : null);
  }

  /**
      Sets the name of an icon to use as a fallback.
    
    If no name is set, `avatar-default-symbolic` will be used.
    Params:
      iconName =       the icon name
  */
  void setIconName(string iconName = null)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    adw_avatar_set_icon_name(cast(AdwAvatar*)cPtr, _iconName);
  }

  /**
      Sets whether to use initials instead of an icon on the fallback avatar.
    
    See `propertyAvatar:icon-name` for how to change the fallback icon.
    Params:
      showInitials =       whether to use initials instead of an icon as fallback
  */
  void setShowInitials(bool showInitials)
  {
    adw_avatar_set_show_initials(cast(AdwAvatar*)cPtr, showInitials);
  }

  /**
      Sets the size of the avatar.
    Params:
      size =       The size of the avatar
  */
  void setSize(int size)
  {
    adw_avatar_set_size(cast(AdwAvatar*)cPtr, size);
  }

  /**
      Sets the text used to generate the fallback initials and color.
    
    It's only used to generate the color if `propertyAvatar:show-initials` is
    `FALSE`.
    Params:
      text =       the text used to get the initials and color
  */
  void setText(string text = null)
  {
    const(char)* _text = text.toCString(No.Alloc);
    adw_avatar_set_text(cast(AdwAvatar*)cPtr, _text);
  }
}
