module gtk.color_chooser_widget;

import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.color_chooser;
import gtk.color_chooser_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    The [gtk.color_chooser_widget.ColorChooserWidget] widget lets the user select a color.
  
  By default, the chooser presents a predefined palette of colors,
  plus a small number of settable custom colors. It is also possible
  to select a different color with the single-color editor.
  
  To enter the single-color editing mode, use the context menu of any
  color of the palette, or use the '+' button to add a new custom color.
  
  The chooser automatically remembers the last selection, as well
  as custom colors.
  
  To create a [gtk.color_chooser_widget.ColorChooserWidget], use [gtk.color_chooser_widget.ColorChooserWidget.new_].
  
  To change the initially selected color, use
  [gtk.color_chooser.ColorChooser.setRgba]. To get the selected color use
  [gtk.color_chooser.ColorChooser.getRgba].
  
  The [gtk.color_chooser_widget.ColorChooserWidget] is used in the [gtk.color_chooser_dialog.ColorChooserDialog]
  to provide a dialog for selecting colors.
  
  # CSS names
  
  [gtk.color_chooser_widget.ColorChooserWidget] has a single CSS node with name colorchooser.

  Deprecated:     Direct use of [gtk.color_chooser_widget.ColorChooserWidget] is deprecated.
*/
class ColorChooserWidget : gtk.widget.Widget, gtk.color_chooser.ColorChooser
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_color_chooser_widget_get_type != &gidSymbolNotFound ? gtk_color_chooser_widget_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ColorChooserT!();

  /**
      Creates a new [gtk.color_chooser_widget.ColorChooserWidget].
    Returns:     a new [gtk.color_chooser_widget.ColorChooserWidget]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_color_chooser_widget_new();
    this(_cretval, No.Take);
  }
}
