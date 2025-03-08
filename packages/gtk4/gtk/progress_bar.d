module gtk.progress_bar;

import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.accessible_range;
import gtk.accessible_range_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;
import pango.types;

/**
    [gtk.progress_bar.ProgressBar] is typically used to display the progress of a long
  running operation.
  
  It provides a visual clue that processing is underway. [gtk.progress_bar.ProgressBar]
  can be used in two different modes: percentage mode and activity mode.
  
  ![An example GtkProgressBar](progressbar.png)
  
  When an application can determine how much work needs to take place
  (e.g. read a fixed number of bytes from a file) and can monitor its
  progress, it can use the [gtk.progress_bar.ProgressBar] in percentage mode and the
  user sees a growing bar indicating the percentage of the work that
  has been completed. In this mode, the application is required to call
  [gtk.progress_bar.ProgressBar.setFraction] periodically to update the progress bar.
  
  When an application has no accurate way of knowing the amount of work
  to do, it can use the [gtk.progress_bar.ProgressBar] in activity mode, which shows
  activity by a block moving back and forth within the progress area. In
  this mode, the application is required to call [gtk.progress_bar.ProgressBar.pulse]
  periodically to update the progress bar.
  
  There is quite a bit of flexibility provided to control the appearance
  of the [gtk.progress_bar.ProgressBar]. Functions are provided to control the orientation
  of the bar, optional text can be displayed along with the bar, and the
  step size used in activity mode can be set.
  
  # CSS nodes
  
  ```
  progressbar[.osd]
  ├── [text]
  ╰── trough[.empty][.full]
      ╰── progress[.pulse]
  ```
  
  [gtk.progress_bar.ProgressBar] has a main CSS node with name progressbar and subnodes with
  names text and trough, of which the latter has a subnode named progress. The
  text subnode is only present if text is shown. The progress subnode has the
  style class .pulse when in activity mode. It gets the style classes .left,
  .right, .top or .bottom added when the progress 'touches' the corresponding
  end of the GtkProgressBar. The .osd class on the progressbar node is for use
  in overlays like the one Epiphany has for page loading progress.
  
  # Accessibility
  
  [gtk.progress_bar.ProgressBar] uses the [gtk.types.AccessibleRole.progressBar] role.
*/
class ProgressBar : gtk.widget.Widget, gtk.accessible_range.AccessibleRange, gtk.orientable.Orientable
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_progress_bar_get_type != &gidSymbolNotFound ? gtk_progress_bar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin AccessibleRangeT!();
  mixin OrientableT!();

  /**
      Creates a new [gtk.progress_bar.ProgressBar].
    Returns:     a [gtk.progress_bar.ProgressBar].
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_progress_bar_new();
    this(_cretval, No.take);
  }

  /**
      Returns the ellipsizing position of the progress bar.
    
    See [gtk.progress_bar.ProgressBar.setEllipsize].
    Returns:     [pango.types.EllipsizeMode]
  */
  pango.types.EllipsizeMode getEllipsize()
  {
    PangoEllipsizeMode _cretval;
    _cretval = gtk_progress_bar_get_ellipsize(cast(GtkProgressBar*)cPtr);
    pango.types.EllipsizeMode _retval = cast(pango.types.EllipsizeMode)_cretval;
    return _retval;
  }

  /**
      Returns the current fraction of the task that’s been completed.
    Returns:     a fraction from 0.0 to 1.0
  */
  double getFraction()
  {
    double _retval;
    _retval = gtk_progress_bar_get_fraction(cast(GtkProgressBar*)cPtr);
    return _retval;
  }

  /**
      Returns whether the progress bar is inverted.
    Returns:     true if the progress bar is inverted
  */
  bool getInverted()
  {
    bool _retval;
    _retval = gtk_progress_bar_get_inverted(cast(GtkProgressBar*)cPtr);
    return _retval;
  }

  /**
      Retrieves the pulse step.
    
    See [gtk.progress_bar.ProgressBar.setPulseStep].
    Returns:     a fraction from 0.0 to 1.0
  */
  double getPulseStep()
  {
    double _retval;
    _retval = gtk_progress_bar_get_pulse_step(cast(GtkProgressBar*)cPtr);
    return _retval;
  }

  /**
      Returns whether the [gtk.progress_bar.ProgressBar] shows text.
    
    See [gtk.progress_bar.ProgressBar.setShowText].
    Returns:     true if text is shown in the progress bar
  */
  bool getShowText()
  {
    bool _retval;
    _retval = gtk_progress_bar_get_show_text(cast(GtkProgressBar*)cPtr);
    return _retval;
  }

  /**
      Retrieves the text that is displayed with the progress bar.
    
    The return value is a reference to the text, not a copy of it,
    so will become invalid if you change the text in the progress bar.
    Returns:     the text
  */
  string getText()
  {
    const(char)* _cretval;
    _cretval = gtk_progress_bar_get_text(cast(GtkProgressBar*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Indicates that some progress has been made, but you don’t know how much.
    
    Causes the progress bar to enter “activity mode,” where a block
    bounces back and forth. Each call to [gtk.progress_bar.ProgressBar.pulse]
    causes the block to move by a little bit (the amount of movement
    per pulse is determined by [gtk.progress_bar.ProgressBar.setPulseStep]).
  */
  void pulse()
  {
    gtk_progress_bar_pulse(cast(GtkProgressBar*)cPtr);
  }

  /**
      Sets the mode used to ellipsize the text.
    
    The text is ellipsized if there is not enough space
    to render the entire string.
    Params:
      mode =       a [pango.types.EllipsizeMode]
  */
  void setEllipsize(pango.types.EllipsizeMode mode)
  {
    gtk_progress_bar_set_ellipsize(cast(GtkProgressBar*)cPtr, mode);
  }

  /**
      Causes the progress bar to “fill in” the given fraction
    of the bar.
    
    The fraction should be between 0.0 and 1.0, inclusive.
    Params:
      fraction =       fraction of the task that’s been completed
  */
  void setFraction(double fraction)
  {
    gtk_progress_bar_set_fraction(cast(GtkProgressBar*)cPtr, fraction);
  }

  /**
      Sets whether the progress bar is inverted.
    
    Progress bars normally grow from top to bottom or left to right.
    Inverted progress bars grow in the opposite direction.
    Params:
      inverted =       true to invert the progress bar
  */
  void setInverted(bool inverted)
  {
    gtk_progress_bar_set_inverted(cast(GtkProgressBar*)cPtr, inverted);
  }

  /**
      Sets the fraction of total progress bar length to move the
    bouncing block.
    
    The bouncing block is moved when [gtk.progress_bar.ProgressBar.pulse]
    is called.
    Params:
      fraction =       fraction between 0.0 and 1.0
  */
  void setPulseStep(double fraction)
  {
    gtk_progress_bar_set_pulse_step(cast(GtkProgressBar*)cPtr, fraction);
  }

  /**
      Sets whether the progress bar will show text next to the bar.
    
    The shown text is either the value of the [gtk.progress_bar.ProgressBar.utf8]
    property or, if that is null, the [gtk.progress_bar.ProgressBar.gdouble] value,
    as a percentage.
    
    To make a progress bar that is styled and sized suitably for containing
    text (even if the actual text is blank), set `propertyGtk.ProgressBar:show-text`
    to true and [gtk.progress_bar.ProgressBar.utf8] to the empty string (not null).
    Params:
      showText =       whether to show text
  */
  void setShowText(bool showText)
  {
    gtk_progress_bar_set_show_text(cast(GtkProgressBar*)cPtr, showText);
  }

  /**
      Causes the given text to appear next to the progress bar.
    
    If text is null and `propertyGtk.ProgressBar:show-text` is true,
    the current value of [gtk.progress_bar.ProgressBar.gdouble] will be displayed
    as a percentage.
    
    If text is non-null and `propertyGtk.ProgressBar:show-text` is true,
    the text will be displayed. In this case, it will not display the progress
    percentage. If text is the empty string, the progress bar will still
    be styled and sized suitably for containing text, as long as
    `propertyGtk.ProgressBar:show-text` is true.
    Params:
      text =       a UTF-8 string
  */
  void setText(string text = null)
  {
    const(char)* _text = text.toCString(No.alloc);
    gtk_progress_bar_set_text(cast(GtkProgressBar*)cPtr, _text);
  }
}
