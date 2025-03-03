module gio.icon;

public import gio.icon_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import glib.error;
import glib.variant;
import gobject.object;

/**
 * `GIcon` is a very minimal interface for icons. It provides functions
 * for checking the equality of two icons, hashing of icons and
 * serializing an icon to and from strings.
 * `GIcon` does not provide the actual pixmap for the icon as this is out
 * of GIO's scope, however implementations of `GIcon` may contain the name
 * of an icon $(LPAREN)see [gio.themed_icon.ThemedIcon]$(RPAREN), or the path to an icon
 * $(LPAREN)see [gio.loadable_icon.LoadableIcon]$(RPAREN).
 * To obtain a hash of a `GIcon`, see [gio.icon.Icon.hash].
 * To check if two `GIcon`s are equal, see [gio.icon.Icon.equal].
 * For serializing a `GIcon`, use [gio.icon.Icon.serialize] and
 * [gio.icon.Icon.deserialize].
 * If you want to consume `GIcon` $(LPAREN)for example, in a toolkit$(RPAREN) you must
 * be prepared to handle at least the three following cases:
 * [gio.loadable_icon.LoadableIcon], [gio.themed_icon.ThemedIcon] and [gio.emblemed_icon.EmblemedIcon].
 * It may also make sense to have fast-paths for other cases $(LPAREN)like handling
 * [`GdkPixbuf`](https://docs.gtk.org/gdk-pixbuf/class.Pixbuf.html) directly,
 * for example$(RPAREN) but all compliant `GIcon` implementations outside of GIO must
 * implement [gio.loadable_icon.LoadableIcon].
 * If your application or library provides one or more `GIcon`
 * implementations you need to ensure that your new implementation also
 * implements [gio.loadable_icon.LoadableIcon].  Additionally, you must provide an
 * implementation of [gio.icon.Icon.serialize] that gives a result that is
 * understood by [gio.icon.Icon.deserialize], yielding one of the built-in
 * icon types.
 */
interface Icon
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_icon_get_type != &gidSymbolNotFound ? g_icon_get_type() : cast(GType)0;
  }

  /**
   * Deserializes a #GIcon previously serialized using [gio.icon.Icon.serialize].
   * Params:
   *   value = a #GVariant created with [gio.icon.Icon.serialize]
   * Returns: a #GIcon, or %NULL when deserialization fails.
   */
  static gio.icon.Icon deserialize(glib.variant.VariantG value)
  {
    GIcon* _cretval;
    _cretval = g_icon_deserialize(value ? cast(VariantC*)value.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Generate a #GIcon instance from str. This function can fail if
   * str is not valid - see [gio.icon.Icon.toString_] for discussion.
   * If your application or library provides one or more #GIcon
   * implementations you need to ensure that each #GType is registered
   * with the type system prior to calling [gio.icon.Icon.newForString].
   * Params:
   *   str = A string obtained via [gio.icon.Icon.toString_].
   * Returns: An object implementing the #GIcon
   *   interface or %NULL if error is set.
   */
  static gio.icon.Icon newForString(string str)
  {
    GIcon* _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    GError *_err;
    _cretval = g_icon_new_for_string(_str, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Checks if two icons are equal.
   * Params:
   *   icon2 = pointer to the second #GIcon.
   * Returns: %TRUE if icon1 is equal to icon2. %FALSE otherwise.
   */
  bool equal(gio.icon.Icon icon2 = null);

  /**
   * Gets a hash for an icon.
   * Returns: a #guint containing a hash for the icon, suitable for
   *   use in a #GHashTable or similar data structure.
   */
  uint hash();

  /**
   * Serializes a #GIcon into a #GVariant. An equivalent #GIcon can be retrieved
   * back by calling [gio.icon.Icon.deserialize] on the returned value.
   * As serialization will avoid using raw icon data when possible, it only
   * makes sense to transfer the #GVariant between processes on the same machine,
   * $(LPAREN)as opposed to over the network$(RPAREN), and within the same file system namespace.
   * Returns: a #GVariant, or %NULL when serialization fails. The #GVariant will not be floating.
   */
  glib.variant.VariantG serialize();

  /**
   * Generates a textual representation of icon that can be used for
   * serialization such as when passing icon to a different process or
   * saving it to persistent storage. Use [gio.icon.Icon.newForString] to
   * get icon back from the returned string.
   * The encoding of the returned string is proprietary to #GIcon except
   * in the following two cases
   * - If icon is a #GFileIcon, the returned string is a native path
   * $(LPAREN)such as `/path/to/my icon.png`$(RPAREN) without escaping
   * if the #GFile for icon is a native file.  If the file is not
   * native, the returned string is the result of [gio.file.File.getUri]
   * $(LPAREN)such as `sftp://path/to/my%20icon.png`$(RPAREN).
   * - If icon is a #GThemedIcon with exactly one name and no fallbacks,
   * the encoding is simply the name $(LPAREN)such as `network-server`$(RPAREN).
   * Returns: An allocated NUL-terminated UTF8 string or
   *   %NULL if icon can't be serialized. Use [glib.global.gfree] to free.
   */
  string toString_();
}
