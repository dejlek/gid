//!gir GstRtsp-1.0

//# Seems to use the wrong type (gchar**), but there are no docs, so not positive..
//!set interface[RTSPExtension].method[get_transports].parameters.parameter[transport].type[][c:type] gchar*

//# Set arrays to be zero-terminated=1
//!set record[RTSPMessage].method[parse_auth_credentials].return-value.array[][zero-terminated] 1
