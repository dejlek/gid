/// Module for [Relation] class
module atk.relation;

import atk.c.functions;
import atk.c.types;
import atk.object;
import atk.types;
import gid.gid;
import gobject.object;

/**
    An object used to describe a relation between a
     object and one or more other objects.
    
    An AtkRelation describes a relation between an object and one or
    more other objects. The actual relations that an object has with
    other objects are defined as an AtkRelationSet, which is a set of
    AtkRelations.
*/
class Relation : gobject.object.ObjectG
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
    return cast(void function())atk_relation_get_type != &gidSymbolNotFound ? atk_relation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override Relation self()
  {
    return this;
  }

  /**
      Create a new relation for the specified key and the specified list
      of targets.  See also [atk.object.ObjectAtk.addRelationship].
  
      Params:
        targets = an array of pointers to
           #AtkObjects
        relationship = an #AtkRelationType with which to create the new
           #AtkRelation
      Returns: a pointer to a new #AtkRelation
  */
  this(atk.object.ObjectAtk[] targets, atk.types.RelationType relationship)
  {
    AtkRelation* _cretval;
    int _nTargets;
    if (targets)
      _nTargets = cast(int)targets.length;

    AtkObject*[] _tmptargets;
    foreach (obj; targets)
      _tmptargets ~= obj ? cast(AtkObject*)obj.cPtr : null;
    AtkObject** _targets = cast(AtkObject**)_tmptargets.ptr;
    _cretval = atk_relation_new(_targets, _nTargets, relationship);
    this(_cretval, Yes.Take);
  }

  /**
      Adds the specified AtkObject to the target for the relation, if it is
      not already present.  See also [atk.object.ObjectAtk.addRelationship].
  
      Params:
        target = an #AtkObject
  */
  void addTarget(atk.object.ObjectAtk target)
  {
    atk_relation_add_target(cast(AtkRelation*)cPtr, target ? cast(AtkObject*)target.cPtr(No.Dup) : null);
  }

  /**
      Gets the type of relation
      Returns: the type of relation
  */
  atk.types.RelationType getRelationType()
  {
    AtkRelationType _cretval;
    _cretval = atk_relation_get_relation_type(cast(AtkRelation*)cPtr);
    atk.types.RelationType _retval = cast(atk.types.RelationType)_cretval;
    return _retval;
  }

  /**
      Gets the target list of relation
      Returns: the target list of relation
  */
  atk.object.ObjectAtk[] getTarget()
  {
    GPtrArray* _cretval;
    _cretval = atk_relation_get_target(cast(AtkRelation*)cPtr);
    auto _retval = gPtrArrayToD!(atk.object.ObjectAtk, GidOwnership.None)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /**
      Remove the specified AtkObject from the target for the relation.
  
      Params:
        target = an #AtkObject
      Returns: TRUE if the removal is successful.
  */
  bool removeTarget(atk.object.ObjectAtk target)
  {
    bool _retval;
    _retval = atk_relation_remove_target(cast(AtkRelation*)cPtr, target ? cast(AtkObject*)target.cPtr(No.Dup) : null);
    return _retval;
  }
}
