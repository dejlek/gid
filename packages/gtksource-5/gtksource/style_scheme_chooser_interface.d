module gtksource.style_scheme_chooser_interface;

import gid.gid;
import gobject.type_interface;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

class StyleSchemeChooserInterface
{
  GtkSourceStyleSchemeChooserInterface cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GtkSource.StyleSchemeChooserInterface");

    cInstance = *cast(GtkSourceStyleSchemeChooserInterface*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TypeInterface baseInterface()
  {
    return new TypeInterface(cast(GTypeInterface*)&(cast(GtkSourceStyleSchemeChooserInterface*)cPtr).baseInterface);
  }

  alias GetStyleSchemeFuncType = extern(C) GtkSourceStyleScheme* function(GtkSourceStyleSchemeChooser* chooser);

  @property GetStyleSchemeFuncType getStyleScheme()
  {
    return (cast(GtkSourceStyleSchemeChooserInterface*)cPtr).getStyleScheme;
  }

  alias SetStyleSchemeFuncType = extern(C) void function(GtkSourceStyleSchemeChooser* chooser, GtkSourceStyleScheme* scheme);

  @property SetStyleSchemeFuncType setStyleScheme()
  {
    return (cast(GtkSourceStyleSchemeChooserInterface*)cPtr).setStyleScheme;
  }
}
