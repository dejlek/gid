module Pango.Fontset;

import GObject.ObjectG;
import Gid.gid;
import Pango.Font;
import Pango.FontMetrics;
import Pango.Types;
import Pango.c.functions;
import Pango.c.types;

/**
 * A `PangoFontset` represents a set of `PangoFont` to use when rendering text.
 * A `PangoFontset` is the result of resolving a `PangoFontDescription`
 * against a particular `PangoContext`. It has operations for finding the
 * component font for a particular Unicode character, and for finding a
 * composite set of metrics for the entire fontset.
 */
class Fontset : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())pango_fontset_get_type != &gidSymbolNotFound ? pango_fontset_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Iterates through all the fonts in a fontset, calling func for
   * each one.
   * If func returns %TRUE, that stops the iteration.
   * Params:
   *   func = Callback function
   */
  void foreach_(FontsetForeachFunc func)
  {
    extern(C) bool _funcCallback(PangoFontset* fontset, PangoFont* font, void* userData)
    {
      auto _dlg = cast(FontsetForeachFunc*)userData;

      bool _retval = (*_dlg)(ObjectG.getDObject!Fontset(cast(void*)fontset, No.Take), ObjectG.getDObject!Font(cast(void*)font, No.Take));
      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? cast(void*)&(func) : null;
    pango_fontset_foreach(cast(PangoFontset*)cPtr, _funcCB, _func);
  }

  /**
   * Returns the font in the fontset that contains the best
   * glyph for a Unicode character.
   * Params:
   *   wc = a Unicode character
   * Returns: a `PangoFont`
   */
  Font getFont(uint wc)
  {
    PangoFont* _cretval;
    _cretval = pango_fontset_get_font(cast(PangoFontset*)cPtr, wc);
    auto _retval = ObjectG.getDObject!Font(cast(PangoFont*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Get overall metric information for the fonts in the fontset.
   * Returns: a `PangoFontMetrics` object
   */
  FontMetrics getMetrics()
  {
    PangoFontMetrics* _cretval;
    _cretval = pango_fontset_get_metrics(cast(PangoFontset*)cPtr);
    auto _retval = _cretval ? new FontMetrics(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
