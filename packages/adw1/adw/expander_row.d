/// Module for [ExpanderRow] class
module adw.expander_row;

import adw.c.functions;
import adw.c.types;
import adw.preferences_row;
import adw.types;
import gid.gid;
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
    A [gtk.list_box_row.ListBoxRow] used to reveal widgets.
    
    <picture>
      <source srcset="expander-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="expander-row.png" alt="expander-row">
    </picture>
    
    The [adw.expander_row.ExpanderRow] widget allows the user to reveal or hide widgets below
    it. It also allows the user to enable the expansion of the row, allowing to
    disable all that the row contains.
    
    ## AdwExpanderRow as GtkBuildable
    
    The [adw.expander_row.ExpanderRow] implementation of the [gtk.buildable.Buildable] interface
    supports adding a child as an suffix widget by specifying “suffix” as the
    “type” attribute of a <child> element.
    
    It also supports adding it as a prefix widget by specifying “prefix” as the
    “type” attribute of a <child> element.
    
    ## CSS nodes
    
    [adw.expander_row.ExpanderRow] has a main CSS node with name `row` and the `.expander`
    style class. It has the `.empty` style class when it contains no children.
    
    It contains the subnodes `row.header` for its main embedded row,
    `list.nested` for the list it can expand, and `image.expander-row-arrow` for
    its arrow.
*/
class ExpanderRow : adw.preferences_row.PreferencesRow
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_expander_row_get_type != &gidSymbolNotFound ? adw_expander_row_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override ExpanderRow self()
  {
    return this;
  }

  /**
      Creates a new [adw.expander_row.ExpanderRow].
      Returns: the newly created [adw.expander_row.ExpanderRow]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_expander_row_new();
    this(_cretval, No.Take);
  }

  /**
      Adds an action widget to self.
  
      Params:
        widget = a widget
  
      Deprecated: Use [adw.expander_row.ExpanderRow.addSuffix] to add a suffix.
  */
  void addAction(gtk.widget.Widget widget)
  {
    adw_expander_row_add_action(cast(AdwExpanderRow*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
  }

  /**
      Adds a prefix widget to self.
  
      Params:
        widget = a widget
  */
  void addPrefix(gtk.widget.Widget widget)
  {
    adw_expander_row_add_prefix(cast(AdwExpanderRow*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
  }

  /**
      Adds a widget to self.
      
      The widget will appear in the expanding list below self.
  
      Params:
        child = a widget
  */
  void addRow(gtk.widget.Widget child)
  {
    adw_expander_row_add_row(cast(AdwExpanderRow*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
      Adds an suffix widget to self.
  
      Params:
        widget = a widget
  */
  void addSuffix(gtk.widget.Widget widget)
  {
    adw_expander_row_add_suffix(cast(AdwExpanderRow*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
  }

  /**
      Gets whether the expansion of self is enabled.
      Returns: whether the expansion of self is enabled.
  */
  bool getEnableExpansion()
  {
    bool _retval;
    _retval = adw_expander_row_get_enable_expansion(cast(AdwExpanderRow*)cPtr);
    return _retval;
  }

  /**
      Gets whether self is expanded.
      Returns: whether self is expanded
  */
  bool getExpanded()
  {
    bool _retval;
    _retval = adw_expander_row_get_expanded(cast(AdwExpanderRow*)cPtr);
    return _retval;
  }

  /**
      Gets the icon name for self.
      Returns: the icon name for self
  
      Deprecated: Use [adw.expander_row.ExpanderRow.addPrefix] to add an icon.
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = adw_expander_row_get_icon_name(cast(AdwExpanderRow*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether the switch enabling the expansion of self is visible.
      Returns: whether the switch enabling the expansion is visible
  */
  bool getShowEnableSwitch()
  {
    bool _retval;
    _retval = adw_expander_row_get_show_enable_switch(cast(AdwExpanderRow*)cPtr);
    return _retval;
  }

  /**
      Gets the subtitle for self.
      Returns: the subtitle for self
  */
  string getSubtitle()
  {
    const(char)* _cretval;
    _cretval = adw_expander_row_get_subtitle(cast(AdwExpanderRow*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the number of lines at the end of which the subtitle label will be
      ellipsized.
      Returns: the number of lines at the end of which the subtitle label will be
          ellipsized
  */
  int getSubtitleLines()
  {
    int _retval;
    _retval = adw_expander_row_get_subtitle_lines(cast(AdwExpanderRow*)cPtr);
    return _retval;
  }

  /**
      Gets the number of lines at the end of which the title label will be
      ellipsized.
      Returns: the number of lines at the end of which the title label will be
          ellipsized
  */
  int getTitleLines()
  {
    int _retval;
    _retval = adw_expander_row_get_title_lines(cast(AdwExpanderRow*)cPtr);
    return _retval;
  }

  /**
      Removes a child from self.
  
      Params:
        child = the child to be removed
  */
  void remove(gtk.widget.Widget child)
  {
    adw_expander_row_remove(cast(AdwExpanderRow*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
      Sets whether the expansion of self is enabled.
  
      Params:
        enableExpansion = whether to enable the expansion
  */
  void setEnableExpansion(bool enableExpansion)
  {
    adw_expander_row_set_enable_expansion(cast(AdwExpanderRow*)cPtr, enableExpansion);
  }

  /**
      Sets whether self is expanded.
  
      Params:
        expanded = whether to expand the row
  */
  void setExpanded(bool expanded)
  {
    adw_expander_row_set_expanded(cast(AdwExpanderRow*)cPtr, expanded);
  }

  /**
      Sets the icon name for self.
  
      Params:
        iconName = the icon name
  
      Deprecated: Use [adw.expander_row.ExpanderRow.addPrefix] to add an icon.
  */
  void setIconName(string iconName = null)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    adw_expander_row_set_icon_name(cast(AdwExpanderRow*)cPtr, _iconName);
  }

  /**
      Sets whether the switch enabling the expansion of self is visible.
  
      Params:
        showEnableSwitch = whether to show the switch enabling the expansion
  */
  void setShowEnableSwitch(bool showEnableSwitch)
  {
    adw_expander_row_set_show_enable_switch(cast(AdwExpanderRow*)cPtr, showEnableSwitch);
  }

  /**
      Sets the subtitle for self.
      
      The subtitle is interpreted as Pango markup unless
      `propertyPreferencesRow:use-markup` is set to `FALSE`.
  
      Params:
        subtitle = the subtitle
  */
  void setSubtitle(string subtitle)
  {
    const(char)* _subtitle = subtitle.toCString(No.Alloc);
    adw_expander_row_set_subtitle(cast(AdwExpanderRow*)cPtr, _subtitle);
  }

  /**
      Sets the number of lines at the end of which the subtitle label will be
      ellipsized.
      
      If the value is 0, the number of lines won't be limited.
  
      Params:
        subtitleLines = the number of lines at the end of which the subtitle label will be ellipsized
  */
  void setSubtitleLines(int subtitleLines)
  {
    adw_expander_row_set_subtitle_lines(cast(AdwExpanderRow*)cPtr, subtitleLines);
  }

  /**
      Sets the number of lines at the end of which the title label will be
      ellipsized.
      
      If the value is 0, the number of lines won't be limited.
  
      Params:
        titleLines = the number of lines at the end of which the title label will be ellipsized
  */
  void setTitleLines(int titleLines)
  {
    adw_expander_row_set_title_lines(cast(AdwExpanderRow*)cPtr, titleLines);
  }
}
