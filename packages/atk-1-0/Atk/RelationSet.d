module Atk.RelationSet;

import Atk.ObjectAtk;
import Atk.Relation;
import Atk.Types;
import Atk.c.functions;
import Atk.c.types;
import GObject.ObjectG;
import Gid.gid;

/**
 * A set of AtkRelations, normally the set of
 * AtkRelations which an AtkObject has.
 * The AtkRelationSet held by an object establishes its relationships
 * with objects beyond the normal "parent/child" hierarchical
 * relationships that all user interface objects have.
 * AtkRelationSets establish whether objects are labelled or
 * controlled by other components, share group membership with other
 * components $(LPAREN)for instance within a radio-button group$(RPAREN), or share
 * content which "flows" between them, among other types of possible
 * relationships.
 */
class RelationSet : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())atk_relation_set_get_type != &gidSymbolNotFound ? atk_relation_set_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new empty relation set.
   * Returns: a new #AtkRelationSet
   */
  this()
  {
    AtkRelationSet* _cretval;
    _cretval = atk_relation_set_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Add a new relation to the current relation set if it is not already
   * present.
   * This function ref's the AtkRelation so the caller of this function
   * should unref it to ensure that it will be destroyed when the AtkRelationSet
   * is destroyed.
   * Params:
   *   relation = an #AtkRelation
   */
  void add(Relation relation)
  {
    atk_relation_set_add(cast(AtkRelationSet*)cPtr, relation ? cast(AtkRelation*)relation.cPtr(No.Dup) : null);
  }

  /**
   * Add a new relation of the specified type with the specified target to
   * the current relation set if the relation set does not contain a relation
   * of that type. If it is does contain a relation of that typea the target
   * is added to the relation.
   * Params:
   *   relationship = an #AtkRelationType
   *   target = an #AtkObject
   */
  void addRelationByType(RelationType relationship, ObjectAtk target)
  {
    atk_relation_set_add_relation_by_type(cast(AtkRelationSet*)cPtr, relationship, target ? cast(AtkObject*)target.cPtr(No.Dup) : null);
  }

  /**
   * Determines whether the relation set contains a relation that matches the
   * specified type.
   * Params:
   *   relationship = an #AtkRelationType
   * Returns: %TRUE if relationship is the relationship type of a relation
   *   in set, %FALSE otherwise
   */
  bool contains(RelationType relationship)
  {
    bool _retval;
    _retval = atk_relation_set_contains(cast(AtkRelationSet*)cPtr, relationship);
    return _retval;
  }

  /**
   * Determines whether the relation set contains a relation that
   * matches the specified pair formed by type relationship and object
   * target.
   * Params:
   *   relationship = an #AtkRelationType
   *   target = an #AtkObject
   * Returns: %TRUE if set contains a relation with the relationship
   *   type relationship with an object target, %FALSE otherwise
   */
  bool containsTarget(RelationType relationship, ObjectAtk target)
  {
    bool _retval;
    _retval = atk_relation_set_contains_target(cast(AtkRelationSet*)cPtr, relationship, target ? cast(AtkObject*)target.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Determines the number of relations in a relation set.
   * Returns: an integer representing the number of relations in the set.
   */
  int getNRelations()
  {
    int _retval;
    _retval = atk_relation_set_get_n_relations(cast(AtkRelationSet*)cPtr);
    return _retval;
  }

  /**
   * Determines the relation at the specified position in the relation set.
   * Params:
   *   i = a gint representing a position in the set, starting from 0.
   * Returns: a #AtkRelation, which is the relation at
   *   position i in the set.
   */
  Relation getRelation(int i)
  {
    AtkRelation* _cretval;
    _cretval = atk_relation_set_get_relation(cast(AtkRelationSet*)cPtr, i);
    auto _retval = ObjectG.getDObject!Relation(cast(AtkRelation*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Finds a relation that matches the specified type.
   * Params:
   *   relationship = an #AtkRelationType
   * Returns: an #AtkRelation, which is a relation matching the
   *   specified type.
   */
  Relation getRelationByType(RelationType relationship)
  {
    AtkRelation* _cretval;
    _cretval = atk_relation_set_get_relation_by_type(cast(AtkRelationSet*)cPtr, relationship);
    auto _retval = ObjectG.getDObject!Relation(cast(AtkRelation*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Removes a relation from the relation set.
   * This function unref's the #AtkRelation so it will be deleted unless there
   * is another reference to it.
   * Params:
   *   relation = an #AtkRelation
   */
  void remove(Relation relation)
  {
    atk_relation_set_remove(cast(AtkRelationSet*)cPtr, relation ? cast(AtkRelation*)relation.cPtr(No.Dup) : null);
  }
}
