module gtk.text_appearance;

import gdk.color;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class TextAppearance
{
  GtkTextAppearance cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.TextAppearance");

    cInstance = *cast(GtkTextAppearance*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gdk.color.Color bgColor()
  {
    return new gdk.color.Color(cast(GdkColor*)&(cast(GtkTextAppearance*)cPtr).bgColor);
  }

  @property gdk.color.Color fgColor()
  {
    return new gdk.color.Color(cast(GdkColor*)&(cast(GtkTextAppearance*)cPtr).fgColor);
  }

  @property int rise()
  {
    return (cast(GtkTextAppearance*)cPtr).rise;
  }

  @property void rise(int propval)
  {
    (cast(GtkTextAppearance*)cPtr).rise = propval;
  }

  @property uint underline()
  {
    return (cast(GtkTextAppearance*)cPtr).underline;
  }

  @property void underline(uint propval)
  {
    (cast(GtkTextAppearance*)cPtr).underline = propval;
  }

  @property uint strikethrough()
  {
    return (cast(GtkTextAppearance*)cPtr).strikethrough;
  }

  @property void strikethrough(uint propval)
  {
    (cast(GtkTextAppearance*)cPtr).strikethrough = propval;
  }

  @property uint drawBg()
  {
    return (cast(GtkTextAppearance*)cPtr).drawBg;
  }

  @property void drawBg(uint propval)
  {
    (cast(GtkTextAppearance*)cPtr).drawBg = propval;
  }

  @property uint insideSelection()
  {
    return (cast(GtkTextAppearance*)cPtr).insideSelection;
  }

  @property void insideSelection(uint propval)
  {
    (cast(GtkTextAppearance*)cPtr).insideSelection = propval;
  }

  @property uint isText()
  {
    return (cast(GtkTextAppearance*)cPtr).isText;
  }

  @property void isText(uint propval)
  {
    (cast(GtkTextAppearance*)cPtr).isText = propval;
  }
}
