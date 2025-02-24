module atk.object;

import atk.c.functions;
import atk.c.types;
import atk.property_values;
import atk.relation_set;
import atk.state_set;
import atk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;

/**
 * The base object class for the Accessibility Toolkit API.
 * This class is the primary class for accessibility support via the
 * Accessibility ToolKit $(LPAREN)ATK$(RPAREN).  Objects which are instances of
 * #AtkObject $(LPAREN)or instances of AtkObject-derived types$(RPAREN) are queried
 * for properties which relate basic $(LPAREN)and generic$(RPAREN) properties of a UI
 * component such as name and description.  Instances of #AtkObject
 * may also be queried as to whether they implement other ATK
 * interfaces $(LPAREN)e.g. #AtkAction, #AtkComponent, etc.$(RPAREN), as appropriate
 * to the role which a given UI component plays in a user interface.
 * All UI components in an application which provide useful
 * information or services to the user must provide corresponding
 * #AtkObject instances on request $(LPAREN)in GTK+, for instance, usually on
 * a call to #gtk_widget_get_accessible $(LPAREN)$(RPAREN)$(RPAREN), either via ATK support
 * built into the toolkit for the widget class or ancestor class, or
 * in the case of custom widgets, if the inherited #AtkObject
 * implementation is insufficient, via instances of a new #AtkObject
 * subclass.
 * See class@AtkObjectFactory, class@AtkRegistry.  $(LPAREN)GTK+ users see also
 * #GtkAccessible$(RPAREN).
 */
class ObjectAtk : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_object_get_type != &gidSymbolNotFound ? atk_object_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Adds a relationship of the specified type with the specified target.
   * Params:
   *   relationship = The #AtkRelationType of the relation
   *   target = The #AtkObject which is to be the target of the relation.
   * Returns: TRUE if the relationship is added.
   */
  bool addRelationship(RelationType relationship, ObjectAtk target)
  {
    bool _retval;
    _retval = atk_object_add_relationship(cast(AtkObject*)cPtr, relationship, target ? cast(AtkObject*)target.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Gets the accessible id of the accessible.
   * Returns: a character string representing the accessible id of the object, or
   *   NULL if no such string was set.
   */
  string getAccessibleId()
  {
    const(char)* _cretval;
    _cretval = atk_object_get_accessible_id(cast(AtkObject*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets the accessible description of the accessible.
   * Returns: a character string representing the accessible description
   *   of the accessible.
   */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = atk_object_get_description(cast(AtkObject*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets the help text associated with the accessible.
   * Returns: a character string representing the help text or the object, or
   *   NULL if no such string was set.
   */
  string getHelpText()
  {
    const(char)* _cretval;
    _cretval = atk_object_get_help_text(cast(AtkObject*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets the 0-based index of this accessible in its parent; returns -1 if the
   * accessible does not have an accessible parent.
   * Returns: an integer which is the index of the accessible in its parent
   */
  int getIndexInParent()
  {
    int _retval;
    _retval = atk_object_get_index_in_parent(cast(AtkObject*)cPtr);
    return _retval;
  }

  /**
   * Gets the layer of the accessible.
   * Returns: an #AtkLayer which is the layer of the accessible

   * Deprecated: Use atk_component_get_layer instead.
   */
  Layer getLayer()
  {
    AtkLayer _cretval;
    _cretval = atk_object_get_layer(cast(AtkObject*)cPtr);
    Layer _retval = cast(Layer)_cretval;
    return _retval;
  }

  /**
   * Gets the zorder of the accessible. The value G_MININT will be returned
   * if the layer of the accessible is not ATK_LAYER_MDI.
   * Returns: a gint which is the zorder of the accessible, i.e. the depth at
   *   which the component is shown in relation to other components in the same
   *   container.

   * Deprecated: Use atk_component_get_mdi_zorder instead.
   */
  int getMdiZorder()
  {
    int _retval;
    _retval = atk_object_get_mdi_zorder(cast(AtkObject*)cPtr);
    return _retval;
  }

  /**
   * Gets the number of accessible children of the accessible.
   * Returns: an integer representing the number of accessible children
   *   of the accessible.
   */
  int getNAccessibleChildren()
  {
    int _retval;
    _retval = atk_object_get_n_accessible_children(cast(AtkObject*)cPtr);
    return _retval;
  }

  /**
   * Gets the accessible name of the accessible.
   * Returns: a character string representing the accessible name of the object.
   */
  string getName()
  {
    const(char)* _cretval;
    _cretval = atk_object_get_name(cast(AtkObject*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets a UTF-8 string indicating the POSIX-style LC_MESSAGES locale
   * of accessible.
   * Returns: a UTF-8 string indicating the POSIX-style LC_MESSAGES
   *   locale of accessible.
   */
  string getObjectLocale()
  {
    const(char)* _cretval;
    _cretval = atk_object_get_object_locale(cast(AtkObject*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets the accessible parent of the accessible. By default this is
   * the one assigned with [Atk.ObjectAtk.setParent], but it is assumed
   * that ATK implementors have ways to get the parent of the object
   * without the need of assigning it manually with
   * [Atk.ObjectAtk.setParent], and will return it with this method.
   * If you are only interested on the parent assigned with
   * [Atk.ObjectAtk.setParent], use [Atk.ObjectAtk.peekParent].
   * Returns: an #AtkObject representing the accessible
   *   parent of the accessible
   */
  ObjectAtk getParent()
  {
    AtkObject* _cretval;
    _cretval = atk_object_get_parent(cast(AtkObject*)cPtr);
    auto _retval = ObjectG.getDObject!ObjectAtk(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the role of the accessible.
   * Returns: an #AtkRole which is the role of the accessible
   */
  Role getRole()
  {
    AtkRole _cretval;
    _cretval = atk_object_get_role(cast(AtkObject*)cPtr);
    Role _retval = cast(Role)_cretval;
    return _retval;
  }

  /**
   * This function is called when implementing subclasses of #AtkObject.
   * It does initialization required for the new object. It is intended
   * that this function should called only in the ..._new$(LPAREN)$(RPAREN) functions used
   * to create an instance of a subclass of #AtkObject
   * Params:
   *   data = a #gpointer which identifies the object for which the AtkObject was created.
   */
  void initialize(void* data)
  {
    atk_object_initialize(cast(AtkObject*)cPtr, data);
  }

  /**
   * Emits a state-change signal for the specified state.
   * Note that as a general rule when the state of an existing object changes,
   * emitting a notification is expected.
   * Params:
   *   state = an #AtkState whose state is changed
   *   value = a gboolean which indicates whether the state is being set on or off
   */
  void notifyStateChange(State state, bool value)
  {
    atk_object_notify_state_change(cast(AtkObject*)cPtr, state, value);
  }

  /**
   * Gets the accessible parent of the accessible, if it has been
   * manually assigned with atk_object_set_parent. Otherwise, this
   * function returns %NULL.
   * This method is intended as an utility for ATK implementors, and not
   * to be exposed to accessible tools. See [Atk.ObjectAtk.getParent] for
   * further reference.
   * Returns: an #AtkObject representing the accessible
   *   parent of the accessible if assigned
   */
  ObjectAtk peekParent()
  {
    AtkObject* _cretval;
    _cretval = atk_object_peek_parent(cast(AtkObject*)cPtr);
    auto _retval = ObjectG.getDObject!ObjectAtk(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets a reference to the specified accessible child of the object.
   * The accessible children are 0-based so the first accessible child is
   * at index 0, the second at index 1 and so on.
   * Params:
   *   i = a gint representing the position of the child, starting from 0
   * Returns: an #AtkObject representing the specified
   *   accessible child of the accessible.
   */
  ObjectAtk refAccessibleChild(int i)
  {
    AtkObject* _cretval;
    _cretval = atk_object_ref_accessible_child(cast(AtkObject*)cPtr, i);
    auto _retval = ObjectG.getDObject!ObjectAtk(cast(AtkObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Gets the #AtkRelationSet associated with the object.
   * Returns: an #AtkRelationSet representing the relation set
   *   of the object.
   */
  RelationSet refRelationSet()
  {
    AtkRelationSet* _cretval;
    _cretval = atk_object_ref_relation_set(cast(AtkObject*)cPtr);
    auto _retval = ObjectG.getDObject!RelationSet(cast(AtkRelationSet*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Gets a reference to the state set of the accessible; the caller must
   * unreference it when it is no longer needed.
   * Returns: a reference to an #AtkStateSet which is the state
   *   set of the accessible
   */
  StateSet refStateSet()
  {
    AtkStateSet* _cretval;
    _cretval = atk_object_ref_state_set(cast(AtkObject*)cPtr);
    auto _retval = ObjectG.getDObject!StateSet(cast(AtkStateSet*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Removes a property change handler.
   * Params:
   *   handlerId = a guint which identifies the handler to be removed.

   * Deprecated: See [Atk.ObjectAtk.connectPropertyChangeHandler]
   */
  void removePropertyChangeHandler(uint handlerId)
  {
    atk_object_remove_property_change_handler(cast(AtkObject*)cPtr, handlerId);
  }

  /**
   * Removes a relationship of the specified type with the specified target.
   * Params:
   *   relationship = The #AtkRelationType of the relation
   *   target = The #AtkObject which is the target of the relation to be removed.
   * Returns: TRUE if the relationship is removed.
   */
  bool removeRelationship(RelationType relationship, ObjectAtk target)
  {
    bool _retval;
    _retval = atk_object_remove_relationship(cast(AtkObject*)cPtr, relationship, target ? cast(AtkObject*)target.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Sets the accessible ID of the accessible.  This is not meant to be presented
   * to the user, but to be an ID which is stable over application development.
   * Typically, this is the gtkbuilder ID. Such an ID will be available for
   * instance to identify a given well-known accessible object for tailored screen
   * reading, or for automatic regression testing.
   * Params:
   *   id = a character string to be set as the accessible id
   */
  void setAccessibleId(string id)
  {
    const(char)* _id = id.toCString(No.Alloc);
    atk_object_set_accessible_id(cast(AtkObject*)cPtr, _id);
  }

  /**
   * Sets the accessible description of the accessible. You can't set
   * the description to NULL. This is reserved for the initial value. In
   * this aspect NULL is similar to ATK_ROLE_UNKNOWN. If you want to set
   * the name to a empty value you can use "".
   * Params:
   *   description = a character string to be set as the accessible description
   */
  void setDescription(string description)
  {
    const(char)* _description = description.toCString(No.Alloc);
    atk_object_set_description(cast(AtkObject*)cPtr, _description);
  }

  /**
   * Sets the help text associated with the accessible. This can be used to
   * expose context-sensitive information to help a user understand how to
   * interact with the object.
   * Params:
   *   helpText = a character string to be set as the accessible's help text
   */
  void setHelpText(string helpText)
  {
    const(char)* _helpText = helpText.toCString(No.Alloc);
    atk_object_set_help_text(cast(AtkObject*)cPtr, _helpText);
  }

  /**
   * Sets the accessible name of the accessible. You can't set the name
   * to NULL. This is reserved for the initial value. In this aspect
   * NULL is similar to ATK_ROLE_UNKNOWN. If you want to set the name to
   * a empty value you can use "".
   * Params:
   *   name = a character string to be set as the accessible name
   */
  void setName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    atk_object_set_name(cast(AtkObject*)cPtr, _name);
  }

  /**
   * Sets the accessible parent of the accessible. parent can be NULL.
   * Params:
   *   parent = an #AtkObject to be set as the accessible parent
   */
  void setParent(ObjectAtk parent)
  {
    atk_object_set_parent(cast(AtkObject*)cPtr, parent ? cast(AtkObject*)parent.cPtr(No.Dup) : null);
  }

  /**
   * Sets the role of the accessible.
   * Params:
   *   role = an #AtkRole to be set as the role
   */
  void setRole(Role role)
  {
    atk_object_set_role(cast(AtkObject*)cPtr, role);
  }

  /**
   * The "active-descendant-changed" signal is emitted by an object
   * which has the state ATK_STATE_MANAGES_DESCENDANTS when the focus
   * object in the object changes. For instance, a table will emit the
   * signal when the cell in the table which has focus changes.
   * Params
   *   arg1 = the newly focused object.
   *   objectAtk = the instance the signal is connected to
   */
  alias ActiveDescendantChangedCallbackDlg = void delegate(ObjectAtk arg1, ObjectAtk objectAtk);
  alias ActiveDescendantChangedCallbackFunc = void function(ObjectAtk arg1, ObjectAtk objectAtk);

  /**
   * Connect to ActiveDescendantChanged signal.
   * Params:
   *   detail = Signal detail or null (default)
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectActiveDescendantChanged(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (is(T : ActiveDescendantChangedCallbackDlg) || is(T : ActiveDescendantChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto objectAtk = getVal!ObjectAtk(_paramVals);
      auto arg1 = getVal!ObjectAtk(&_paramVals[1]);
      _dClosure.dlg(arg1, objectAtk);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("active-descendant-changed"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
   * The "announcement" signal can be emitted to pass an announcement on to
   * be read by a screen reader.
   * Depcrecated $(LPAREN)2.50$(RPAREN): Use AtkObject::notification instead.
   * Params
   *   arg1 = the text to be announced.
   *   objectAtk = the instance the signal is connected to
   */
  alias AnnouncementCallbackDlg = void delegate(string arg1, ObjectAtk objectAtk);
  alias AnnouncementCallbackFunc = void function(string arg1, ObjectAtk objectAtk);

  /**
   * Connect to Announcement signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectAnnouncement(T)(T callback, Flag!"After" after = No.After)
  if (is(T : AnnouncementCallbackDlg) || is(T : AnnouncementCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto objectAtk = getVal!ObjectAtk(_paramVals);
      auto arg1 = getVal!string(&_paramVals[1]);
      _dClosure.dlg(arg1, objectAtk);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("announcement", closure, after);
  }

  /**
   * The "attribute-changed" signal should be emitted when one of an object's
   * attributes changes.
   * Params
   *   arg1 = the name of the attribute being modified, or %NULL if not
   *     available.
   *   arg2 = the attribute's new value, or %null if not available.
   *   objectAtk = the instance the signal is connected to
   */
  alias AttributeChangedCallbackDlg = void delegate(string arg1, string arg2, ObjectAtk objectAtk);
  alias AttributeChangedCallbackFunc = void function(string arg1, string arg2, ObjectAtk objectAtk);

  /**
   * Connect to AttributeChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectAttributeChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : AttributeChangedCallbackDlg) || is(T : AttributeChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto objectAtk = getVal!ObjectAtk(_paramVals);
      auto arg1 = getVal!string(&_paramVals[1]);
      auto arg2 = getVal!string(&_paramVals[2]);
      _dClosure.dlg(arg1, arg2, objectAtk);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("attribute-changed", closure, after);
  }

  /**
   * The signal "children-changed" is emitted when a child is added or
   * removed from an object. It supports two details: "add" and
   * "remove"
   * Params
   *   arg1 = The index of the added or removed child. The value can be
   *     -1. This is used if the value is not known by the implementor
   *     when the child is added/removed or irrelevant.
   *   arg2 = A gpointer to the child AtkObject which was added or
   *     removed. If the child was removed, it is possible that it is not
   *     available for the implementor. In that case this pointer can be
   *     NULL.
   *   objectAtk = the instance the signal is connected to
   */
  alias ChildrenChangedCallbackDlg = void delegate(uint arg1, ObjectAtk arg2, ObjectAtk objectAtk);
  alias ChildrenChangedCallbackFunc = void function(uint arg1, ObjectAtk arg2, ObjectAtk objectAtk);

  /**
   * Connect to ChildrenChanged signal.
   * Params:
   *   detail = Signal detail or null (default)
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectChildrenChanged(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (is(T : ChildrenChangedCallbackDlg) || is(T : ChildrenChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto objectAtk = getVal!ObjectAtk(_paramVals);
      auto arg1 = getVal!uint(&_paramVals[1]);
      auto arg2 = getVal!ObjectAtk(&_paramVals[2]);
      _dClosure.dlg(arg1, arg2, objectAtk);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("children-changed"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
   * The signal "focus-event" is emitted when an object gained or lost
   * focus.
   * Params
   *   arg1 = a boolean value which indicates whether the object gained
   *     or lost focus.
   *   objectAtk = the instance the signal is connected to

   * Deprecated: Use the #AtkObject::state-change signal instead.
   */
  alias FocusEventCallbackDlg = void delegate(bool arg1, ObjectAtk objectAtk);
  alias FocusEventCallbackFunc = void function(bool arg1, ObjectAtk objectAtk);

  /**
   * Connect to FocusEvent signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectFocusEvent(T)(T callback, Flag!"After" after = No.After)
  if (is(T : FocusEventCallbackDlg) || is(T : FocusEventCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto objectAtk = getVal!ObjectAtk(_paramVals);
      auto arg1 = getVal!bool(&_paramVals[1]);
      _dClosure.dlg(arg1, objectAtk);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("focus-event", closure, after);
  }

  /**
   * The "notification" signal can be emitted to pass an announcement on to
   * be read by a screen reader.
   * Params
   *   arg1 = the text to be announced.
   *   arg2 = an #AtkLive specifying the politeness of the notification.
   *     Should be either ATK_LIVE_POLITE or ATK_LIVE_ASSERTIVE.
   *   objectAtk = the instance the signal is connected to
   */
  alias NotificationCallbackDlg = void delegate(string arg1, int arg2, ObjectAtk objectAtk);
  alias NotificationCallbackFunc = void function(string arg1, int arg2, ObjectAtk objectAtk);

  /**
   * Connect to Notification signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectNotification(T)(T callback, Flag!"After" after = No.After)
  if (is(T : NotificationCallbackDlg) || is(T : NotificationCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto objectAtk = getVal!ObjectAtk(_paramVals);
      auto arg1 = getVal!string(&_paramVals[1]);
      auto arg2 = getVal!int(&_paramVals[2]);
      _dClosure.dlg(arg1, arg2, objectAtk);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("notification", closure, after);
  }

  /**
   * The signal "property-change" is emitted when an object's property
   * value changes. arg1 contains an #AtkPropertyValues with the name
   * and the new value of the property whose value has changed. Note
   * that, as with GObject notify, getting this signal does not
   * guarantee that the value of the property has actually changed; it
   * may also be emitted when the setter of the property is called to
   * reinstate the previous value.
   * Toolkit implementor note: ATK implementors should use
   * [GObject.ObjectG.notify] to emit property-changed
   * notifications. #AtkObject::property-changed is needed by the
   * implementation of [Atk.Global.addGlobalEventListener] because GObject
   * notify doesn't support emission hooks.
   * Params
   *   arg1 = an #AtkPropertyValues containing the new
   *     value of the property which changed.
   *   objectAtk = the instance the signal is connected to
   */
  alias PropertyChangeCallbackDlg = void delegate(PropertyValues arg1, ObjectAtk objectAtk);
  alias PropertyChangeCallbackFunc = void function(PropertyValues arg1, ObjectAtk objectAtk);

  /**
   * Connect to PropertyChange signal.
   * Params:
   *   detail = Signal detail or null (default)
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectPropertyChange(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (is(T : PropertyChangeCallbackDlg) || is(T : PropertyChangeCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto objectAtk = getVal!ObjectAtk(_paramVals);
      auto arg1 = getVal!PropertyValues(&_paramVals[1]);
      _dClosure.dlg(arg1, objectAtk);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("property-change"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
   * The "state-change" signal is emitted when an object's state
   * changes.  The detail value identifies the state type which has
   * changed.
   * Params
   *   arg1 = The name of the state which has changed
   *   arg2 = A boolean which indicates whether the state has been set or unset.
   *   objectAtk = the instance the signal is connected to
   */
  alias StateChangeCallbackDlg = void delegate(string arg1, bool arg2, ObjectAtk objectAtk);
  alias StateChangeCallbackFunc = void function(string arg1, bool arg2, ObjectAtk objectAtk);

  /**
   * Connect to StateChange signal.
   * Params:
   *   detail = Signal detail or null (default)
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectStateChange(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (is(T : StateChangeCallbackDlg) || is(T : StateChangeCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto objectAtk = getVal!ObjectAtk(_paramVals);
      auto arg1 = getVal!string(&_paramVals[1]);
      auto arg2 = getVal!bool(&_paramVals[2]);
      _dClosure.dlg(arg1, arg2, objectAtk);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("state-change"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
   * The "visible-data-changed" signal is emitted when the visual
   * appearance of the object changed.
   *   objectAtk = the instance the signal is connected to
   */
  alias VisibleDataChangedCallbackDlg = void delegate(ObjectAtk objectAtk);
  alias VisibleDataChangedCallbackFunc = void function(ObjectAtk objectAtk);

  /**
   * Connect to VisibleDataChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectVisibleDataChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : VisibleDataChangedCallbackDlg) || is(T : VisibleDataChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto objectAtk = getVal!ObjectAtk(_paramVals);
      _dClosure.dlg(objectAtk);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("visible-data-changed", closure, after);
  }
}
