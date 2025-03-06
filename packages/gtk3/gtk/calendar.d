module gtk.calendar;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    #GtkCalendar is a widget that displays a Gregorian calendar, one month
  at a time. It can be created with [gtk.calendar.Calendar.new_].
  
  The month and year currently displayed can be altered with
  [gtk.calendar.Calendar.selectMonth]. The exact day can be selected from the
  displayed month using [gtk.calendar.Calendar.selectDay].
  
  To place a visual marker on a particular day, use [gtk.calendar.Calendar.markDay]
  and to remove the marker, [gtk.calendar.Calendar.unmarkDay]. Alternative, all
  marks can be cleared with [gtk.calendar.Calendar.clearMarks].
  
  The way in which the calendar itself is displayed can be altered using
  [gtk.calendar.Calendar.setDisplayOptions].
  
  The selected date can be retrieved from a #GtkCalendar using
  [gtk.calendar.Calendar.getDate].
  
  Users should be aware that, although the Gregorian calendar is the
  legal calendar in most countries, it was adopted progressively
  between 1582 and 1929. Display before these dates is likely to be
  historically incorrect.
*/
class Calendar : gtk.widget.Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_calendar_get_type != &gidSymbolNotFound ? gtk_calendar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
      Creates a new calendar, with the current date being selected.
    Returns:     a newly #GtkCalendar widget
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_calendar_new();
    this(_cretval, No.Take);
  }

  /**
      Remove all visual markers.
  */
  void clearMarks()
  {
    gtk_calendar_clear_marks(cast(GtkCalendar*)cPtr);
  }

  /**
      Obtains the selected date from a #GtkCalendar.
    Params:
      year =       location to store the year as a decimal
            number (e.g. 2011), or null
      month =       location to store the month number
            (between 0 and 11), or null
      day =       location to store the day number (between
            1 and 31), or null
  */
  void getDate(out uint year, out uint month, out uint day)
  {
    gtk_calendar_get_date(cast(GtkCalendar*)cPtr, cast(uint*)&year, cast(uint*)&month, cast(uint*)&day);
  }

  /**
      Returns if the day of the calendar is already marked.
    Params:
      day =       the day number between 1 and 31.
    Returns:     whether the day is marked.
  */
  bool getDayIsMarked(uint day)
  {
    bool _retval;
    _retval = gtk_calendar_get_day_is_marked(cast(GtkCalendar*)cPtr, day);
    return _retval;
  }

  /**
      Queries the height of detail cells, in rows.
    See #GtkCalendar:detail-width-chars.
    Returns:     The height of detail cells, in rows.
  */
  int getDetailHeightRows()
  {
    int _retval;
    _retval = gtk_calendar_get_detail_height_rows(cast(GtkCalendar*)cPtr);
    return _retval;
  }

  /**
      Queries the width of detail cells, in characters.
    See #GtkCalendar:detail-width-chars.
    Returns:     The width of detail cells, in characters.
  */
  int getDetailWidthChars()
  {
    int _retval;
    _retval = gtk_calendar_get_detail_width_chars(cast(GtkCalendar*)cPtr);
    return _retval;
  }

  /**
      Returns the current display options of calendar.
    Returns:     the display options.
  */
  gtk.types.CalendarDisplayOptions getDisplayOptions()
  {
    GtkCalendarDisplayOptions _cretval;
    _cretval = gtk_calendar_get_display_options(cast(GtkCalendar*)cPtr);
    gtk.types.CalendarDisplayOptions _retval = cast(gtk.types.CalendarDisplayOptions)_cretval;
    return _retval;
  }

  /**
      Places a visual marker on a particular day.
    Params:
      day =       the day number to mark between 1 and 31.
  */
  void markDay(uint day)
  {
    gtk_calendar_mark_day(cast(GtkCalendar*)cPtr, day);
  }

  /**
      Selects a day from the current month.
    Params:
      day =       the day number between 1 and 31, or 0 to unselect
          the currently selected day.
  */
  void selectDay(uint day)
  {
    gtk_calendar_select_day(cast(GtkCalendar*)cPtr, day);
  }

  /**
      Shifts the calendar to a different month.
    Params:
      month =       a month number between 0 and 11.
      year =       the year the month is in.
  */
  void selectMonth(uint month, uint year)
  {
    gtk_calendar_select_month(cast(GtkCalendar*)cPtr, month, year);
  }

  /**
      Installs a function which provides Pango markup with detail information
    for each day. Examples for such details are holidays or appointments. That
    information is shown below each day when #GtkCalendar:show-details is set.
    A tooltip containing with full detail information is provided, if the entire
    text should not fit into the details area, or if #GtkCalendar:show-details
    is not set.
    
    The size of the details area can be restricted by setting the
    #GtkCalendar:detail-width-chars and #GtkCalendar:detail-height-rows
    properties.
    Params:
      func =       a function providing details for each day.
  */
  void setDetailFunc(gtk.types.CalendarDetailFunc func)
  {
    extern(C) char* _funcCallback(GtkCalendar* calendar, uint year, uint month, uint day, void* userData)
    {
      string _dretval;
      auto _dlg = cast(gtk.types.CalendarDetailFunc*)userData;

      _dretval = (*_dlg)(ObjectG.getDObject!(gtk.calendar.Calendar)(cast(void*)calendar, No.Take), year, month, day);
      char* _retval = _dretval.toCString(Yes.Alloc);

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_calendar_set_detail_func(cast(GtkCalendar*)cPtr, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Updates the height of detail cells.
    See #GtkCalendar:detail-height-rows.
    Params:
      rows =       detail height in rows.
  */
  void setDetailHeightRows(int rows)
  {
    gtk_calendar_set_detail_height_rows(cast(GtkCalendar*)cPtr, rows);
  }

  /**
      Updates the width of detail cells.
    See #GtkCalendar:detail-width-chars.
    Params:
      chars =       detail width in characters.
  */
  void setDetailWidthChars(int chars)
  {
    gtk_calendar_set_detail_width_chars(cast(GtkCalendar*)cPtr, chars);
  }

  /**
      Sets display options (whether to display the heading and the month
    headings).
    Params:
      flags =       the display options to set
  */
  void setDisplayOptions(gtk.types.CalendarDisplayOptions flags)
  {
    gtk_calendar_set_display_options(cast(GtkCalendar*)cPtr, flags);
  }

  /**
      Removes the visual marker from a particular day.
    Params:
      day =       the day number to unmark between 1 and 31.
  */
  void unmarkDay(uint day)
  {
    gtk_calendar_unmark_day(cast(GtkCalendar*)cPtr, day);
  }

  /**
      Emitted when the user selects a day.
  
    ## Parameters
    $(LIST
      * $(B calendar) the instance the signal is connected to
    )
  */
  alias DaySelectedCallbackDlg = void delegate(gtk.calendar.Calendar calendar);

  /** ditto */
  alias DaySelectedCallbackFunc = void function(gtk.calendar.Calendar calendar);

  /**
    Connect to DaySelected signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDaySelected(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DaySelectedCallbackDlg) || is(T : DaySelectedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto calendar = getVal!(gtk.calendar.Calendar)(_paramVals);
      _dClosure.dlg(calendar);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("day-selected", closure, after);
  }

  /**
      Emitted when the user double-clicks a day.
  
    ## Parameters
    $(LIST
      * $(B calendar) the instance the signal is connected to
    )
  */
  alias DaySelectedDoubleClickCallbackDlg = void delegate(gtk.calendar.Calendar calendar);

  /** ditto */
  alias DaySelectedDoubleClickCallbackFunc = void function(gtk.calendar.Calendar calendar);

  /**
    Connect to DaySelectedDoubleClick signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDaySelectedDoubleClick(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DaySelectedDoubleClickCallbackDlg) || is(T : DaySelectedDoubleClickCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto calendar = getVal!(gtk.calendar.Calendar)(_paramVals);
      _dClosure.dlg(calendar);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("day-selected-double-click", closure, after);
  }

  /**
      Emitted when the user clicks a button to change the selected month on a
    calendar.
  
    ## Parameters
    $(LIST
      * $(B calendar) the instance the signal is connected to
    )
  */
  alias MonthChangedCallbackDlg = void delegate(gtk.calendar.Calendar calendar);

  /** ditto */
  alias MonthChangedCallbackFunc = void function(gtk.calendar.Calendar calendar);

  /**
    Connect to MonthChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectMonthChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MonthChangedCallbackDlg) || is(T : MonthChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto calendar = getVal!(gtk.calendar.Calendar)(_paramVals);
      _dClosure.dlg(calendar);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("month-changed", closure, after);
  }

  /**
      Emitted when the user switched to the next month.
  
    ## Parameters
    $(LIST
      * $(B calendar) the instance the signal is connected to
    )
  */
  alias NextMonthCallbackDlg = void delegate(gtk.calendar.Calendar calendar);

  /** ditto */
  alias NextMonthCallbackFunc = void function(gtk.calendar.Calendar calendar);

  /**
    Connect to NextMonth signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectNextMonth(T)(T callback, Flag!"After" after = No.After)
  if (is(T : NextMonthCallbackDlg) || is(T : NextMonthCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto calendar = getVal!(gtk.calendar.Calendar)(_paramVals);
      _dClosure.dlg(calendar);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("next-month", closure, after);
  }

  /**
      Emitted when user switched to the next year.
  
    ## Parameters
    $(LIST
      * $(B calendar) the instance the signal is connected to
    )
  */
  alias NextYearCallbackDlg = void delegate(gtk.calendar.Calendar calendar);

  /** ditto */
  alias NextYearCallbackFunc = void function(gtk.calendar.Calendar calendar);

  /**
    Connect to NextYear signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectNextYear(T)(T callback, Flag!"After" after = No.After)
  if (is(T : NextYearCallbackDlg) || is(T : NextYearCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto calendar = getVal!(gtk.calendar.Calendar)(_paramVals);
      _dClosure.dlg(calendar);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("next-year", closure, after);
  }

  /**
      Emitted when the user switched to the previous month.
  
    ## Parameters
    $(LIST
      * $(B calendar) the instance the signal is connected to
    )
  */
  alias PrevMonthCallbackDlg = void delegate(gtk.calendar.Calendar calendar);

  /** ditto */
  alias PrevMonthCallbackFunc = void function(gtk.calendar.Calendar calendar);

  /**
    Connect to PrevMonth signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectPrevMonth(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PrevMonthCallbackDlg) || is(T : PrevMonthCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto calendar = getVal!(gtk.calendar.Calendar)(_paramVals);
      _dClosure.dlg(calendar);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("prev-month", closure, after);
  }

  /**
      Emitted when user switched to the previous year.
  
    ## Parameters
    $(LIST
      * $(B calendar) the instance the signal is connected to
    )
  */
  alias PrevYearCallbackDlg = void delegate(gtk.calendar.Calendar calendar);

  /** ditto */
  alias PrevYearCallbackFunc = void function(gtk.calendar.Calendar calendar);

  /**
    Connect to PrevYear signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectPrevYear(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PrevYearCallbackDlg) || is(T : PrevYearCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto calendar = getVal!(gtk.calendar.Calendar)(_paramVals);
      _dClosure.dlg(calendar);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("prev-year", closure, after);
  }
}
