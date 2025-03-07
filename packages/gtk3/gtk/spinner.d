module gtk.spinner;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    A GtkSpinner widget displays an icon-size spinning animation.
  It is often used as an alternative to a #GtkProgressBar for
  displaying indefinite activity, instead of actual progress.
  
  To start the animation, use [gtk.spinner.Spinner.start], to stop it
  use [gtk.spinner.Spinner.stop].
  
  # CSS nodes
  
  GtkSpinner has a single CSS node with the name spinner. When the animation is
  active, the :checked pseudoclass is added to this node.
*/
class Spinner : gtk.widget.Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_spinner_get_type != &gidSymbolNotFound ? gtk_spinner_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Returns a new spinner widget. Not yet started.
    Returns:     a new #GtkSpinner
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_spinner_new();
    this(_cretval, No.Take);
  }

  /**
      Starts the animation of the spinner.
  */
  void start()
  {
    gtk_spinner_start(cast(GtkSpinner*)cPtr);
  }

  /**
      Stops the animation of the spinner.
  */
  void stop()
  {
    gtk_spinner_stop(cast(GtkSpinner*)cPtr);
  }
}
