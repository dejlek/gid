module ArrowFlight.c.functions;

import Gid.loader;
import ArrowFlight.c.types;
public import Arrow.c.types;

version(Windows)
  private immutable LIBS = ["libarrow-flight-glib-1900.dll;arrow-flight-glib-1900.dll;arrow-flight-glib.dll"];
else version(OSX)
  private immutable LIBS = ["libarrow-flight-glib.1900.dylib"];
else
  private immutable LIBS = ["libarrow-flight-glib.so.1900"];

__gshared extern(C)
{
  // CallOptions
  GType function() c_gaflight_call_options_get_type;
  GAFlightCallOptions* function() c_gaflight_call_options_new;
  void function(GAFlightCallOptions* options, const(char)* name, const(char)* value) c_gaflight_call_options_add_header;
  void function(GAFlightCallOptions* options) c_gaflight_call_options_clear_headers;
  void function(GAFlightCallOptions* options, GAFlightHeaderFunc func, void* userData) c_gaflight_call_options_foreach_header;

  // Client
  GType function() c_gaflight_client_get_type;
  GAFlightClient* function(GAFlightLocation* location, GAFlightClientOptions* options, GError** _err) c_gaflight_client_new;
  bool function(GAFlightClient* client, const(char)* user, const(char)* password, GAFlightCallOptions* options, char** bearerName, char** bearerValue, GError** _err) c_gaflight_client_authenticate_basic_token;
  bool function(GAFlightClient* client, GError** _err) c_gaflight_client_close;
  GAFlightStreamReader* function(GAFlightClient* client, GAFlightTicket* ticket, GAFlightCallOptions* options, GError** _err) c_gaflight_client_do_get;
  GAFlightDoPutResult* function(GAFlightClient* client, GAFlightDescriptor* descriptor, GArrowSchema* schema, GAFlightCallOptions* options, GError** _err) c_gaflight_client_do_put;
  GAFlightInfo* function(GAFlightClient* client, GAFlightDescriptor* descriptor, GAFlightCallOptions* options, GError** _err) c_gaflight_client_get_flight_info;
  GList* function(GAFlightClient* client, GAFlightCriteria* criteria, GAFlightCallOptions* options, GError** _err) c_gaflight_client_list_flights;

  // ClientOptions
  GType function() c_gaflight_client_options_get_type;
  GAFlightClientOptions* function() c_gaflight_client_options_new;

  // CommandDescriptor
  GType function() c_gaflight_command_descriptor_get_type;
  GAFlightCommandDescriptor* function(const(char)* command) c_gaflight_command_descriptor_new;
  char* function(GAFlightCommandDescriptor* descriptor) c_gaflight_command_descriptor_get_command;

  // Criteria
  GType function() c_gaflight_criteria_get_type;
  GAFlightCriteria* function(GBytes* expression) c_gaflight_criteria_new;

  // DataStream
  GType function() c_gaflight_data_stream_get_type;

  // Descriptor
  GType function() c_gaflight_descriptor_get_type;
  bool function(GAFlightDescriptor* descriptor, GAFlightDescriptor* otherDescriptor) c_gaflight_descriptor_equal;
  char* function(GAFlightDescriptor* descriptor) c_gaflight_descriptor_to_string;

  // DoPutResult
  GType function() c_gaflight_do_put_result_get_type;

  // Endpoint
  GType function() c_gaflight_endpoint_get_type;
  GAFlightEndpoint* function(GAFlightTicket* ticket, GList* locations) c_gaflight_endpoint_new;
  bool function(GAFlightEndpoint* endpoint, GAFlightEndpoint* otherEndpoint) c_gaflight_endpoint_equal;
  GList* function(GAFlightEndpoint* endpoint) c_gaflight_endpoint_get_locations;

  // Info
  GType function() c_gaflight_info_get_type;
  GAFlightInfo* function(GArrowSchema* schema, GAFlightDescriptor* descriptor, GList* endpoints, long totalRecords, long totalBytes, GError** _err) c_gaflight_info_new;
  bool function(GAFlightInfo* info, GAFlightInfo* otherInfo) c_gaflight_info_equal;
  GAFlightDescriptor* function(GAFlightInfo* info) c_gaflight_info_get_descriptor;
  GList* function(GAFlightInfo* info) c_gaflight_info_get_endpoints;
  GArrowSchema* function(GAFlightInfo* info, GArrowReadOptions* options, GError** _err) c_gaflight_info_get_schema;
  long function(GAFlightInfo* info) c_gaflight_info_get_total_bytes;
  long function(GAFlightInfo* info) c_gaflight_info_get_total_records;

  // Location
  GType function() c_gaflight_location_get_type;
  GAFlightLocation* function(const(char)* uri, GError** _err) c_gaflight_location_new;
  bool function(GAFlightLocation* location, GAFlightLocation* otherLocation) c_gaflight_location_equal;
  char* function(GAFlightLocation* location) c_gaflight_location_get_scheme;
  char* function(GAFlightLocation* location) c_gaflight_location_to_string;

  // MessageReader
  GType function() c_gaflight_message_reader_get_type;
  GAFlightDescriptor* function(GAFlightMessageReader* reader) c_gaflight_message_reader_get_descriptor;

  // MetadataReader
  GType function() c_gaflight_metadata_reader_get_type;
  GArrowBuffer* function(GAFlightMetadataReader* reader, GError** _err) c_gaflight_metadata_reader_read;

  // MetadataWriter
  GType function() c_gaflight_metadata_writer_get_type;
  bool function(GAFlightMetadataWriter* writer, GArrowBuffer* metadata, GError** _err) c_gaflight_metadata_writer_write;

  // PathDescriptor
  GType function() c_gaflight_path_descriptor_get_type;
  GAFlightPathDescriptor* function(const(char*)* paths, size_t nPaths) c_gaflight_path_descriptor_new;
  char** function(GAFlightPathDescriptor* descriptor) c_gaflight_path_descriptor_get_paths;

  // RecordBatchReader
  GType function() c_gaflight_record_batch_reader_get_type;
  GArrowTable* function(GAFlightRecordBatchReader* reader, GError** _err) c_gaflight_record_batch_reader_read_all;
  GAFlightStreamChunk* function(GAFlightRecordBatchReader* reader, GError** _err) c_gaflight_record_batch_reader_read_next;

  // RecordBatchStream
  GType function() c_gaflight_record_batch_stream_get_type;
  GAFlightRecordBatchStream* function(GArrowRecordBatchReader* reader, GArrowWriteOptions* options) c_gaflight_record_batch_stream_new;

  // RecordBatchWriter
  GType function() c_gaflight_record_batch_writer_get_type;
  bool function(GAFlightRecordBatchWriter* writer, GArrowSchema* schema, GArrowWriteOptions* options, GError** _err) c_gaflight_record_batch_writer_begin;
  bool function(GAFlightRecordBatchWriter* writer, GArrowBuffer* metadata, GError** _err) c_gaflight_record_batch_writer_write_metadata;
  bool function(GAFlightRecordBatchWriter* writer, GArrowRecordBatch* recordBatch, GArrowBuffer* metadata, GError** _err) c_gaflight_record_batch_writer_write_record_batch;

  // Servable
  GType function() c_gaflight_servable_get_type;

  // Server
  GType function() c_gaflight_server_get_type;
  GAFlightDataStream* function(GAFlightServer* server, GAFlightServerCallContext* context, GAFlightTicket* ticket, GError** _err) c_gaflight_server_do_get;
  bool function(GAFlightServer* server, GAFlightServerCallContext* context, GAFlightMessageReader* reader, GAFlightMetadataWriter* writer, GError** _err) c_gaflight_server_do_put;
  GAFlightInfo* function(GAFlightServer* server, GAFlightServerCallContext* context, GAFlightDescriptor* request, GError** _err) c_gaflight_server_get_flight_info;
  int function(GAFlightServer* server) c_gaflight_server_get_port;
  GList* function(GAFlightServer* server, GAFlightServerCallContext* context, GAFlightCriteria* criteria, GError** _err) c_gaflight_server_list_flights;
  bool function(GAFlightServer* server, GAFlightServerOptions* options, GError** _err) c_gaflight_server_listen;
  bool function(GAFlightServer* server, GError** _err) c_gaflight_server_shutdown;
  bool function(GAFlightServer* server, GError** _err) c_gaflight_server_wait;

  // ServerAuthHandler
  GType function() c_gaflight_server_auth_handler_get_type;

  // ServerAuthReader
  GType function() c_gaflight_server_auth_reader_get_type;
  GBytes* function(GAFlightServerAuthReader* reader, GError** _err) c_gaflight_server_auth_reader_read;

  // ServerAuthSender
  GType function() c_gaflight_server_auth_sender_get_type;
  bool function(GAFlightServerAuthSender* sender, GBytes* message, GError** _err) c_gaflight_server_auth_sender_write;

  // ServerCallContext
  GType function() c_gaflight_server_call_context_get_type;
  void function(GAFlightServerCallContext* context, GAFlightHeaderFunc func, void* userData) c_gaflight_server_call_context_foreach_incoming_header;

  // ServerCustomAuthHandler
  GType function() c_gaflight_server_custom_auth_handler_get_type;
  void function(GAFlightServerCustomAuthHandler* handler, GAFlightServerCallContext* context, GAFlightServerAuthSender* sender, GAFlightServerAuthReader* reader, GError** _err) c_gaflight_server_custom_auth_handler_authenticate;
  GBytes* function(GAFlightServerCustomAuthHandler* handler, GAFlightServerCallContext* context, GBytes* token, GError** _err) c_gaflight_server_custom_auth_handler_is_valid;

  // ServerOptions
  GType function() c_gaflight_server_options_get_type;
  GAFlightServerOptions* function(GAFlightLocation* location) c_gaflight_server_options_new;

  // StreamChunk
  GType function() c_gaflight_stream_chunk_get_type;
  GArrowRecordBatch* function(GAFlightStreamChunk* chunk) c_gaflight_stream_chunk_get_data;
  GArrowBuffer* function(GAFlightStreamChunk* chunk) c_gaflight_stream_chunk_get_metadata;

  // StreamReader
  GType function() c_gaflight_stream_reader_get_type;

  // StreamWriter
  GType function() c_gaflight_stream_writer_get_type;
  bool function(GAFlightStreamWriter* writer, GError** _err) c_gaflight_stream_writer_done_writing;

  // Ticket
  GType function() c_gaflight_ticket_get_type;
  GAFlightTicket* function(GBytes* data) c_gaflight_ticket_new;
  bool function(GAFlightTicket* ticket, GAFlightTicket* otherTicket) c_gaflight_ticket_equal;
}

// CallOptions
alias gaflight_call_options_get_type = c_gaflight_call_options_get_type;
alias gaflight_call_options_new = c_gaflight_call_options_new;
alias gaflight_call_options_add_header = c_gaflight_call_options_add_header;
alias gaflight_call_options_clear_headers = c_gaflight_call_options_clear_headers;
alias gaflight_call_options_foreach_header = c_gaflight_call_options_foreach_header;

// Client
alias gaflight_client_get_type = c_gaflight_client_get_type;
alias gaflight_client_new = c_gaflight_client_new;
alias gaflight_client_authenticate_basic_token = c_gaflight_client_authenticate_basic_token;
alias gaflight_client_close = c_gaflight_client_close;
alias gaflight_client_do_get = c_gaflight_client_do_get;
alias gaflight_client_do_put = c_gaflight_client_do_put;
alias gaflight_client_get_flight_info = c_gaflight_client_get_flight_info;
alias gaflight_client_list_flights = c_gaflight_client_list_flights;

// ClientOptions
alias gaflight_client_options_get_type = c_gaflight_client_options_get_type;
alias gaflight_client_options_new = c_gaflight_client_options_new;

// CommandDescriptor
alias gaflight_command_descriptor_get_type = c_gaflight_command_descriptor_get_type;
alias gaflight_command_descriptor_new = c_gaflight_command_descriptor_new;
alias gaflight_command_descriptor_get_command = c_gaflight_command_descriptor_get_command;

// Criteria
alias gaflight_criteria_get_type = c_gaflight_criteria_get_type;
alias gaflight_criteria_new = c_gaflight_criteria_new;

// DataStream
alias gaflight_data_stream_get_type = c_gaflight_data_stream_get_type;

// Descriptor
alias gaflight_descriptor_get_type = c_gaflight_descriptor_get_type;
alias gaflight_descriptor_equal = c_gaflight_descriptor_equal;
alias gaflight_descriptor_to_string = c_gaflight_descriptor_to_string;

// DoPutResult
alias gaflight_do_put_result_get_type = c_gaflight_do_put_result_get_type;

// Endpoint
alias gaflight_endpoint_get_type = c_gaflight_endpoint_get_type;
alias gaflight_endpoint_new = c_gaflight_endpoint_new;
alias gaflight_endpoint_equal = c_gaflight_endpoint_equal;
alias gaflight_endpoint_get_locations = c_gaflight_endpoint_get_locations;

// Info
alias gaflight_info_get_type = c_gaflight_info_get_type;
alias gaflight_info_new = c_gaflight_info_new;
alias gaflight_info_equal = c_gaflight_info_equal;
alias gaflight_info_get_descriptor = c_gaflight_info_get_descriptor;
alias gaflight_info_get_endpoints = c_gaflight_info_get_endpoints;
alias gaflight_info_get_schema = c_gaflight_info_get_schema;
alias gaflight_info_get_total_bytes = c_gaflight_info_get_total_bytes;
alias gaflight_info_get_total_records = c_gaflight_info_get_total_records;

// Location
alias gaflight_location_get_type = c_gaflight_location_get_type;
alias gaflight_location_new = c_gaflight_location_new;
alias gaflight_location_equal = c_gaflight_location_equal;
alias gaflight_location_get_scheme = c_gaflight_location_get_scheme;
alias gaflight_location_to_string = c_gaflight_location_to_string;

// MessageReader
alias gaflight_message_reader_get_type = c_gaflight_message_reader_get_type;
alias gaflight_message_reader_get_descriptor = c_gaflight_message_reader_get_descriptor;

// MetadataReader
alias gaflight_metadata_reader_get_type = c_gaflight_metadata_reader_get_type;
alias gaflight_metadata_reader_read = c_gaflight_metadata_reader_read;

// MetadataWriter
alias gaflight_metadata_writer_get_type = c_gaflight_metadata_writer_get_type;
alias gaflight_metadata_writer_write = c_gaflight_metadata_writer_write;

// PathDescriptor
alias gaflight_path_descriptor_get_type = c_gaflight_path_descriptor_get_type;
alias gaflight_path_descriptor_new = c_gaflight_path_descriptor_new;
alias gaflight_path_descriptor_get_paths = c_gaflight_path_descriptor_get_paths;

// RecordBatchReader
alias gaflight_record_batch_reader_get_type = c_gaflight_record_batch_reader_get_type;
alias gaflight_record_batch_reader_read_all = c_gaflight_record_batch_reader_read_all;
alias gaflight_record_batch_reader_read_next = c_gaflight_record_batch_reader_read_next;

// RecordBatchStream
alias gaflight_record_batch_stream_get_type = c_gaflight_record_batch_stream_get_type;
alias gaflight_record_batch_stream_new = c_gaflight_record_batch_stream_new;

// RecordBatchWriter
alias gaflight_record_batch_writer_get_type = c_gaflight_record_batch_writer_get_type;
alias gaflight_record_batch_writer_begin = c_gaflight_record_batch_writer_begin;
alias gaflight_record_batch_writer_write_metadata = c_gaflight_record_batch_writer_write_metadata;
alias gaflight_record_batch_writer_write_record_batch = c_gaflight_record_batch_writer_write_record_batch;

// Servable
alias gaflight_servable_get_type = c_gaflight_servable_get_type;

// Server
alias gaflight_server_get_type = c_gaflight_server_get_type;
alias gaflight_server_do_get = c_gaflight_server_do_get;
alias gaflight_server_do_put = c_gaflight_server_do_put;
alias gaflight_server_get_flight_info = c_gaflight_server_get_flight_info;
alias gaflight_server_get_port = c_gaflight_server_get_port;
alias gaflight_server_list_flights = c_gaflight_server_list_flights;
alias gaflight_server_listen = c_gaflight_server_listen;
alias gaflight_server_shutdown = c_gaflight_server_shutdown;
alias gaflight_server_wait = c_gaflight_server_wait;

// ServerAuthHandler
alias gaflight_server_auth_handler_get_type = c_gaflight_server_auth_handler_get_type;

// ServerAuthReader
alias gaflight_server_auth_reader_get_type = c_gaflight_server_auth_reader_get_type;
alias gaflight_server_auth_reader_read = c_gaflight_server_auth_reader_read;

// ServerAuthSender
alias gaflight_server_auth_sender_get_type = c_gaflight_server_auth_sender_get_type;
alias gaflight_server_auth_sender_write = c_gaflight_server_auth_sender_write;

// ServerCallContext
alias gaflight_server_call_context_get_type = c_gaflight_server_call_context_get_type;
alias gaflight_server_call_context_foreach_incoming_header = c_gaflight_server_call_context_foreach_incoming_header;

// ServerCustomAuthHandler
alias gaflight_server_custom_auth_handler_get_type = c_gaflight_server_custom_auth_handler_get_type;
alias gaflight_server_custom_auth_handler_authenticate = c_gaflight_server_custom_auth_handler_authenticate;
alias gaflight_server_custom_auth_handler_is_valid = c_gaflight_server_custom_auth_handler_is_valid;

// ServerOptions
alias gaflight_server_options_get_type = c_gaflight_server_options_get_type;
alias gaflight_server_options_new = c_gaflight_server_options_new;

// StreamChunk
alias gaflight_stream_chunk_get_type = c_gaflight_stream_chunk_get_type;
alias gaflight_stream_chunk_get_data = c_gaflight_stream_chunk_get_data;
alias gaflight_stream_chunk_get_metadata = c_gaflight_stream_chunk_get_metadata;

// StreamReader
alias gaflight_stream_reader_get_type = c_gaflight_stream_reader_get_type;

// StreamWriter
alias gaflight_stream_writer_get_type = c_gaflight_stream_writer_get_type;
alias gaflight_stream_writer_done_writing = c_gaflight_stream_writer_done_writing;

// Ticket
alias gaflight_ticket_get_type = c_gaflight_ticket_get_type;
alias gaflight_ticket_new = c_gaflight_ticket_new;
alias gaflight_ticket_equal = c_gaflight_ticket_equal;

shared static this()
{
  // CallOptions
  gidLink(gaflight_call_options_get_type, "gaflight_call_options_get_type", LIBS);
  gidLink(gaflight_call_options_new, "gaflight_call_options_new", LIBS);
  gidLink(gaflight_call_options_add_header, "gaflight_call_options_add_header", LIBS);
  gidLink(gaflight_call_options_clear_headers, "gaflight_call_options_clear_headers", LIBS);
  gidLink(gaflight_call_options_foreach_header, "gaflight_call_options_foreach_header", LIBS);

  // Client
  gidLink(gaflight_client_get_type, "gaflight_client_get_type", LIBS);
  gidLink(gaflight_client_new, "gaflight_client_new", LIBS);
  gidLink(gaflight_client_authenticate_basic_token, "gaflight_client_authenticate_basic_token", LIBS);
  gidLink(gaflight_client_close, "gaflight_client_close", LIBS);
  gidLink(gaflight_client_do_get, "gaflight_client_do_get", LIBS);
  gidLink(gaflight_client_do_put, "gaflight_client_do_put", LIBS);
  gidLink(gaflight_client_get_flight_info, "gaflight_client_get_flight_info", LIBS);
  gidLink(gaflight_client_list_flights, "gaflight_client_list_flights", LIBS);

  // ClientOptions
  gidLink(gaflight_client_options_get_type, "gaflight_client_options_get_type", LIBS);
  gidLink(gaflight_client_options_new, "gaflight_client_options_new", LIBS);

  // CommandDescriptor
  gidLink(gaflight_command_descriptor_get_type, "gaflight_command_descriptor_get_type", LIBS);
  gidLink(gaflight_command_descriptor_new, "gaflight_command_descriptor_new", LIBS);
  gidLink(gaflight_command_descriptor_get_command, "gaflight_command_descriptor_get_command", LIBS);

  // Criteria
  gidLink(gaflight_criteria_get_type, "gaflight_criteria_get_type", LIBS);
  gidLink(gaflight_criteria_new, "gaflight_criteria_new", LIBS);

  // DataStream
  gidLink(gaflight_data_stream_get_type, "gaflight_data_stream_get_type", LIBS);

  // Descriptor
  gidLink(gaflight_descriptor_get_type, "gaflight_descriptor_get_type", LIBS);
  gidLink(gaflight_descriptor_equal, "gaflight_descriptor_equal", LIBS);
  gidLink(gaflight_descriptor_to_string, "gaflight_descriptor_to_string", LIBS);

  // DoPutResult
  gidLink(gaflight_do_put_result_get_type, "gaflight_do_put_result_get_type", LIBS);

  // Endpoint
  gidLink(gaflight_endpoint_get_type, "gaflight_endpoint_get_type", LIBS);
  gidLink(gaflight_endpoint_new, "gaflight_endpoint_new", LIBS);
  gidLink(gaflight_endpoint_equal, "gaflight_endpoint_equal", LIBS);
  gidLink(gaflight_endpoint_get_locations, "gaflight_endpoint_get_locations", LIBS);

  // Info
  gidLink(gaflight_info_get_type, "gaflight_info_get_type", LIBS);
  gidLink(gaflight_info_new, "gaflight_info_new", LIBS);
  gidLink(gaflight_info_equal, "gaflight_info_equal", LIBS);
  gidLink(gaflight_info_get_descriptor, "gaflight_info_get_descriptor", LIBS);
  gidLink(gaflight_info_get_endpoints, "gaflight_info_get_endpoints", LIBS);
  gidLink(gaflight_info_get_schema, "gaflight_info_get_schema", LIBS);
  gidLink(gaflight_info_get_total_bytes, "gaflight_info_get_total_bytes", LIBS);
  gidLink(gaflight_info_get_total_records, "gaflight_info_get_total_records", LIBS);

  // Location
  gidLink(gaflight_location_get_type, "gaflight_location_get_type", LIBS);
  gidLink(gaflight_location_new, "gaflight_location_new", LIBS);
  gidLink(gaflight_location_equal, "gaflight_location_equal", LIBS);
  gidLink(gaflight_location_get_scheme, "gaflight_location_get_scheme", LIBS);
  gidLink(gaflight_location_to_string, "gaflight_location_to_string", LIBS);

  // MessageReader
  gidLink(gaflight_message_reader_get_type, "gaflight_message_reader_get_type", LIBS);
  gidLink(gaflight_message_reader_get_descriptor, "gaflight_message_reader_get_descriptor", LIBS);

  // MetadataReader
  gidLink(gaflight_metadata_reader_get_type, "gaflight_metadata_reader_get_type", LIBS);
  gidLink(gaflight_metadata_reader_read, "gaflight_metadata_reader_read", LIBS);

  // MetadataWriter
  gidLink(gaflight_metadata_writer_get_type, "gaflight_metadata_writer_get_type", LIBS);
  gidLink(gaflight_metadata_writer_write, "gaflight_metadata_writer_write", LIBS);

  // PathDescriptor
  gidLink(gaflight_path_descriptor_get_type, "gaflight_path_descriptor_get_type", LIBS);
  gidLink(gaflight_path_descriptor_new, "gaflight_path_descriptor_new", LIBS);
  gidLink(gaflight_path_descriptor_get_paths, "gaflight_path_descriptor_get_paths", LIBS);

  // RecordBatchReader
  gidLink(gaflight_record_batch_reader_get_type, "gaflight_record_batch_reader_get_type", LIBS);
  gidLink(gaflight_record_batch_reader_read_all, "gaflight_record_batch_reader_read_all", LIBS);
  gidLink(gaflight_record_batch_reader_read_next, "gaflight_record_batch_reader_read_next", LIBS);

  // RecordBatchStream
  gidLink(gaflight_record_batch_stream_get_type, "gaflight_record_batch_stream_get_type", LIBS);
  gidLink(gaflight_record_batch_stream_new, "gaflight_record_batch_stream_new", LIBS);

  // RecordBatchWriter
  gidLink(gaflight_record_batch_writer_get_type, "gaflight_record_batch_writer_get_type", LIBS);
  gidLink(gaflight_record_batch_writer_begin, "gaflight_record_batch_writer_begin", LIBS);
  gidLink(gaflight_record_batch_writer_write_metadata, "gaflight_record_batch_writer_write_metadata", LIBS);
  gidLink(gaflight_record_batch_writer_write_record_batch, "gaflight_record_batch_writer_write_record_batch", LIBS);

  // Servable
  gidLink(gaflight_servable_get_type, "gaflight_servable_get_type", LIBS);

  // Server
  gidLink(gaflight_server_get_type, "gaflight_server_get_type", LIBS);
  gidLink(gaflight_server_do_get, "gaflight_server_do_get", LIBS);
  gidLink(gaflight_server_do_put, "gaflight_server_do_put", LIBS);
  gidLink(gaflight_server_get_flight_info, "gaflight_server_get_flight_info", LIBS);
  gidLink(gaflight_server_get_port, "gaflight_server_get_port", LIBS);
  gidLink(gaflight_server_list_flights, "gaflight_server_list_flights", LIBS);
  gidLink(gaflight_server_listen, "gaflight_server_listen", LIBS);
  gidLink(gaflight_server_shutdown, "gaflight_server_shutdown", LIBS);
  gidLink(gaflight_server_wait, "gaflight_server_wait", LIBS);

  // ServerAuthHandler
  gidLink(gaflight_server_auth_handler_get_type, "gaflight_server_auth_handler_get_type", LIBS);

  // ServerAuthReader
  gidLink(gaflight_server_auth_reader_get_type, "gaflight_server_auth_reader_get_type", LIBS);
  gidLink(gaflight_server_auth_reader_read, "gaflight_server_auth_reader_read", LIBS);

  // ServerAuthSender
  gidLink(gaflight_server_auth_sender_get_type, "gaflight_server_auth_sender_get_type", LIBS);
  gidLink(gaflight_server_auth_sender_write, "gaflight_server_auth_sender_write", LIBS);

  // ServerCallContext
  gidLink(gaflight_server_call_context_get_type, "gaflight_server_call_context_get_type", LIBS);
  gidLink(gaflight_server_call_context_foreach_incoming_header, "gaflight_server_call_context_foreach_incoming_header", LIBS);

  // ServerCustomAuthHandler
  gidLink(gaflight_server_custom_auth_handler_get_type, "gaflight_server_custom_auth_handler_get_type", LIBS);
  gidLink(gaflight_server_custom_auth_handler_authenticate, "gaflight_server_custom_auth_handler_authenticate", LIBS);
  gidLink(gaflight_server_custom_auth_handler_is_valid, "gaflight_server_custom_auth_handler_is_valid", LIBS);

  // ServerOptions
  gidLink(gaflight_server_options_get_type, "gaflight_server_options_get_type", LIBS);
  gidLink(gaflight_server_options_new, "gaflight_server_options_new", LIBS);

  // StreamChunk
  gidLink(gaflight_stream_chunk_get_type, "gaflight_stream_chunk_get_type", LIBS);
  gidLink(gaflight_stream_chunk_get_data, "gaflight_stream_chunk_get_data", LIBS);
  gidLink(gaflight_stream_chunk_get_metadata, "gaflight_stream_chunk_get_metadata", LIBS);

  // StreamReader
  gidLink(gaflight_stream_reader_get_type, "gaflight_stream_reader_get_type", LIBS);

  // StreamWriter
  gidLink(gaflight_stream_writer_get_type, "gaflight_stream_writer_get_type", LIBS);
  gidLink(gaflight_stream_writer_done_writing, "gaflight_stream_writer_done_writing", LIBS);

  // Ticket
  gidLink(gaflight_ticket_get_type, "gaflight_ticket_get_type", LIBS);
  gidLink(gaflight_ticket_new, "gaflight_ticket_new", LIBS);
  gidLink(gaflight_ticket_equal, "gaflight_ticket_equal", LIBS);
}
