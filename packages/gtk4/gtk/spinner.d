module gtk.spinner;

import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
 * A `GtkSpinner` widget displays an icon-size spinning animation.
 * It is often used as an alternative to a [Gtk.ProgressBar]
 * for displaying indefinite activity, instead of actual progress.
 * ![An example GtkSpinner](spinner.png)
 * To start the animation, use [Gtk.Spinner.start], to stop it
 * use [Gtk.Spinner.stop].
 * # CSS nodes
 * `GtkSpinner` has a single CSS node with the name spinner.
 * When the animation is active, the :checked pseudoclass is
 * added to this node.
 */
class Spinner : Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_spinner_get_type != &gidSymbolNotFound ? gtk_spinner_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Returns a new spinner widget. Not yet started.
   * Returns: a new `GtkSpinner`
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_spinner_new();
    this(_cretval, No.Take);
  }

  /**
   * Returns whether the spinner is spinning.
   * Returns: %TRUE if the spinner is active
   */
  bool getSpinning()
  {
    bool _retval;
    _retval = gtk_spinner_get_spinning(cast(GtkSpinner*)cPtr);
    return _retval;
  }

  /**
   * Sets the activity of the spinner.
   * Params:
   *   spinning = whether the spinner should be spinning
   */
  void setSpinning(bool spinning)
  {
    gtk_spinner_set_spinning(cast(GtkSpinner*)cPtr, spinning);
  }

  /**
   * Starts the animation of the spinner.
   */
  void start()
  {
    gtk_spinner_start(cast(GtkSpinner*)cPtr);
  }

  /**
   * Stops the animation of the spinner.
   */
  void stop()
  {
    gtk_spinner_stop(cast(GtkSpinner*)cPtr);
  }
}
