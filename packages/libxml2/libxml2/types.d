/// D types for libxml2 library
module libxml2.types;

import gid.gid;
import libxml2.c.functions;
import libxml2.c.types;


// Structs

/** */
alias Char = xmlChar;

/** */
alias Doc = xmlDoc*;

/** */
alias DocPtr = xmlDocPtr;

/** */
alias Node = xmlNode*;

/** */
alias NodePtr = xmlNodePtr;

/** */
alias NsPtr = xmlNsPtr;

/** */
alias TextReader = xmlTextReaderPtr;

/** */
alias TextWriter = xmlTextWriterPtr;
