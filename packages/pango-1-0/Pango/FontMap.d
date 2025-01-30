module Pango.FontMap;

import GObject.ObjectG;
import Gid.gid;
import Gio.ListModel;
import Gio.ListModelT;
import Pango.Context;
import Pango.Font;
import Pango.FontDescription;
import Pango.FontFamily;
import Pango.Fontset;
import Pango.PgLanguage;
import Pango.Types;
import Pango.c.functions;
import Pango.c.types;

/**
 * A `PangoFontMap` represents the set of fonts available for a
 * particular rendering system.
 * This is a virtual object with implementations being specific to
 * particular rendering systems.
 */
class FontMap : ObjectG, ListModel
{

  this()
  {
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return pango_font_map_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ListModelT!();

  /**
   * Forces a change in the context, which will cause any `PangoContext`
   * using this fontmap to change.
   * This function is only useful when implementing a new backend
   * for Pango, something applications won't do. Backends should
   * call this function if they have attached extra data to the
   * context and such data is changed.
   */
  void changed()
  {
    pango_font_map_changed(cast(PangoFontMap*)cPtr);
  }

  /**
   * Creates a `PangoContext` connected to fontmap.
   * This is equivalent to [Pango.Context.new_] followed by
   * [Pango.Context.setFontMap].
   * If you are using Pango as part of a higher-level system,
   * that system may have it's own way of create a `PangoContext`.
   * For instance, the GTK toolkit has, among others,
   * [Gtk.Widget.getPangoContext]. Use those instead.
   * Returns: the newly allocated `PangoContext`,
   *   which should be freed with [GObject.ObjectG.unref].
   */
  Context createContext()
  {
    PangoContext* _cretval;
    _cretval = pango_font_map_create_context(cast(PangoFontMap*)cPtr);
    auto _retval = ObjectG.getDObject!Context(cast(PangoContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Gets a font family by name.
   * Params:
   *   name = a family name
   * Returns: the `PangoFontFamily`
   */
  FontFamily getFamily(string name)
  {
    PangoFontFamily* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = pango_font_map_get_family(cast(PangoFontMap*)cPtr, _name);
    auto _retval = ObjectG.getDObject!FontFamily(cast(PangoFontFamily*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns the current serial number of fontmap.
   * The serial number is initialized to an small number larger than zero
   * when a new fontmap is created and is increased whenever the fontmap
   * is changed. It may wrap, but will never have the value 0. Since it can
   * wrap, never compare it with "less than", always use "not equals".
   * The fontmap can only be changed using backend-specific API, like changing
   * fontmap resolution.
   * This can be used to automatically detect changes to a `PangoFontMap`,
   * like in `PangoContext`.
   * Returns: The current serial number of fontmap.
   */
  uint getSerial()
  {
    uint _retval;
    _retval = pango_font_map_get_serial(cast(PangoFontMap*)cPtr);
    return _retval;
  }

  /**
   * List all families for a fontmap.
   * Note that the returned families are not in any particular order.
   * `PangoFontMap` also implemented the [Gio.ListModel] interface
   * for enumerating families.
   * Params:
   *   families = location to
   *     store a pointer to an array of `PangoFontFamily` *.
   *     This array should be freed with [GLib.Global.gfree].
   */
  void listFamilies(out FontFamily[] families)
  {
    int _nFamilies;
    PangoFontFamily** _families;
    pango_font_map_list_families(cast(PangoFontMap*)cPtr, &_families, &_nFamilies);
    families.length = _nFamilies;
    foreach (i; 0 .. _nFamilies)
      families[i] = ObjectG.getDObject!FontFamily(_families[i], No.Take);
    safeFree(cast(void*)_families);
  }

  /**
   * Load the font in the fontmap that is the closest match for desc.
   * Params:
   *   context = the `PangoContext` the font will be used with
   *   desc = a `PangoFontDescription` describing the font to load
   * Returns: the newly allocated `PangoFont`
   *   loaded, or %NULL if no font matched.
   */
  Font loadFont(Context context, FontDescription desc)
  {
    PangoFont* _cretval;
    _cretval = pango_font_map_load_font(cast(PangoFontMap*)cPtr, context ? cast(PangoContext*)context.cPtr(No.Dup) : null, desc ? cast(PangoFontDescription*)desc.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!Font(cast(PangoFont*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Load a set of fonts in the fontmap that can be used to render
   * a font matching desc.
   * Params:
   *   context = the `PangoContext` the font will be used with
   *   desc = a `PangoFontDescription` describing the font to load
   *   language = a `PangoLanguage` the fonts will be used for
   * Returns: the newly allocated
   *   `PangoFontset` loaded, or %NULL if no font matched.
   */
  Fontset loadFontset(Context context, FontDescription desc, PgLanguage language)
  {
    PangoFontset* _cretval;
    _cretval = pango_font_map_load_fontset(cast(PangoFontMap*)cPtr, context ? cast(PangoContext*)context.cPtr(No.Dup) : null, desc ? cast(PangoFontDescription*)desc.cPtr(No.Dup) : null, language ? cast(PangoLanguage*)language.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!Fontset(cast(PangoFontset*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Returns a new font that is like font, except that its size
   * is multiplied by scale, its backend-dependent configuration
   * $(LPAREN)e.g. cairo font options$(RPAREN) is replaced by the one in context,
   * and its variations are replaced by variations.
   * Params:
   *   font = a font in fontmap
   *   scale = the scale factor to apply
   *   context = a `PangoContext`
   *   variations = font variations to use
   * Returns: the modified font
   */
  Font reloadFont(Font font, double scale, Context context, string variations)
  {
    PangoFont* _cretval;
    const(char)* _variations = variations.toCString(No.Alloc);
    _cretval = pango_font_map_reload_font(cast(PangoFontMap*)cPtr, font ? cast(PangoFont*)font.cPtr(No.Dup) : null, scale, context ? cast(PangoContext*)context.cPtr(No.Dup) : null, _variations);
    auto _retval = ObjectG.getDObject!Font(cast(PangoFont*)_cretval, Yes.Take);
    return _retval;
  }
}
