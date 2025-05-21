/// Module for [FinishOptions] class
module arrowdataset.finish_options;

import arrow.schema;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.types;
import gid.gid;
import gobject.object;

/** */
class FinishOptions : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_finish_options_get_type != &gidSymbolNotFound ? gadataset_finish_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FinishOptions self()
  {
    return this;
  }

  /**
      Get `inspectNFragments` property.
      Returns: The number of fragments to be used to inspect schema.
  */
  @property int inspectNFragments()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("inspect-n-fragments");
  }

  /**
      Set `inspectNFragments` property.
      Params:
        propval = The number of fragments to be used to inspect schema.
  */
  @property void inspectNFragments(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("inspect-n-fragments", propval);
  }

  /**
      Get `schema` property.
      Returns: The schema to finalize the dataset's schema.
  */
  @property arrow.schema.Schema schema()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.schema.Schema)("schema");
  }

  /**
      Set `schema` property.
      Params:
        propval = The schema to finalize the dataset's schema.
  */
  @property void schema(arrow.schema.Schema propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.schema.Schema)("schema", propval);
  }

  /**
      Get `validateFragments` property.
      Returns: Whether validate fragments against the given schema or not.
  */
  @property bool validateFragments()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("validate-fragments");
  }

  /**
      Set `validateFragments` property.
      Params:
        propval = Whether validate fragments against the given schema or not.
  */
  @property void validateFragments(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("validate-fragments", propval);
  }

  /** */
  this()
  {
    GADatasetFinishOptions* _cretval;
    _cretval = gadataset_finish_options_new();
    this(_cretval, Yes.Take);
  }
}
