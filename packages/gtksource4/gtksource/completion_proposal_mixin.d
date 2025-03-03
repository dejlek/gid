module gtksource.completion_proposal_mixin;

public import gtksource.completion_proposal_iface_proxy;
public import gdkpixbuf.pixbuf;
public import gid.gid;
public import gio.icon;
public import gobject.dclosure;
public import gobject.object;
public import gtksource.c.functions;
public import gtksource.c.types;
public import gtksource.types;

template CompletionProposalT()
{

  /**
   * Emits the "changed" signal on proposal. This should be called by
   * implementations whenever the name, icon or info of the proposal has
   * changed.
   */
  override void changed()
  {
    gtk_source_completion_proposal_changed(cast(GtkSourceCompletionProposal*)cPtr);
  }

  /**
   * Get whether two proposal objects are the same.  This is used to $(LPAREN)together
   * with [gtksource.completion_proposal.CompletionProposal.hash]$(RPAREN) to match proposals in the
   * completion model. By default, it uses direct equality $(LPAREN)[glib.global.directEqual]$(RPAREN).
   * Params:
   *   other = a #GtkSourceCompletionProposal.
   * Returns: %TRUE if proposal and object are the same proposal
   */
  override bool equal(gtksource.completion_proposal.CompletionProposal other)
  {
    bool _retval;
    _retval = gtk_source_completion_proposal_equal(cast(GtkSourceCompletionProposal*)cPtr, other ? cast(GtkSourceCompletionProposal*)(cast(ObjectG)other).cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Gets the #GIcon for the icon of proposal.
   * Returns: A #GIcon with the icon of proposal.
   */
  override gio.icon.Icon getGicon()
  {
    GIcon* _cretval;
    _cretval = gtk_source_completion_proposal_get_gicon(cast(GtkSourceCompletionProposal*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the #GdkPixbuf for the icon of proposal.
   * Returns: A #GdkPixbuf with the icon of proposal.
   */
  override gdkpixbuf.pixbuf.Pixbuf getIcon()
  {
    PixbufC* _cretval;
    _cretval = gtk_source_completion_proposal_get_icon(cast(GtkSourceCompletionProposal*)cPtr);
    auto _retval = ObjectG.getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(PixbufC*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the icon name of proposal.
   * Returns: The icon name of proposal.
   */
  override string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_source_completion_proposal_get_icon_name(cast(GtkSourceCompletionProposal*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets extra information associated to the proposal. This information will be
   * used to present the user with extra, detailed information about the
   * selected proposal. The returned string must be freed with [glib.global.gfree].
   * Returns: a newly-allocated string containing
   *   extra information of proposal or %NULL if no extra information is associated
   *   to proposal.
   */
  override string getInfo()
  {
    char* _cretval;
    _cretval = gtk_source_completion_proposal_get_info(cast(GtkSourceCompletionProposal*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Gets the label of proposal. The label is shown in the list of proposals as
   * plain text. If you need any markup $(LPAREN)such as bold or italic text$(RPAREN), you have
   * to implement [gtksource.completion_proposal.CompletionProposal.getMarkup]. The returned string
   * must be freed with [glib.global.gfree].
   * Returns: a new string containing the label of proposal.
   */
  override string getLabel()
  {
    char* _cretval;
    _cretval = gtk_source_completion_proposal_get_label(cast(GtkSourceCompletionProposal*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Gets the label of proposal with markup. The label is shown in the list of
   * proposals and may contain markup. This will be used instead of
   * [gtksource.completion_proposal.CompletionProposal.getLabel] if implemented. The returned string
   * must be freed with [glib.global.gfree].
   * Returns: a new string containing the label of proposal with markup.
   */
  override string getMarkup()
  {
    char* _cretval;
    _cretval = gtk_source_completion_proposal_get_markup(cast(GtkSourceCompletionProposal*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Gets the text of proposal. The text that is inserted into
   * the text buffer when the proposal is activated by the default activation.
   * You are free to implement a custom activation handler in the provider and
   * not implement this function. For more information, see
   * [gtksource.completion_provider.CompletionProvider.activateProposal]. The returned string must
   * be freed with [glib.global.gfree].
   * Returns: a new string containing the text of proposal.
   */
  override string getText()
  {
    char* _cretval;
    _cretval = gtk_source_completion_proposal_get_text(cast(GtkSourceCompletionProposal*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Get the hash value of proposal. This is used to $(LPAREN)together with
   * [gtksource.completion_proposal.CompletionProposal.equal]$(RPAREN) to match proposals in the completion
   * model. By default, it uses a direct hash $(LPAREN)[glib.global.directHash]$(RPAREN).
   * Returns: The hash value of proposal.
   */
  override uint hash()
  {
    uint _retval;
    _retval = gtk_source_completion_proposal_hash(cast(GtkSourceCompletionProposal*)cPtr);
    return _retval;
  }

  /**
   * Emitted when the proposal has changed. The completion popup
   * will react to this by updating the shown information.
   *   completionProposal = the instance the signal is connected to
   */
  alias ChangedCallbackDlg = void delegate(gtksource.completion_proposal.CompletionProposal completionProposal);
  alias ChangedCallbackFunc = void function(gtksource.completion_proposal.CompletionProposal completionProposal);

  /**
   * Connect to Changed signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChangedCallbackDlg) || is(T : ChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto completionProposal = getVal!(gtksource.completion_proposal.CompletionProposal)(_paramVals);
      _dClosure.dlg(completionProposal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }
}
