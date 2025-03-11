//!gir Gst-1.0

//!subdtype Object ObjectGst

//# These are all fundamental types with no obvious way to wrap them and minimal usage, ignore them
//!set class[Bitmask][ignore] 1
//!set class[DoubleRange][ignore] 1
//!set class[FlagSet][ignore] 1
//!set class[Fraction][ignore] 1
//!set class[FractionRange][ignore] 1
//!set class[Int64Range][ignore] 1
//!set class[IntRange][ignore] 1
//!set class[ValueArray][ignore] 1
//!set class[ValueList][ignore] 1

//# Ignore "protected/private" structure fields
//!set record[Iterator].*field[][ignore] 1
//!set record[TypeFind].*field[][ignore] 1

//# Change ChildProxy.getProperty to getChildProxyProperty, conflicts with ObjectG.getProperty and could not get it to work with an alias
//!set interface[ChildProxy].method[get_property][name] getChildProxyProperty

//# Ignore methods which take a parent refcount, used for code implementing parent objects
//!set record[CapsFeatures].method[set_parent_refcount][ignore] 0
//!set record[Structure].method[set_parent_refcount][ignore] 0

//# Set arrays to be zero-terminated=1
//!set function[formats_contains].parameters.parameter[formats].array[][zero-terminated] 1

//# Set basic parameters to out
//!set callback[ControlSourceGetValue].parameters.parameter[value][direction] out
//!set callback[MemoryIsSpanFunction].parameters.parameter[offset][direction] out

//# Set values parameter to be a caller-allocates output array
//!set callback[ControlSourceGetValueArray].parameters.parameter[values][direction] out
//!set callback[ControlSourceGetValueArray].parameters.parameter[values][caller-allocates] 1
//!set callback[ControlSourceGetValueArray].parameters.parameter[values].type '<array length="3" c:type="gdouble *"><type name="double" c:type="gdouble"/></array>'

//# Set MetaDeserializeFunction.data parameter to array with length
//!set callback[MetaDeserializeFunction].parameters.parameter[data].type '<array length="3" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'

//# Set Meta.deserialize.data parameter to array with length
//!set record[Meta].function[deserialize].parameters.parameter[data].type '<array length="2" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'

//# utilSimplifyFraction.direction/denominator are inout params
//!set function[util_simplify_fraction].parameters.parameter[numerator][direction] inout
//!set function[util_simplify_fraction].parameters.parameter[denominator][direction] inout
