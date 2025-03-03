module gtk.numeric_sorter;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.expression;
import gtk.sorter;
import gtk.types;

/**
 * `GtkNumericSorter` is a `GtkSorter` that compares numbers.
 * To obtain the numbers to compare, this sorter evaluates a
 * [gtk.expression.Expression].
 */
class NumericSorter : gtk.sorter.Sorter
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_numeric_sorter_get_type != &gidSymbolNotFound ? gtk_numeric_sorter_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new numeric sorter using the given expression.
   * Smaller numbers will be sorted first. You can call
   * [gtk.numeric_sorter.NumericSorter.setSortOrder] to change this.
   * Params:
   *   expression = The expression to evaluate
   * Returns: a new `GtkNumericSorter`
   */
  this(gtk.expression.Expression expression = null)
  {
    GtkNumericSorter* _cretval;
    _cretval = gtk_numeric_sorter_new(expression ? cast(GtkExpression*)expression.cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the expression that is evaluated to obtain numbers from items.
   * Returns: a `GtkExpression`
   */
  gtk.expression.Expression getExpression()
  {
    GtkExpression* _cretval;
    _cretval = gtk_numeric_sorter_get_expression(cast(GtkNumericSorter*)cPtr);
    auto _retval = _cretval ? new gtk.expression.Expression(cast(GtkExpression*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Gets whether this sorter will sort smaller numbers first.
   * Returns: the order of the numbers
   */
  gtk.types.SortType getSortOrder()
  {
    GtkSortType _cretval;
    _cretval = gtk_numeric_sorter_get_sort_order(cast(GtkNumericSorter*)cPtr);
    gtk.types.SortType _retval = cast(gtk.types.SortType)_cretval;
    return _retval;
  }

  /**
   * Sets the expression that is evaluated to obtain numbers from items.
   * Unless an expression is set on self, the sorter will always
   * compare items as invalid.
   * The expression must have a return type that can be compared
   * numerically, such as %G_TYPE_INT or %G_TYPE_DOUBLE.
   * Params:
   *   expression = a `GtkExpression`
   */
  void setExpression(gtk.expression.Expression expression = null)
  {
    gtk_numeric_sorter_set_expression(cast(GtkNumericSorter*)cPtr, expression ? cast(GtkExpression*)expression.cPtr(No.Dup) : null);
  }

  /**
   * Sets whether to sort smaller numbers before larger ones.
   * Params:
   *   sortOrder = whether to sort smaller numbers first
   */
  void setSortOrder(gtk.types.SortType sortOrder)
  {
    gtk_numeric_sorter_set_sort_order(cast(GtkNumericSorter*)cPtr, sortOrder);
  }
}
