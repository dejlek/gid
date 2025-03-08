module gtk.expander;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    A #GtkExpander allows the user to hide or show its child by clicking
  on an expander triangle similar to the triangles used in a #GtkTreeView.
  
  Normally you use an expander as you would use any other descendant
  of #GtkBin; you create the child widget and use [gtk.container.Container.add]
  to add it to the expander. When the expander is toggled, it will take
  care of showing and hiding the child automatically.
  
  # Special Usage
  
  There are situations in which you may prefer to show and hide the
  expanded widget yourself, such as when you want to actually create
  the widget at expansion time. In this case, create a #GtkExpander
  but do not add a child to it. The expander widget has an
  #GtkExpander:expanded property which can be used to monitor
  its expansion state. You should watch this property with a signal
  connection as follows:
  
  ```c
  static void
  expander_callback (GObject    *object,
                     GParamSpec *param_spec,
                     gpointer    user_data)
  {
    GtkExpander *expander;
  
    expander = GTK_EXPANDER (object);
  
    if (gtk_expander_get_expanded (expander))
      {
        // Show or create widgets
      }
    else
      {
        // Hide or destroy widgets
      }
  }
  
  static void
  create_expander (void)
  {
    GtkWidget *expander = gtk_expander_new_with_mnemonic ("_More Options");
    g_signal_connect (expander, "notify::expanded",
                      G_CALLBACK (expander_callback), NULL);
  
    // ...
  }
  ```
  
  # GtkExpander as GtkBuildable
  
  The GtkExpander implementation of the GtkBuildable interface supports
  placing a child in the label position by specifying “label” as the
  “type” attribute of a `<child>` element. A normal content child can be
  specified without specifying a `<child>` type attribute.
  
  An example of a UI definition fragment with GtkExpander:
  
  ```xml
  <object class="GtkExpander">
    <child type="label">
      <object class="GtkLabel" id="expander-label"/>
    </child>
    <child>
      <object class="GtkEntry" id="expander-content"/>
    </child>
  </object>
  ```
  
  # CSS nodes
  
  ```plain
  expander
  ├── title
  │   ├── arrow
  │   ╰── <label widget>
  ╰── <child>
  ```
  
  GtkExpander has three CSS nodes, the main node with the name expander,
  a subnode with name title and node below it with name arrow. The arrow of an
  expander that is showing its child gets the :checked pseudoclass added to it.
*/
class Expander : gtk.bin.Bin
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_expander_get_type != &gidSymbolNotFound ? gtk_expander_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new expander using label as the text of the label.
    Params:
      label =       the text of the label
    Returns:     a new #GtkExpander widget.
  */
  this(string label = null)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.alloc);
    _cretval = gtk_expander_new(_label);
    this(_cretval, No.take);
  }

  /**
      Creates a new expander using label as the text of the label.
    If characters in label are preceded by an underscore, they are underlined.
    If you need a literal underscore character in a label, use “__” (two
    underscores). The first underlined character represents a keyboard
    accelerator called a mnemonic.
    Pressing Alt and that key activates the button.
    Params:
      label =       the text of the label with an underscore
            in front of the mnemonic character
    Returns:     a new #GtkExpander widget.
  */
  static gtk.expander.Expander newWithMnemonic(string label = null)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.alloc);
    _cretval = gtk_expander_new_with_mnemonic(_label);
    auto _retval = ObjectG.getDObject!(gtk.expander.Expander)(cast(GtkWidget*)_cretval, No.take);
    return _retval;
  }

  /**
      Queries a #GtkExpander and returns its current state. Returns true
    if the child widget is revealed.
    
    See [gtk.expander.Expander.setExpanded].
    Returns:     the current state of the expander
  */
  bool getExpanded()
  {
    bool _retval;
    _retval = gtk_expander_get_expanded(cast(GtkExpander*)cPtr);
    return _retval;
  }

  /**
      Fetches the text from a label widget including any embedded
    underlines indicating mnemonics and Pango markup, as set by
    [gtk.expander.Expander.setLabel]. If the label text has not been set the
    return value will be null. This will be the case if you create an
    empty button with [gtk.button.Button.new_] to use as a container.
    
    Note that this function behaved differently in versions prior to
    2.14 and used to return the label text stripped of embedded
    underlines indicating mnemonics and Pango markup. This problem can
    be avoided by fetching the label text directly from the label
    widget.
    Returns:     The text of the label widget. This string is owned
          by the widget and must not be modified or freed.
  */
  string getLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_expander_get_label(cast(GtkExpander*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Returns whether the label widget will fill all available
    horizontal space allocated to expander.
    Returns:     true if the label widget will fill all
          available horizontal space
  */
  bool getLabelFill()
  {
    bool _retval;
    _retval = gtk_expander_get_label_fill(cast(GtkExpander*)cPtr);
    return _retval;
  }

  /**
      Retrieves the label widget for the frame. See
    [gtk.expander.Expander.setLabelWidget].
    Returns:     the label widget,
          or null if there is none
  */
  gtk.widget.Widget getLabelWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_expander_get_label_widget(cast(GtkExpander*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.take);
    return _retval;
  }

  /**
      Returns whether the expander will resize the toplevel widget
    containing the expander upon resizing and collpasing.
    Returns:     the “resize toplevel” setting.
  */
  bool getResizeToplevel()
  {
    bool _retval;
    _retval = gtk_expander_get_resize_toplevel(cast(GtkExpander*)cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gtk.expander.Expander.setSpacing].
    Returns:     spacing between the expander and child
  
    Deprecated:     Use margins on the child instead.
  */
  int getSpacing()
  {
    int _retval;
    _retval = gtk_expander_get_spacing(cast(GtkExpander*)cPtr);
    return _retval;
  }

  /**
      Returns whether the label’s text is interpreted as marked up with
    the [Pango text markup language][PangoMarkupFormat].
    See [gtk.expander.Expander.setUseMarkup].
    Returns:     true if the label’s text will be parsed for markup
  */
  bool getUseMarkup()
  {
    bool _retval;
    _retval = gtk_expander_get_use_markup(cast(GtkExpander*)cPtr);
    return _retval;
  }

  /**
      Returns whether an embedded underline in the expander label
    indicates a mnemonic. See [gtk.expander.Expander.setUseUnderline].
    Returns:     true if an embedded underline in the expander
          label indicates the mnemonic accelerator keys
  */
  bool getUseUnderline()
  {
    bool _retval;
    _retval = gtk_expander_get_use_underline(cast(GtkExpander*)cPtr);
    return _retval;
  }

  /**
      Sets the state of the expander. Set to true, if you want
    the child widget to be revealed, and false if you want the
    child widget to be hidden.
    Params:
      expanded =       whether the child widget is revealed
  */
  void setExpanded(bool expanded)
  {
    gtk_expander_set_expanded(cast(GtkExpander*)cPtr, expanded);
  }

  /**
      Sets the text of the label of the expander to label.
    
    This will also clear any previously set labels.
    Params:
      label =       a string
  */
  void setLabel(string label = null)
  {
    const(char)* _label = label.toCString(No.alloc);
    gtk_expander_set_label(cast(GtkExpander*)cPtr, _label);
  }

  /**
      Sets whether the label widget should fill all available
    horizontal space allocated to expander.
    
    Note that this function has no effect since 3.20.
    Params:
      labelFill =       true if the label should should fill
            all available horizontal space
  */
  void setLabelFill(bool labelFill)
  {
    gtk_expander_set_label_fill(cast(GtkExpander*)cPtr, labelFill);
  }

  /**
      Set the label widget for the expander. This is the widget
    that will appear embedded alongside the expander arrow.
    Params:
      labelWidget =       the new label widget
  */
  void setLabelWidget(gtk.widget.Widget labelWidget = null)
  {
    gtk_expander_set_label_widget(cast(GtkExpander*)cPtr, labelWidget ? cast(GtkWidget*)labelWidget.cPtr(No.dup) : null);
  }

  /**
      Sets whether the expander will resize the toplevel widget
    containing the expander upon resizing and collpasing.
    Params:
      resizeToplevel =       whether to resize the toplevel
  */
  void setResizeToplevel(bool resizeToplevel)
  {
    gtk_expander_set_resize_toplevel(cast(GtkExpander*)cPtr, resizeToplevel);
  }

  /**
      Sets the spacing field of expander, which is the number of
    pixels to place between expander and the child.
    Params:
      spacing =       distance between the expander and child in pixels
  
    Deprecated:     Use margins on the child instead.
  */
  void setSpacing(int spacing)
  {
    gtk_expander_set_spacing(cast(GtkExpander*)cPtr, spacing);
  }

  /**
      Sets whether the text of the label contains markup in
    [Pango’s text markup language][PangoMarkupFormat].
    See [gtk.label.Label.setMarkup].
    Params:
      useMarkup =       true if the label’s text should be parsed for markup
  */
  void setUseMarkup(bool useMarkup)
  {
    gtk_expander_set_use_markup(cast(GtkExpander*)cPtr, useMarkup);
  }

  /**
      If true, an underline in the text of the expander label indicates
    the next character should be used for the mnemonic accelerator key.
    Params:
      useUnderline =       true if underlines in the text indicate mnemonics
  */
  void setUseUnderline(bool useUnderline)
  {
    gtk_expander_set_use_underline(cast(GtkExpander*)cPtr, useUnderline);
  }

  /** */
  alias ActivateCallbackDlg = void delegate(gtk.expander.Expander expander);

  /** ditto */
  alias ActivateCallbackFunc = void function(gtk.expander.Expander expander);

  /**
    Connect to Activate signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ActivateCallbackDlg) || is(T : ActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto expander = getVal!(gtk.expander.Expander)(_paramVals);
      _dClosure.dlg(expander);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }
}
