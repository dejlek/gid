module atk.hyperlink;

import atk.action;
import atk.action_mixin;
import atk.c.functions;
import atk.c.types;
import atk.object;
import atk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;

/**
    An ATK object which encapsulates a link or set of links in a hypertext document.
  
  An ATK object which encapsulates a link or set of links (for
  instance in the case of client-side image maps) in a hypertext
  document.  It may implement the AtkAction interface.  AtkHyperlink
  may also be used to refer to inline embedded content, since it
  allows specification of a start and end offset within the host
  AtkHypertext object.
*/
class Hyperlink : gobject.object.ObjectG, atk.action.Action
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_hyperlink_get_type != &gidSymbolNotFound ? atk_hyperlink_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin ActionT!();

  /**
      Gets the index with the hypertext document at which this link ends.
    Returns:     the index with the hypertext document at which this link ends
  */
  int getEndIndex()
  {
    int _retval;
    _retval = atk_hyperlink_get_end_index(cast(AtkHyperlink*)cPtr);
    return _retval;
  }

  /**
      Gets the number of anchors associated with this hyperlink.
    Returns:     the number of anchors associated with this hyperlink
  */
  int getNAnchors()
  {
    int _retval;
    _retval = atk_hyperlink_get_n_anchors(cast(AtkHyperlink*)cPtr);
    return _retval;
  }

  /**
      Returns the item associated with this hyperlinks nth anchor.
    For instance, the returned #AtkObject will implement #AtkText
    if link_ is a text hyperlink, #AtkImage if link_ is an image
    hyperlink etc.
    
    Multiple anchors are primarily used by client-side image maps.
    Params:
      i =       a (zero-index) integer specifying the desired anchor
    Returns:     an #AtkObject associated with this hyperlinks
      i-th anchor
  */
  atk.object.ObjectAtk getObject(int i)
  {
    AtkObject* _cretval;
    _cretval = atk_hyperlink_get_object(cast(AtkHyperlink*)cPtr, i);
    auto _retval = ObjectG.getDObject!(atk.object.ObjectAtk)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the index with the hypertext document at which this link begins.
    Returns:     the index with the hypertext document at which this link begins
  */
  int getStartIndex()
  {
    int _retval;
    _retval = atk_hyperlink_get_start_index(cast(AtkHyperlink*)cPtr);
    return _retval;
  }

  /**
      Get a the URI associated with the anchor specified
    by i of link_.
    
    Multiple anchors are primarily used by client-side image maps.
    Params:
      i =       a (zero-index) integer specifying the desired anchor
    Returns:     a string specifying the URI
  */
  string getUri(int i)
  {
    char* _cretval;
    _cretval = atk_hyperlink_get_uri(cast(AtkHyperlink*)cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Indicates whether the link currently displays some or all of its
              content inline.  Ordinary HTML links will usually return
              false, but an inline &lt;src&gt; HTML element will return
              true.
    Returns:     whether or not this link displays its content inline.
  */
  bool isInline()
  {
    bool _retval;
    _retval = atk_hyperlink_is_inline(cast(AtkHyperlink*)cPtr);
    return _retval;
  }

  /**
      Determines whether this AtkHyperlink is selected
    Returns:     True if the AtkHyperlink is selected, False otherwise
  
    Deprecated:     Please use ATK_STATE_FOCUSABLE for all links,
      and ATK_STATE_FOCUSED for focused links.
  */
  bool isSelectedLink()
  {
    bool _retval;
    _retval = atk_hyperlink_is_selected_link(cast(AtkHyperlink*)cPtr);
    return _retval;
  }

  /**
      Since the document that a link is associated with may have changed
    this method returns true if the link is still valid (with
    respect to the document it references) and false otherwise.
    Returns:     whether or not this link is still valid
  */
  bool isValid()
  {
    bool _retval;
    _retval = atk_hyperlink_is_valid(cast(AtkHyperlink*)cPtr);
    return _retval;
  }

  /**
      The signal link-activated is emitted when a link is activated.
  
    ## Parameters
    $(LIST
      * $(B hyperlink) the instance the signal is connected to
    )
  */
  alias LinkActivatedCallbackDlg = void delegate(atk.hyperlink.Hyperlink hyperlink);

  /** ditto */
  alias LinkActivatedCallbackFunc = void function(atk.hyperlink.Hyperlink hyperlink);

  /**
    Connect to LinkActivated signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectLinkActivated(T)(T callback, Flag!"After" after = No.After)
  if (is(T : LinkActivatedCallbackDlg) || is(T : LinkActivatedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto hyperlink = getVal!(atk.hyperlink.Hyperlink)(_paramVals);
      _dClosure.dlg(hyperlink);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("link-activated", closure, after);
  }
}
