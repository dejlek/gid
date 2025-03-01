module atk.types;

import atk.c.functions;
import atk.c.types;
import atk.key_event_struct;
import atk.object;
import atk.property_values;
import atk.types;
import gid.global;


// Aliases
alias State = AtkState;

// Enums
alias CoordType = AtkCoordType;
alias HyperlinkStateFlags = AtkHyperlinkStateFlags;
alias KeyEventType = AtkKeyEventType;
alias Layer = AtkLayer;
alias Live = AtkLive;
alias RelationType = AtkRelationType;
alias Role = AtkRole;
alias ScrollType = AtkScrollType;
alias StateType = AtkStateType;
alias TextAttribute = AtkTextAttribute;
alias TextBoundary = AtkTextBoundary;
alias TextClipType = AtkTextClipType;
alias TextGranularity = AtkTextGranularity;
alias ValueType = AtkValueType;

// Structs
alias TextRectangle = AtkTextRectangle;

// Callbacks
alias EventListener = void delegate(ObjectAtk obj);
alias EventListenerInit = void delegate();
alias FocusHandler = void delegate(ObjectAtk object, bool focusIn);
alias Function = bool delegate();
alias KeySnoopFunc = int delegate(KeyEventStruct event);
alias PropertyChangeHandler = void delegate(ObjectAtk obj, PropertyValues vals);

/**
 * Like [atk.global.getBinaryAge], but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
enum BINARY_AGE = 25210;


/**
 * Like [atk.global.getInterfaceAge], but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
enum INTERFACE_AGE = 1;


/**
 * Like [atk.global.getMajorVersion], but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
enum MAJOR_VERSION = 2;


/**
 * Like [atk.global.getMicroVersion], but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
enum MICRO_VERSION = 0;


/**
 * Like [atk.global.getMinorVersion], but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
enum MINOR_VERSION = 52;


/**
 * A macro that should be defined by the user prior to including
 * the atk/atk.h header.
 * The definition should be one of the predefined ATK version
 * macros: %ATK_VERSION_2_12, %ATK_VERSION_2_14,...
 * This macro defines the earliest version of ATK that the package is
 * required to be able to compile against.
 * If the compiler is configured to warn about the use of deprecated
 * functions, then using functions that were deprecated in version
 * %ATK_VERSION_MIN_REQUIRED or earlier will cause warnings $(LPAREN)but
 * using functions deprecated in later releases will not$(RPAREN).
 */
enum VERSION_MIN_REQUIRED = 2;

