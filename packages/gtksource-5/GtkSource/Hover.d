module GtkSource.Hover;

import GObject.ObjectG;
import Gid.gid;
import GtkSource.HoverProvider;
import GtkSource.HoverProviderT;
import GtkSource.Types;
import GtkSource.c.functions;
import GtkSource.c.types;

/**
 * Interactive tooltips.
 * `GtkSourceHover` allows a class@View to provide contextual information.
 * When enabled, if the user hovers over a word in the text editor, a series
 * of registered iface@HoverProvider can populate a class@HoverDisplay
 * with useful information.
 * To enable call [GtkSource.View.getHover] and add iface@HoverProvider
 * using [GtkSource.Hover.addProvider]. To disable, remove all registered
 * providers with [GtkSource.Hover.removeProvider].
 * You can change how long to wait to display the interactive tooltip by
 * setting the property@Hover:hover-delay property in milliseconds.
 */
class Hover : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_hover_get_type != &gidSymbolNotFound ? gtk_source_hover_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  void addProvider(HoverProvider provider)
  {
    gtk_source_hover_add_provider(cast(GtkSourceHover*)cPtr, provider ? cast(GtkSourceHoverProvider*)(cast(ObjectG)provider).cPtr(No.Dup) : null);
  }

  void removeProvider(HoverProvider provider)
  {
    gtk_source_hover_remove_provider(cast(GtkSourceHover*)cPtr, provider ? cast(GtkSourceHoverProvider*)(cast(ObjectG)provider).cPtr(No.Dup) : null);
  }
}
