module gdk.popup;

public import gdk.popup_iface_proxy;
import gdk.c.functions;
import gdk.c.types;
import gdk.popup_layout;
import gdk.surface;
import gdk.types;
import gid.gid;
import gobject.object;

/**
 * A `GdkPopup` is a surface that is attached to another surface.
 * The `GdkPopup` is positioned relative to its parent surface.
 * `GdkPopup`s are typically used to implement menus and similar popups.
 * They can be modal, which is indicated by the [Gdk.Popup.autohide]
 * property.
 */
interface Popup
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_popup_get_type != &gidSymbolNotFound ? gdk_popup_get_type() : cast(GType)0;
  }

  /**
   * Returns whether this popup is set to hide on outside clicks.
   * Returns: %TRUE if popup will autohide
   */
  bool getAutohide();

  /**
   * Returns the parent surface of a popup.
   * Returns: the parent surface
   */
  Surface getParent();

  /**
   * Obtains the position of the popup relative to its parent.
   * Returns: the X coordinate of popup position
   */
  int getPositionX();

  /**
   * Obtains the position of the popup relative to its parent.
   * Returns: the Y coordinate of popup position
   */
  int getPositionY();

  /**
   * Gets the current popup rectangle anchor.
   * The value returned may change after calling [Gdk.Popup.present],
   * or after the [Gdk.Surface.layout] signal is emitted.
   * Returns: the current rectangle anchor value of popup
   */
  Gravity getRectAnchor();

  /**
   * Gets the current popup surface anchor.
   * The value returned may change after calling [Gdk.Popup.present],
   * or after the [Gdk.Surface.layout] signal is emitted.
   * Returns: the current surface anchor value of popup
   */
  Gravity getSurfaceAnchor();

  /**
   * Present popup after having processed the `GdkPopupLayout` rules.
   * If the popup was previously now showing, it will be showed,
   * otherwise it will change position according to layout.
   * After calling this function, the result should be handled in response
   * to the [Gdk.Surface.layout] signal being emitted. The resulting
   * popup position can be queried using [Gdk.Popup.getPositionX],
   * [Gdk.Popup.getPositionY], and the resulting size will be sent as
   * parameters in the layout signal. Use [Gdk.Popup.getRectAnchor]
   * and [Gdk.Popup.getSurfaceAnchor] to get the resulting anchors.
   * Presenting may fail, for example if the popup is set to autohide
   * and is immediately hidden upon being presented. If presenting failed,
   * the [Gdk.Surface.layout] signal will not me emitted.
   * Params:
   *   width = the unconstrained popup width to layout
   *   height = the unconstrained popup height to layout
   *   layout = the `GdkPopupLayout` object used to layout
   * Returns: %FALSE if it failed to be presented, otherwise %TRUE.
   */
  bool present(int width, int height, PopupLayout layout);
}
