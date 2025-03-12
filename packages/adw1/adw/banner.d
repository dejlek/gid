module adw.banner;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.dclosure;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A bar with contextual information.
  
  <picture>
    <source srcset="banner-dark.png" media="(prefers-color-scheme: dark)">
    <img src="banner.png" alt="banner">
  </picture>
  
  Banners are hidden by default, use `property@Banner:revealed` to show them.
  
  Banners have a title, set with `property@Banner:title`. Titles can be marked
  up with Pango markup, use `property@Banner:use-markup` to enable it.
  
  The title will be shown centered or left-aligned depending on available
  space.
  
  Banners can optionally have a button with text on it, set through
  `property@Banner:button-label`. The button can be used with a [gio.action.Action],
  or with the `signal@Banner::button-clicked` signal.
  
  ## CSS nodes
  
  [adw.banner.Banner] has a main CSS node with the name `banner`.
*/
class Banner : gtk.widget.Widget, gtk.actionable.Actionable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_banner_get_type != &gidSymbolNotFound ? adw_banner_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Banner self()
  {
    return this;
  }

  mixin ActionableT!();

  /**
      Creates a new [adw.banner.Banner].
    Params:
      title =       the banner title
    Returns:     the newly created [adw.banner.Banner]
  */
  this(string title)
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = adw_banner_new(_title);
    this(_cretval, No.Take);
  }

  /**
      Gets the button label for self.
    Returns:     the button label for self
  */
  string getButtonLabel()
  {
    const(char)* _cretval;
    _cretval = adw_banner_get_button_label(cast(AdwBanner*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets if a banner is revealed
    Returns:     Whether a banner is revealed
  */
  bool getRevealed()
  {
    bool _retval;
    _retval = adw_banner_get_revealed(cast(AdwBanner*)cPtr);
    return _retval;
  }

  /**
      Gets the title for self.
    Returns:     the title for self
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = adw_banner_get_title(cast(AdwBanner*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether to use Pango markup for the banner title.
    Returns:     whether to use markup
  */
  bool getUseMarkup()
  {
    bool _retval;
    _retval = adw_banner_get_use_markup(cast(AdwBanner*)cPtr);
    return _retval;
  }

  /**
      Sets the button label for self.
    
    If set to `""` or `NULL`, the button won't be shown.
    
    The button can be used with a [gio.action.Action], or with the
    `signalBanner::button-clicked` signal.
    Params:
      label =       the label
  */
  void setButtonLabel(string label = null)
  {
    const(char)* _label = label.toCString(No.Alloc);
    adw_banner_set_button_label(cast(AdwBanner*)cPtr, _label);
  }

  /**
      Sets whether a banner should be revealed
    Params:
      revealed =       whether a banner should be revealed
  */
  void setRevealed(bool revealed)
  {
    adw_banner_set_revealed(cast(AdwBanner*)cPtr, revealed);
  }

  /**
      Sets the title for this banner.
    
    See also: `propertyBanner:use-markup`.
    Params:
      title =       the title
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    adw_banner_set_title(cast(AdwBanner*)cPtr, _title);
  }

  /**
      Sets whether to use Pango markup for the banner title.
    
    See also `funcPango.parse_markup`.
    Params:
      useMarkup =       whether to use markup
  */
  void setUseMarkup(bool useMarkup)
  {
    adw_banner_set_use_markup(cast(AdwBanner*)cPtr, useMarkup);
  }

  /**
      This signal is emitted after the action button has been clicked.
    
    It can be used as an alternative to setting an action.
  
    ## Parameters
    $(LIST
      * $(B banner) the instance the signal is connected to
    )
  */
  alias ButtonClickedCallbackDlg = void delegate(adw.banner.Banner banner);

  /** ditto */
  alias ButtonClickedCallbackFunc = void function(adw.banner.Banner banner);

  /**
    Connect to ButtonClicked signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectButtonClicked(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ButtonClickedCallbackDlg) || is(T : ButtonClickedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto banner = getVal!(adw.banner.Banner)(_paramVals);
      _dClosure.dlg(banner);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("button-clicked", closure, after);
  }
}
