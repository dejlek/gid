module gtksource.completion;

import gid.gid;
import glib.error;
import gobject.dclosure;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.text_iter;
import gtk.types;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.completion_context;
import gtksource.completion_info;
import gtksource.completion_provider;
import gtksource.types;
import gtksource.view;

/** */
class Completion : gobject.object.ObjectG, gtk.buildable.Buildable
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_completion_get_type != &gidSymbolNotFound ? gtk_source_completion_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin BuildableT!();

  /**
      Add a new #GtkSourceCompletionProvider to the completion object. This will
    add a reference provider, so make sure to unref your own copy when you
    no longer need it.
    Params:
      provider =       a #GtkSourceCompletionProvider.
    Returns:     true if provider was successfully added, otherwise if error
               is provided, it will be set with the error and false is returned.
  */
  bool addProvider(gtksource.completion_provider.CompletionProvider provider)
  {
    bool _retval;
    GError *_err;
    _retval = gtk_source_completion_add_provider(cast(GtkSourceCompletion*)cPtr, provider ? cast(GtkSourceCompletionProvider*)(cast(ObjectG)provider).cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Block interactive completion. This can be used to disable interactive
    completion when inserting or deleting text from the buffer associated with
    the completion. Use [gtksource.completion.Completion.unblockInteractive] to enable
    interactive completion again.
    
    This function may be called multiple times. It will continue to block
    interactive completion until [gtksource.completion.Completion.unblockInteractive]
    has been called the same number of times.
  */
  void blockInteractive()
  {
    gtk_source_completion_block_interactive(cast(GtkSourceCompletion*)cPtr);
  }

  /**
      Create a new #GtkSourceCompletionContext for completion. The position where
    the completion occurs can be specified by position. If position is null,
    the current cursor position will be used.
    Params:
      position =       a #GtkTextIter, or null.
    Returns:     a new #GtkSourceCompletionContext.
      The reference being returned is a 'floating' reference,
      so if you invoke [gtksource.completion.Completion.start] with this context
      you don't need to unref it.
  */
  gtksource.completion_context.CompletionContext createContext(gtk.text_iter.TextIter position = null)
  {
    GtkSourceCompletionContext* _cretval;
    _cretval = gtk_source_completion_create_context(cast(GtkSourceCompletion*)cPtr, position ? cast(GtkTextIter*)position.cPtr(No.dup) : null);
    auto _retval = ObjectG.getDObject!(gtksource.completion_context.CompletionContext)(cast(GtkSourceCompletionContext*)_cretval, No.take);
    return _retval;
  }

  /**
      The info widget is the window where the completion displays optional extra
    information of the proposal.
    Returns:     The #GtkSourceCompletionInfo window
                                associated with completion.
  */
  gtksource.completion_info.CompletionInfo getInfoWindow()
  {
    GtkSourceCompletionInfo* _cretval;
    _cretval = gtk_source_completion_get_info_window(cast(GtkSourceCompletion*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.completion_info.CompletionInfo)(cast(GtkSourceCompletionInfo*)_cretval, No.take);
    return _retval;
  }

  /**
      Get list of providers registered on completion. The returned list is owned
    by the completion and should not be freed.
    Returns:     list of #GtkSourceCompletionProvider.
  */
  gtksource.completion_provider.CompletionProvider[] getProviders()
  {
    GList* _cretval;
    _cretval = gtk_source_completion_get_providers(cast(GtkSourceCompletion*)cPtr);
    auto _retval = gListToD!(gtksource.completion_provider.CompletionProvider, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      The #GtkSourceView associated with completion, or null if the view has been
    destroyed.
    Returns:     The #GtkSourceView associated with
      completion, or null.
  */
  gtksource.view.View getView()
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_completion_get_view(cast(GtkSourceCompletion*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.view.View)(cast(GtkSourceView*)_cretval, No.take);
    return _retval;
  }

  /**
      Hides the completion if it is active (visible).
  */
  void hide()
  {
    gtk_source_completion_hide(cast(GtkSourceCompletion*)cPtr);
  }

  /**
      Remove provider from the completion.
    Params:
      provider =       a #GtkSourceCompletionProvider.
    Returns:     true if provider was successfully removed, otherwise if error
               is provided, it will be set with the error and false is returned.
  */
  bool removeProvider(gtksource.completion_provider.CompletionProvider provider)
  {
    bool _retval;
    GError *_err;
    _retval = gtk_source_completion_remove_provider(cast(GtkSourceCompletion*)cPtr, provider ? cast(GtkSourceCompletionProvider*)(cast(ObjectG)provider).cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Starts a new completion with the specified #GtkSourceCompletionContext and
    a list of potential candidate providers for completion.
    
    It can be convenient for showing a completion on-the-fly, without the need to
    add or remove providers to the #GtkSourceCompletion.
    
    Another solution is to add providers with
    [gtksource.completion.Completion.addProvider], and implement
    [gtksource.completion_provider.CompletionProvider.match] for each provider.
    Params:
      providers =       a list of #GtkSourceCompletionProvider, or null.
      context =       The #GtkSourceCompletionContext
        with which to start the completion.
    Returns:     true if it was possible to the show completion window.
  */
  bool start(gtksource.completion_provider.CompletionProvider[] providers, gtksource.completion_context.CompletionContext context)
  {
    bool _retval;
    auto _providers = gListFromD!(gtksource.completion_provider.CompletionProvider)(providers);
    scope(exit) containerFree!(GList*, gtksource.completion_provider.CompletionProvider, GidOwnership.None)(_providers);
    _retval = gtk_source_completion_start(cast(GtkSourceCompletion*)cPtr, _providers, context ? cast(GtkSourceCompletionContext*)context.cPtr(No.dup) : null);
    return _retval;
  }

  /**
      Unblock interactive completion. This can be used after using
    [gtksource.completion.Completion.blockInteractive] to enable interactive completion
    again.
  */
  void unblockInteractive()
  {
    gtk_source_completion_unblock_interactive(cast(GtkSourceCompletion*)cPtr);
  }

  /**
      The #GtkSourceCompletion::activate-proposal signal is a
    keybinding signal which gets emitted when the user initiates
    a proposal activation.
    
    Applications should not connect to it, but may emit it with
    [gobject.global.signalEmitByName] if they need to control the proposal
    activation programmatically.
  
    ## Parameters
    $(LIST
      * $(B completion) the instance the signal is connected to
    )
  */
  alias ActivateProposalCallbackDlg = void delegate(gtksource.completion.Completion completion);

  /** ditto */
  alias ActivateProposalCallbackFunc = void function(gtksource.completion.Completion completion);

  /**
    Connect to ActivateProposal signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectActivateProposal(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ActivateProposalCallbackDlg) || is(T : ActivateProposalCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto completion = getVal!(gtksource.completion.Completion)(_paramVals);
      _dClosure.dlg(completion);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-proposal", closure, after);
  }

  /**
      Emitted when the completion window is hidden. The default handler
    will actually hide the window.
  
    ## Parameters
    $(LIST
      * $(B completion) the instance the signal is connected to
    )
  */
  alias HideCallbackDlg = void delegate(gtksource.completion.Completion completion);

  /** ditto */
  alias HideCallbackFunc = void function(gtksource.completion.Completion completion);

  /**
    Connect to Hide signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectHide(T)(T callback, Flag!"after" after = No.after)
  if (is(T : HideCallbackDlg) || is(T : HideCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto completion = getVal!(gtksource.completion.Completion)(_paramVals);
      _dClosure.dlg(completion);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("hide", closure, after);
  }

  /**
      The #GtkSourceCompletion::move-cursor signal is a keybinding
    signal which gets emitted when the user initiates a cursor
    movement.
    
    The <keycap>Up</keycap>, <keycap>Down</keycap>,
    <keycap>PageUp</keycap>, <keycap>PageDown</keycap>,
    <keycap>Home</keycap> and <keycap>End</keycap> keys are bound to the
    normal behavior expected by those keys.
    
    When step is equal to [gtk.types.ScrollStep.pages], the page size is defined by
    the #GtkSourceCompletion:proposal-page-size property. It is used for
    the <keycap>PageDown</keycap> and <keycap>PageUp</keycap> keys.
    
    Applications should not connect to it, but may emit it with
    [gobject.global.signalEmitByName] if they need to control the cursor
    programmatically.
  
    ## Parameters
    $(LIST
      * $(B step)       The #GtkScrollStep by which to move the cursor
      * $(B num)       The amount of steps to move the cursor
      * $(B completion) the instance the signal is connected to
    )
  */
  alias MoveCursorCallbackDlg = void delegate(gtk.types.ScrollStep step, int num, gtksource.completion.Completion completion);

  /** ditto */
  alias MoveCursorCallbackFunc = void function(gtk.types.ScrollStep step, int num, gtksource.completion.Completion completion);

  /**
    Connect to MoveCursor signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectMoveCursor(T)(T callback, Flag!"after" after = No.after)
  if (is(T : MoveCursorCallbackDlg) || is(T : MoveCursorCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto completion = getVal!(gtksource.completion.Completion)(_paramVals);
      auto step = getVal!(gtk.types.ScrollStep)(&_paramVals[1]);
      auto num = getVal!(int)(&_paramVals[2]);
      _dClosure.dlg(step, num, completion);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-cursor", closure, after);
  }

  /**
      The #GtkSourceCompletion::move-page signal is a keybinding
    signal which gets emitted when the user initiates a page
    movement (i.e. switches between provider pages).
    
    <keycombo><keycap>Control</keycap><keycap>Left</keycap></keycombo>
    is for going to the previous provider.
    <keycombo><keycap>Control</keycap><keycap>Right</keycap></keycombo>
    is for going to the next provider.
    <keycombo><keycap>Control</keycap><keycap>Home</keycap></keycombo>
    is for displaying all the providers.
    <keycombo><keycap>Control</keycap><keycap>End</keycap></keycombo>
    is for going to the last provider.
    
    When step is equal to #GTK_SCROLL_PAGES, the page size is defined by
    the #GtkSourceCompletion:provider-page-size property.
    
    Applications should not connect to it, but may emit it with
    [gobject.global.signalEmitByName] if they need to control the page selection
    programmatically.
  
    ## Parameters
    $(LIST
      * $(B step)       The #GtkScrollStep by which to move the page
      * $(B num)       The amount of steps to move the page
      * $(B completion) the instance the signal is connected to
    )
  */
  alias MovePageCallbackDlg = void delegate(gtk.types.ScrollStep step, int num, gtksource.completion.Completion completion);

  /** ditto */
  alias MovePageCallbackFunc = void function(gtk.types.ScrollStep step, int num, gtksource.completion.Completion completion);

  /**
    Connect to MovePage signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectMovePage(T)(T callback, Flag!"after" after = No.after)
  if (is(T : MovePageCallbackDlg) || is(T : MovePageCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto completion = getVal!(gtksource.completion.Completion)(_paramVals);
      auto step = getVal!(gtk.types.ScrollStep)(&_paramVals[1]);
      auto num = getVal!(int)(&_paramVals[2]);
      _dClosure.dlg(step, num, completion);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-page", closure, after);
  }

  /**
      Emitted just before starting to populate the completion with providers.
    You can use this signal to add additional attributes in the context.
  
    ## Parameters
    $(LIST
      * $(B context)       The #GtkSourceCompletionContext for the current completion
      * $(B completion) the instance the signal is connected to
    )
  */
  alias PopulateContextCallbackDlg = void delegate(gtksource.completion_context.CompletionContext context, gtksource.completion.Completion completion);

  /** ditto */
  alias PopulateContextCallbackFunc = void function(gtksource.completion_context.CompletionContext context, gtksource.completion.Completion completion);

  /**
    Connect to PopulateContext signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectPopulateContext(T)(T callback, Flag!"after" after = No.after)
  if (is(T : PopulateContextCallbackDlg) || is(T : PopulateContextCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto completion = getVal!(gtksource.completion.Completion)(_paramVals);
      auto context = getVal!(gtksource.completion_context.CompletionContext)(&_paramVals[1]);
      _dClosure.dlg(context, completion);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("populate-context", closure, after);
  }

  /**
      Emitted when the completion window is shown. The default handler
    will actually show the window.
  
    ## Parameters
    $(LIST
      * $(B completion) the instance the signal is connected to
    )
  */
  alias ShowCallbackDlg = void delegate(gtksource.completion.Completion completion);

  /** ditto */
  alias ShowCallbackFunc = void function(gtksource.completion.Completion completion);

  /**
    Connect to Show signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectShow(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ShowCallbackDlg) || is(T : ShowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto completion = getVal!(gtksource.completion.Completion)(_paramVals);
      _dClosure.dlg(completion);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show", closure, after);
  }
}
