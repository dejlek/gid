module Arrow.Types;

import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;


// Aliases
alias TimePoint = GArrowTimePoint;

// Enums
alias CompressionType = GArrowCompressionType;
alias CountMode = GArrowCountMode;
alias Error = GArrowError;
alias FileMode = GArrowFileMode;
alias FileType = GArrowFileType;
alias FilterNullSelectionBehavior = GArrowFilterNullSelectionBehavior;
alias IntervalType = GArrowIntervalType;
alias JSONReadUnexpectedFieldBehavior = GArrowJSONReadUnexpectedFieldBehavior;
alias JoinType = GArrowJoinType;
alias MetadataVersion = GArrowMetadataVersion;
alias NullPlacement = GArrowNullPlacement;
alias QuantileInterpolation = GArrowQuantileInterpolation;
alias RankTiebreaker = GArrowRankTiebreaker;
alias RoundMode = GArrowRoundMode;
alias S3LogLevel = GArrowS3LogLevel;
alias SortOrder = GArrowSortOrder;
alias TimeUnit = GArrowTimeUnit;
alias Type = GArrowType;
alias UTF8NormalizeForm = GArrowUTF8NormalizeForm;

// Structs
alias FileInterface = GArrowFileInterface*;
alias ReadableInterface = GArrowReadableInterface*;
alias WritableFileInterface = GArrowWritableFileInterface*;
alias WritableInterface = GArrowWritableInterface*;

/**
 * The major version.
 */
enum VERSION_MAJOR = 19;


/**
 * The micro version.
 */
enum VERSION_MICRO = 0;


/**
 * The minor version.
 */
enum VERSION_MINOR = 0;


/**
 * The version tag. Normally, it's an empty string. It's "SNAPSHOT"
 * for snapshot version.
 */
enum VERSION_TAG = "";

