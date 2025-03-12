module gtk.revealer;

import gid.gid;
import gobject.object;
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
    A [gtk.revealer.Revealer] animates the transition of its child from invisible to visible.
  
  The style of transition can be controlled with
  [gtk.revealer.Revealer.setTransitionType].
  
  These animations respect the `property@Gtk.Settings:gtk-enable-animations`
  setting.
  
  # CSS nodes
  
  [gtk.revealer.Revealer] has a single CSS node with name revealer.
  When styling [gtk.revealer.Revealer] using CSS, remember that it only hides its contents,
  not itself. That means applied margin, padding and borders will be visible even
  when the `property@Gtk.Revealer:reveal-child` property is set to false.
  
  # Accessibility
  
  [gtk.revealer.Revealer] uses the [gtk.types.AccessibleRole.Group] role.
  
  The child of [gtk.revealer.Revealer], if set, is always available in the accessibility
  tree, regardless of the state of the revealer widget.
*/
class Revealer : gtk.widget.Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_revealer_get_type != &gidSymbolNotFound ? gtk_revealer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Revealer self()
  {
    return this;
  }

  /**
      Creates a new [gtk.revealer.Revealer].
    Returns:     a newly created [gtk.revealer.Revealer]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_revealer_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the child widget of revealer.
    Returns:     the child widget of revealer
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_revealer_get_child(cast(GtkRevealer*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the child is fully revealed.
    
    In other words, this returns whether the transition
    to the revealed state is completed.
    Returns:     true if the child is fully revealed
  */
  bool getChildRevealed()
  {
    bool _retval;
    _retval = gtk_revealer_get_child_revealed(cast(GtkRevealer*)cPtr);
    return _retval;
  }

  /**
      Returns whether the child is currently revealed.
    
    This function returns true as soon as the transition
    is to the revealed state is started. To learn whether
    the child is fully revealed (ie the transition is completed),
    use [gtk.revealer.Revealer.getChildRevealed].
    Returns:     true if the child is revealed.
  */
  bool getRevealChild()
  {
    bool _retval;
    _retval = gtk_revealer_get_reveal_child(cast(GtkRevealer*)cPtr);
    return _retval;
  }

  /**
      Returns the amount of time (in milliseconds) that
    transitions will take.
    Returns:     the transition duration
  */
  uint getTransitionDuration()
  {
    uint _retval;
    _retval = gtk_revealer_get_transition_duration(cast(GtkRevealer*)cPtr);
    return _retval;
  }

  /**
      Gets the type of animation that will be used
    for transitions in revealer.
    Returns:     the current transition type of revealer
  */
  gtk.types.RevealerTransitionType getTransitionType()
  {
    GtkRevealerTransitionType _cretval;
    _cretval = gtk_revealer_get_transition_type(cast(GtkRevealer*)cPtr);
    gtk.types.RevealerTransitionType _retval = cast(gtk.types.RevealerTransitionType)_cretval;
    return _retval;
  }

  /**
      Sets the child widget of revealer.
    Params:
      child =       the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    gtk_revealer_set_child(cast(GtkRevealer*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
      Tells the [gtk.revealer.Revealer] to reveal or conceal its child.
    
    The transition will be animated with the current
    transition type of revealer.
    Params:
      revealChild =       true to reveal the child
  */
  void setRevealChild(bool revealChild)
  {
    gtk_revealer_set_reveal_child(cast(GtkRevealer*)cPtr, revealChild);
  }

  /**
      Sets the duration that transitions will take.
    Params:
      duration =       the new duration, in milliseconds
  */
  void setTransitionDuration(uint duration)
  {
    gtk_revealer_set_transition_duration(cast(GtkRevealer*)cPtr, duration);
  }

  /**
      Sets the type of animation that will be used for
    transitions in revealer.
    
    Available types include various kinds of fades and slides.
    Params:
      transition =       the new transition type
  */
  void setTransitionType(gtk.types.RevealerTransitionType transition)
  {
    gtk_revealer_set_transition_type(cast(GtkRevealer*)cPtr, transition);
  }
}
