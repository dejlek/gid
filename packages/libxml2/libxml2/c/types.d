/// C types for libxml2 library
module libxml2.c.types;

public import gid.basictypes;
public import glib.c.types;

/** */
struct xmlChar;

/** */
struct xmlDoc;

/** */
alias xmlDocPtr = xmlDocPtr_st*;

struct xmlDocPtr_st;

/** */
struct xmlNode;

/** */
alias xmlNodePtr = xmlNodePtr_st*;

struct xmlNodePtr_st;

/** */
alias xmlNsPtr = xmlNsPtr_st*;

struct xmlNsPtr_st;

/** */
alias xmlTextReaderPtr = xmlTextReaderPtr_st*;

struct xmlTextReaderPtr_st;

/** */
alias xmlTextWriterPtr = xmlTextWriterPtr_st*;

struct xmlTextWriterPtr_st;

