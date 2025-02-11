module ArrowFlight.c.types;

public import Arrow.c.types;

struct GAFlightCallOptions
{
  ObjectC parentInstance;
}

struct GAFlightCallOptionsClass
{
  GObjectClass parentClass;
}

struct GAFlightClient
{
  ObjectC parentInstance;
}

struct GAFlightClientClass
{
  GObjectClass parentClass;
}

struct GAFlightClientOptions
{
  ObjectC parentInstance;
}

struct GAFlightClientOptionsClass
{
  GObjectClass parentClass;
}

struct GAFlightCommandDescriptor
{
  GAFlightDescriptor parentInstance;
}

struct GAFlightCommandDescriptorClass
{
  GAFlightDescriptorClass parentClass;
}

struct GAFlightCriteria
{
  ObjectC parentInstance;
}

struct GAFlightCriteriaClass
{
  GObjectClass parentClass;
}

struct GAFlightDataStream
{
  ObjectC parentInstance;
}

struct GAFlightDataStreamClass
{
  GObjectClass parentClass;
}

struct GAFlightDescriptor
{
  ObjectC parentInstance;
}

struct GAFlightDescriptorClass
{
  GObjectClass parentClass;
}

struct GAFlightDoPutResult
{
  ObjectC parentInstance;
}

struct GAFlightDoPutResultClass
{
  GObjectClass parentClass;
}

struct GAFlightEndpoint
{
  ObjectC parentInstance;
}

struct GAFlightEndpointClass
{
  GObjectClass parentClass;
}

struct GAFlightInfo
{
  ObjectC parentInstance;
}

struct GAFlightInfoClass
{
  GObjectClass parentClass;
}

struct GAFlightLocation
{
  ObjectC parentInstance;
}

struct GAFlightLocationClass
{
  GObjectClass parentClass;
}

struct GAFlightMessageReader
{
  GAFlightRecordBatchReader parentInstance;
}

struct GAFlightMessageReaderClass
{
  GAFlightRecordBatchReaderClass parentClass;
}

struct GAFlightMetadataReader
{
  ObjectC parentInstance;
}

struct GAFlightMetadataReaderClass
{
  GObjectClass parentClass;
}

struct GAFlightMetadataWriter
{
  ObjectC parentInstance;
}

struct GAFlightMetadataWriterClass
{
  GObjectClass parentClass;
}

struct GAFlightPathDescriptor
{
  GAFlightDescriptor parentInstance;
}

struct GAFlightPathDescriptorClass
{
  GAFlightDescriptorClass parentClass;
}

struct GAFlightRecordBatchReader
{
  ObjectC parentInstance;
}

struct GAFlightRecordBatchReaderClass
{
  GObjectClass parentClass;
}

struct GAFlightRecordBatchStream
{
  GAFlightDataStream parentInstance;
}

struct GAFlightRecordBatchStreamClass
{
  GAFlightDataStreamClass parentClass;
}

struct GAFlightRecordBatchWriter
{
  GArrowRecordBatchWriter parentInstance;
}

struct GAFlightRecordBatchWriterClass
{
  GArrowRecordBatchWriterClass parentClass;
}

struct GAFlightServable;

struct GAFlightServableInterface;

struct GAFlightServer
{
  ObjectC parentInstance;
}

struct GAFlightServerAuthHandler
{
  ObjectC parentInstance;
}

struct GAFlightServerAuthHandlerClass
{
  GObjectClass parentClass;
}

struct GAFlightServerAuthReader
{
  ObjectC parentInstance;
}

struct GAFlightServerAuthReaderClass
{
  GObjectClass parentClass;
}

struct GAFlightServerAuthSender
{
  ObjectC parentInstance;
}

struct GAFlightServerAuthSenderClass
{
  GObjectClass parentClass;
}

struct GAFlightServerCallContext
{
  ObjectC parentInstance;
}

struct GAFlightServerCallContextClass
{
  GObjectClass parentClass;
}

struct GAFlightServerClass
{
  GObjectClass parentClass;

  /**
   * A virtual function to implement `ListFlights` API.
   */
  extern(C) GList* function(GAFlightServer* server, GAFlightServerCallContext* context, GAFlightCriteria* criteria, GError** _err) listFlights;

  extern(C) GAFlightInfo* function(GAFlightServer* server, GAFlightServerCallContext* context, GAFlightDescriptor* request, GError** _err) getFlightInfo;

  /**
   * A virtual function to implement `DoGet` API.
   */
  extern(C) GAFlightDataStream* function(GAFlightServer* server, GAFlightServerCallContext* context, GAFlightTicket* ticket, GError** _err) doGet;

  /**
   * A virtual function to implement `DoPut` API.
   */
  extern(C) bool function(GAFlightServer* server, GAFlightServerCallContext* context, GAFlightMessageReader* reader, GAFlightMetadataWriter* writer, GError** _err) doPut;
}

struct GAFlightServerCustomAuthHandler
{
  GAFlightServerAuthHandler parentInstance;
}

struct GAFlightServerCustomAuthHandlerClass
{
  GAFlightServerAuthHandlerClass parentClass;

  /**
   * Authenticates the client on initial connection. The server
   * can send and read responses from the client at any time.
   */
  extern(C) void function(GAFlightServerCustomAuthHandler* handler, GAFlightServerCallContext* context, GAFlightServerAuthSender* sender, GAFlightServerAuthReader* reader, GError** _err) authenticate;

  /**
   * Validates a per-call client token.
   */
  extern(C) GBytes* function(GAFlightServerCustomAuthHandler* handler, GAFlightServerCallContext* context, GBytes* token, GError** _err) isValid;
}

struct GAFlightServerOptions
{
  ObjectC parentInstance;
}

struct GAFlightServerOptionsClass
{
  GObjectClass parentClass;
}

struct GAFlightStreamChunk
{
  ObjectC parentInstance;
}

struct GAFlightStreamChunkClass
{
  GObjectClass parentClass;
}

struct GAFlightStreamReader
{
  GAFlightRecordBatchReader parentInstance;
}

struct GAFlightStreamReaderClass
{
  GAFlightRecordBatchReaderClass parentClass;
}

struct GAFlightStreamWriter
{
  GAFlightRecordBatchWriter parentInstance;
}

struct GAFlightStreamWriterClass
{
  GAFlightRecordBatchWriterClass parentClass;
}

struct GAFlightTicket
{
  ObjectC parentInstance;
}

struct GAFlightTicketClass
{
  GObjectClass parentClass;
}

alias extern(C) void function(const(char)* name, const(char)* value, void* userData) GAFlightHeaderFunc;

