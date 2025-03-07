//!gir Gst-1.0

//!subdtype Object ObjectGst

//# Ignore "protected/private" structure fields
//!set record[Iterator].*field[][ignore] 1
//!set record[TypeFind].*field[][ignore] 1

//# Change ChildProxy.getProperty to getChildProxyProperty, conflicts with ObjectG.getProperty and could not get it to work with an alias
//!set interface[ChildProxy].method[get_property][name] getChildProxyProperty
