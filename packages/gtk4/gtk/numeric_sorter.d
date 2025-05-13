/// Module for [NumericSorter] class
module gtk.numeric_sorter;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.expression;
import gtk.sorter;
import gtk.types;

/**
    [gtk.numeric_sorter.NumericSorter] is a [gtk.sorter.Sorter] that compares numbers.
    
    To obtain the numbers to compare, this sorter evaluates a
    [gtk.expression.Expression].
*/
class NumericSorter : gtk.sorter.Sorter
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_numeric_sorter_get_type != &gidSymbolNotFound ? gtk_numeric_sorter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NumericSorter self()
  {
    return this;
  }

  /**
      Get `expression` property.
      Returns: The expression to evaluate on items to get a number to compare with.
  */
  @property gtk.expression.Expression expression()
  {
    return getExpression();
  }

  /**
      Set `expression` property.
      Params:
        propval = The expression to evaluate on items to get a number to compare with.
  */
  @property void expression(gtk.expression.Expression propval)
  {
    return setExpression(propval);
  }

  /**
      Get `sortOrder` property.
      Returns: Whether the sorter will sort smaller numbers first.
  */
  @property gtk.types.SortType sortOrder()
  {
    return getSortOrder();
  }

  /**
      Set `sortOrder` property.
      Params:
        propval = Whether the sorter will sort smaller numbers first.
  */
  @property void sortOrder(gtk.types.SortType propval)
  {
    return setSortOrder(propval);
  }

  /**
      Creates a new numeric sorter using the given expression.
      
      Smaller numbers will be sorted first. You can call
      [gtk.numeric_sorter.NumericSorter.setSortOrder] to change this.
  
      Params:
        expression = The expression to evaluate
      Returns: a new [gtk.numeric_sorter.NumericSorter]
  */
  this(gtk.expression.Expression expression = null)
  {
    GtkNumericSorter* _cretval;
    _cretval = gtk_numeric_sorter_new(expression ? cast(GtkExpression*)expression._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the expression that is evaluated to obtain numbers from items.
      Returns: a [gtk.expression.Expression]
  */
  gtk.expression.Expression getExpression()
  {
    GtkExpression* _cretval;
    _cretval = gtk_numeric_sorter_get_expression(cast(GtkNumericSorter*)this._cPtr);
    auto _retval = _cretval ? new gtk.expression.Expression(cast(GtkExpression*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets whether this sorter will sort smaller numbers first.
      Returns: the order of the numbers
  */
  gtk.types.SortType getSortOrder()
  {
    GtkSortType _cretval;
    _cretval = gtk_numeric_sorter_get_sort_order(cast(GtkNumericSorter*)this._cPtr);
    gtk.types.SortType _retval = cast(gtk.types.SortType)_cretval;
    return _retval;
  }

  /**
      Sets the expression that is evaluated to obtain numbers from items.
      
      Unless an expression is set on self, the sorter will always
      compare items as invalid.
      
      The expression must have a return type that can be compared
      numerically, such as `G_TYPE_INT` or `G_TYPE_DOUBLE`.
  
      Params:
        expression = a [gtk.expression.Expression]
  */
  void setExpression(gtk.expression.Expression expression = null)
  {
    gtk_numeric_sorter_set_expression(cast(GtkNumericSorter*)this._cPtr, expression ? cast(GtkExpression*)expression._cPtr(No.Dup) : null);
  }

  /**
      Sets whether to sort smaller numbers before larger ones.
  
      Params:
        sortOrder = whether to sort smaller numbers first
  */
  void setSortOrder(gtk.types.SortType sortOrder)
  {
    gtk_numeric_sorter_set_sort_order(cast(GtkNumericSorter*)this._cPtr, sortOrder);
  }
}
