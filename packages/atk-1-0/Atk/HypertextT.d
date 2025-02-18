module Atk.HypertextT;

public import Atk.HypertextIfaceProxy;
public import Atk.Hyperlink;
public import Atk.Types;
public import Atk.c.functions;
public import Atk.c.types;
public import GObject.DClosure;
public import GObject.ObjectG;
public import Gid.gid;

/**
 * The ATK interface which provides standard mechanism for manipulating hyperlinks.
 * An interface used for objects which implement linking between
 * multiple resource or content locations, or multiple 'markers'
 * within a single document.  A Hypertext instance is associated with
 * one or more Hyperlinks, which are associated with particular
 * offsets within the Hypertext's included content.  While this
 * interface is derived from Text, there is no requirement that
 * Hypertext instances have textual content; they may implement Image
 * as well, and Hyperlinks need not have non-zero text offsets.
 */
template HypertextT()
{

  /**
   * Gets the link in this hypertext document at index
   * link_index
   * Params:
   *   linkIndex = an integer specifying the desired link
   * Returns: the link in this hypertext document at
   *   index link_index
   */
  override Hyperlink getLink(int linkIndex)
  {
    AtkHyperlink* _cretval;
    _cretval = atk_hypertext_get_link(cast(AtkHypertext*)cPtr, linkIndex);
    auto _retval = ObjectG.getDObject!Hyperlink(cast(AtkHyperlink*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the index into the array of hyperlinks that is associated with
   * the character specified by char_index.
   * Params:
   *   charIndex = a character index
   * Returns: an index into the array of hyperlinks in hypertext,
   *   or -1 if there is no hyperlink associated with this character.
   */
  override int getLinkIndex(int charIndex)
  {
    int _retval;
    _retval = atk_hypertext_get_link_index(cast(AtkHypertext*)cPtr, charIndex);
    return _retval;
  }

  /**
   * Gets the number of links within this hypertext document.
   * Returns: the number of links within this hypertext document
   */
  override int getNLinks()
  {
    int _retval;
    _retval = atk_hypertext_get_n_links(cast(AtkHypertext*)cPtr);
    return _retval;
  }

  /**
   * The "link-selected" signal is emitted by an AtkHyperText
   * object when one of the hyperlinks associated with the object
   * is selected.
   * Params
   *   arg1 = the index of the hyperlink which is selected
   *   hypertext = the instance the signal is connected to
   */
  alias LinkSelectedCallbackDlg = void delegate(int arg1, Hypertext hypertext);
  alias LinkSelectedCallbackFunc = void function(int arg1, Hypertext hypertext);

  /**
   * Connect to LinkSelected signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectLinkSelected(T)(T callback, Flag!"After" after = No.After)
  if (is(T : LinkSelectedCallbackDlg) || is(T : LinkSelectedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto hypertext = getVal!Hypertext(_paramVals);
      auto arg1 = getVal!int(&_paramVals[1]);
      _dClosure.dlg(arg1, hypertext);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("link-selected", closure, after);
  }
}
