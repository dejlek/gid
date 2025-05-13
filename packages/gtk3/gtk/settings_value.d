/// Module for [SettingsValue] class
module gtk.settings_value;

import gid.gid;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class SettingsValue
{
  GtkSettingsValue cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gtk.settings_value.SettingsValue");

    cInstance = *cast(GtkSettingsValue*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `origin` field.
      Returns: Origin should be something like “filename:linenumber” for
         rc files, or e.g. “XProperty” for other sources.
  */
  @property string origin()
  {
    return cToD!(string)(cast(void*)(cast(GtkSettingsValue*)this._cPtr).origin);
  }

  /**
      Set `origin` field.
      Params:
        propval = Origin should be something like “filename:linenumber” for
           rc files, or e.g. “XProperty” for other sources.
  */
  @property void origin(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkSettingsValue*)this._cPtr).origin);
    dToC(propval, cast(void*)&(cast(GtkSettingsValue*)this._cPtr).origin);
  }

  /**
      Get `value` field.
      Returns: Valid types are LONG, DOUBLE and STRING corresponding to
         the token parsed, or a GSTRING holding an unparsed statement
  */
  @property gobject.value.Value value()
  {
    return cToD!(gobject.value.Value)(cast(void*)&(cast(GtkSettingsValue*)this._cPtr).value);
  }
}
