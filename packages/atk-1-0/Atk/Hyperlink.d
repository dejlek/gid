module Atk.Hyperlink;

import Atk.Action;
import Atk.ActionT;
import Atk.ObjectAtk;
import Atk.Types;
import Atk.c.functions;
import Atk.c.types;
import GObject.DClosure;
import GObject.ObjectG;
import Gid.gid;

/**
 * An ATK object which encapsulates a link or set of links in a hypertext document.
 * An ATK object which encapsulates a link or set of links $(LPAREN)for
 * instance in the case of client-side image maps$(RPAREN) in a hypertext
 * document.  It may implement the AtkAction interface.  AtkHyperlink
 * may also be used to refer to inline embedded content, since it
 * allows specification of a start and end offset within the host
 * AtkHypertext object.
 */
class Hyperlink : ObjectG, Action
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())atk_hyperlink_get_type != &gidSymbolNotFound ? atk_hyperlink_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ActionT!();

  /**
   * Gets the index with the hypertext document at which this link ends.
   * Returns: the index with the hypertext document at which this link ends
   */
  int getEndIndex()
  {
    int _retval;
    _retval = atk_hyperlink_get_end_index(cast(AtkHyperlink*)cPtr);
    return _retval;
  }

  /**
   * Gets the number of anchors associated with this hyperlink.
   * Returns: the number of anchors associated with this hyperlink
   */
  int getNAnchors()
  {
    int _retval;
    _retval = atk_hyperlink_get_n_anchors(cast(AtkHyperlink*)cPtr);
    return _retval;
  }

  /**
   * Returns the item associated with this hyperlinks nth anchor.
   * For instance, the returned #AtkObject will implement #AtkText
   * if link_ is a text hyperlink, #AtkImage if link_ is an image
   * hyperlink etc.
   * Multiple anchors are primarily used by client-side image maps.
   * Params:
   *   i = a $(LPAREN)zero-index$(RPAREN) integer specifying the desired anchor
   * Returns: an #AtkObject associated with this hyperlinks
   *   i-th anchor
   */
  ObjectAtk getObject(int i)
  {
    AtkObject* _cretval;
    _cretval = atk_hyperlink_get_object(cast(AtkHyperlink*)cPtr, i);
    auto _retval = ObjectG.getDObject!ObjectAtk(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the index with the hypertext document at which this link begins.
   * Returns: the index with the hypertext document at which this link begins
   */
  int getStartIndex()
  {
    int _retval;
    _retval = atk_hyperlink_get_start_index(cast(AtkHyperlink*)cPtr);
    return _retval;
  }

  /**
   * Get a the URI associated with the anchor specified
   * by i of link_.
   * Multiple anchors are primarily used by client-side image maps.
   * Params:
   *   i = a $(LPAREN)zero-index$(RPAREN) integer specifying the desired anchor
   * Returns: a string specifying the URI
   */
  string getUri(int i)
  {
    char* _cretval;
    _cretval = atk_hyperlink_get_uri(cast(AtkHyperlink*)cPtr, i);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Indicates whether the link currently displays some or all of its
   * content inline.  Ordinary HTML links will usually return
   * %FALSE, but an inline &lt;src&gt; HTML element will return
   * %TRUE.
   * Returns: whether or not this link displays its content inline.
   */
  bool isInline()
  {
    bool _retval;
    _retval = atk_hyperlink_is_inline(cast(AtkHyperlink*)cPtr);
    return _retval;
  }

  /**
   * Determines whether this AtkHyperlink is selected
   * Returns: True if the AtkHyperlink is selected, False otherwise

   * Deprecated: Please use ATK_STATE_FOCUSABLE for all links,
   *   and ATK_STATE_FOCUSED for focused links.
   */
  bool isSelectedLink()
  {
    bool _retval;
    _retval = atk_hyperlink_is_selected_link(cast(AtkHyperlink*)cPtr);
    return _retval;
  }

  /**
   * Since the document that a link is associated with may have changed
   * this method returns %TRUE if the link is still valid $(LPAREN)with
   * respect to the document it references$(RPAREN) and %FALSE otherwise.
   * Returns: whether or not this link is still valid
   */
  bool isValid()
  {
    bool _retval;
    _retval = atk_hyperlink_is_valid(cast(AtkHyperlink*)cPtr);
    return _retval;
  }

  /**
   * The signal link-activated is emitted when a link is activated.
   *   hyperlink = the instance the signal is connected to
   */
  alias LinkActivatedCallbackDlg = void delegate(Hyperlink hyperlink);
  alias LinkActivatedCallbackFunc = void function(Hyperlink hyperlink);

  /**
   * Connect to LinkActivated signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectLinkActivated(T)(T callback, Flag!"After" after = No.After)
  if (is(T : LinkActivatedCallbackDlg) || is(T : LinkActivatedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto hyperlink = getVal!Hyperlink(_paramVals);
      _dClosure.dlg(hyperlink);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("link-activated", closure, after);
  }
}
