/// Module for [Tuples] class
module glib.tuples;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    The #GTuples struct is used to return records (or tuples) from the
    #GRelation by [glib.relation.Relation.select]. It only contains one public
    member - the number of records that matched. To access the matched
    records, you must use [glib.tuples.Tuples.index].

    Deprecated: Rarely used API
*/
class Tuples
{
  GTuples cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.tuples.Tuples");

    cInstance = *cast(GTuples*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `len` field.
      Returns: the number of records that matched.
  */
  @property uint len()
  {
    return (cast(GTuples*)this._cPtr).len;
  }

  /**
      Set `len` field.
      Params:
        propval = the number of records that matched.
  */
  @property void len(uint propval)
  {
    (cast(GTuples*)this._cPtr).len = propval;
  }

  /**
      Frees the records which were returned by [glib.relation.Relation.select]. This
      should always be called after [glib.relation.Relation.select] when you are
      finished with the records. The records are not removed from the
      #GRelation.
  
      Deprecated: Rarely used API
  */
  void destroy()
  {
    g_tuples_destroy(cast(GTuples*)this._cPtr);
  }

  /**
      Gets a field from the records returned by [glib.relation.Relation.select]. It
      returns the given field of the record at the given index. The
      returned value should not be changed.
  
      Params:
        index = the index of the record.
        field = the field to return.
      Returns: the field of the record.
  
      Deprecated: Rarely used API
  */
  void* index(int index, int field)
  {
    auto _retval = g_tuples_index(cast(GTuples*)this._cPtr, index, field);
    return _retval;
  }
}
