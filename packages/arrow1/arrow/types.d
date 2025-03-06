module arrow.types;

import arrow.c.functions;
import arrow.c.types;
import gid.gid;


// Aliases

/** */
alias TimePoint = GArrowTimePoint;

/**
    They are corresponding to `arrow::Compression::type` values.
*/
enum CompressionType
{
  /**
      Not compressed.
  */
  Uncompressed = 0,

  /**
      Snappy compression.
  */
  Snappy = 1,

  /**
      gzip compression.
  */
  Gzip = 2,

  /**
      Brotli compression.
  */
  Brotli = 3,

  /**
      Zstandard compression.
  */
  Zstd = 4,

  /**
      LZ4 compression.
  */
  Lz4 = 5,

  /**
      LZO compression.
  */
  Lzo = 6,

  /**
      bzip2 compression.
  */
  Bz2 = 7,
}

/**
    They correspond to the values of `arrow::compute::CountOptions::CountMode`.
*/
enum CountMode
{
  /**
      Only non-null values will be counted.
  */
  OnlyValid = 0,

  /**
      Only null values will be counted.
  */
  OnlyNull = 1,

  /**
      All will be counted.
  */
  All = 2,
}

/**
    The error codes are used by all arrow-glib functions.
  
  They are corresponding to `arrow::Status` values.
*/
enum Error
{
  /**
      Out of memory error.
  */
  OutOfMemory = 1,

  /**
      Key error.
  */
  Key = 2,

  /**
      Type error.
  */
  Type = 3,

  /**
      Invalid value error.
  */
  Invalid = 4,

  /**
      IO error.
  */
  Io = 5,

  /**
      Capacity error.
  */
  Capacity = 6,

  /**
      Index error.
  */
  Index = 7,

  /**
      Unknown error.
  */
  Unknown = 9,

  /**
      The feature is not implemented.
  */
  NotImplemented = 10,

  /**
      Serialization error.
  */
  Serialization = 11,

  /**
      Error generating code for expression evaluation
      in Gandiva.
  */
  CodeGeneration = 40,

  /**
      Validation errors in expression given for code
    generation.
  */
  ExpressionValidation = 41,

  /**
      Execution error while evaluating the expression against a
    record batch.
  */
  Execution = 42,

  /**
      Item already exists error.
  */
  AlreadyExists = 45,
}

/**
    They are corresponding to `arrow::io::FileMode::type` values.
*/
enum FileMode
{
  /**
      For read.
  */
  Read = 0,

  /**
      For write.
  */
  Write = 1,

  /**
      For read-write.
  */
  Readwrite = 2,
}

/**
    They are corresponding to `arrow::fs::FileType` values.
*/
enum FileType
{
  /**
      Entry is not found
  */
  NotFound = 0,

  /**
      Entry exists but its type is unknown
  */
  Unknown = 1,

  /**
      Entry is a regular file
  */
  File = 2,

  /**
      Entry is a directory
  */
  Dir = 3,
}

/**
    They are corresponding to
  `arrow::compute::FilterOptions::NullSelectionBehavior` values.
*/
enum FilterNullSelectionBehavior
{
  /**
      Filtered value will be removed in the output.
  */
  Drop = 0,

  /**
      Filtered value will be null in the output.
  */
  EmitNull = 1,
}

/**
    They are corresponding to `arrow::IntervalType::type` values.
  
  Since 7.0.0
*/
enum IntervalType
{
  /**
      A number of months.
  */
  Month = 0,

  /**
      A number of days and
      milliseconds (fraction of day).
  */
  DayTime = 1,

  /**
      A number of months, days and
      nanoseconds between two dates.
  */
  MonthDayNano = 2,
}

/**
    They are corresponding to `arrow::json::UnexpectedFieldBehavior` values.
*/
enum JSONReadUnexpectedFieldBehavior
{
  /**
      Ignore other fields.
  */
  Ignore = 0,

  /**
      Return error.
  */
  Error = 1,

  /**
      Infer a type.
  */
  InferType = 2,
}

/**
    They correspond to the values of `arrow::compute::JoinType`.
*/
enum JoinType
{
  /** */
  LeftSemi = 0,

  /** */
  RightSemi = 1,

  /** */
  LeftAnti = 2,

  /** */
  RightAnti = 3,

  /** */
  Inner = 4,

  /** */
  LeftOuter = 5,

  /** */
  RightOuter = 6,

  /** */
  FullOuter = 7,
}

/**
    They are corresponding to `arrow::ipc::MetadataVersion::type`
  values.
*/
enum MetadataVersion
{
  /**
      Version 1.
  */
  V1 = 0,

  /**
      Version 2.
  */
  V2 = 1,

  /**
      Version 3.
  */
  V3 = 2,
}

/**
    They are corresponding to `arrow::compute::NullPlacement` values.
*/
enum NullPlacement
{
  /**
      Place nulls and NaNs before any non-null values.
      NaNs will come after nulls.
  */
  AtStart = 0,

  /**
      Place nulls and NaNs after any non-null values.
      NaNs will come before nulls.
  */
  AtEnd = 1,
}

/**
    They correspond to the values of
  `arrow::compute::QuantileOptions::Interpolation`.
*/
enum QuantileInterpolation
{
  /**
      Linear.
  */
  Linear = 0,

  /**
      Lower.
  */
  Lower = 1,

  /**
      Higher.
  */
  Higher = 2,

  /**
      Nearest.
  */
  Nearest = 3,

  /**
      Midpoint.
  */
  Midpoint = 4,
}

/** */
enum RankTiebreaker
{
  /** */
  Min = 0,

  /** */
  Max = 1,

  /** */
  First = 2,

  /** */
  Dense = 3,
}

/**
    They correspond to the values of `arrow::compute::RoundMode`.
*/
enum RoundMode
{
  /** */
  Down = 0,

  /** */
  Up = 1,

  /**
      Get the integral part without fractional digits (aka "trunc")
    @GARROW_ROUND_TOWARDS_INFINITY,
      Round negative values with @GARROW_ROUND_MODE_DOWN rule
      and positive values with UP rule (aka "away from zero")
    @GARROW_ROUND_HALF_DOWN,
      Round ties with @GARROW_ROUND_MODE_DOWN rule
      (also called "round half towards negative infinity")
    @GARROW_ROUND_HALF_UP,
      Round ties with @GARROW_ROUND_MODE_UP rule
      (also called "round half towards positive infinity")
    @GARROW_ROUND_HALF_TOWARDS_ZERO,
      Round ties with GARROW_ROUND_MODE_TOWARDS_ZERO rule
      (also called "round half away from infinity")
    @GARROW_ROUND_HALF_TOWARDS_INFINITY,
      Round ties with GARROW_ROUND_MODE_TOWARDS_INFINITY rule
      (also called "round half away from zero")
    @GARROW_ROUND_HALF_TO_EVEN,
      Round ties to nearest even integer
    @GARROW_ROUND_HALF_TO_ODD,
      Round ties to nearest odd integer
  */
  TowardsZero = 2,

  /** */
  TowardsInfinity = 3,

  /** */
  HalfDown = 4,

  /** */
  HalfUp = 5,

  /** */
  HalfTowardsZero = 6,

  /** */
  HalfTowardsInfinity = 7,

  /** */
  HalfToEven = 8,

  /** */
  HalfToOdd = 9,
}

/**
    They are corresponding to `arrow::fs::S3LogLevel` values.
*/
enum S3LogLevel
{
  /**
      Off.
  */
  Off = 0,

  /**
      Fatal. This is the default.
  */
  Fatal = 1,

  /**
      Error.
  */
  Error = 2,

  /**
      Warn.
  */
  Warn = 3,

  /**
      Info.
  */
  Info = 4,

  /**
      Debug.
  */
  Debug = 5,

  /**
      Trace.
  */
  Trace = 6,
}

/**
    They are corresponding to `arrow::compute::SortOrder` values.
*/
enum SortOrder
{
  /**
      Sort in ascending order.
  */
  Ascending = 0,

  /**
      Sort in descending order.
  */
  Descending = 1,
}

/**
    They are corresponding to `arrow::TimeUnit::type` values.
*/
enum TimeUnit
{
  /**
      Second.
  */
  Second = 0,

  /**
      Millisecond.
  */
  Milli = 1,

  /**
      Microsecond.
  */
  Micro = 2,

  /**
      Nanosecond.
  */
  Nano = 3,
}

/**
    They are corresponding to `arrow::Type::type` values.
*/
enum Type
{
  /**
      A degenerate NULL type represented as 0 bytes/bits.
  */
  Na = 0,

  /**
      A boolean value represented as 1-bit.
  */
  Boolean = 1,

  /**
      Little-endian 8-bit unsigned integer.
  */
  Uint8 = 2,

  /**
      Little-endian 8-bit signed integer.
  */
  Int8 = 3,

  /**
      Little-endian 16-bit unsigned integer.
  */
  Uint16 = 4,

  /**
      Little-endian 16-bit signed integer.
  */
  Int16 = 5,

  /**
      Little-endian 32-bit unsigned integer.
  */
  Uint32 = 6,

  /**
      Little-endian 32-bit signed integer.
  */
  Int32 = 7,

  /**
      Little-endian 64-bit unsigned integer.
  */
  Uint64 = 8,

  /**
      Little-endian 64-bit signed integer.
  */
  Int64 = 9,

  /**
      2-byte floating point value.
  */
  HalfFloat = 10,

  /**
      4-byte floating point value.
  */
  Float = 11,

  /**
      8-byte floating point value.
  */
  Double = 12,

  /**
      UTF-8 variable-length string.
  */
  String = 13,

  /**
      Variable-length bytes (no guarantee of UTF-8-ness).
  */
  Binary = 14,

  /**
      Fixed-size binary. Each value occupies
      the same number of bytes.
  */
  FixedSizeBinary = 15,

  /**
      int32 days since the UNIX epoch.
  */
  Date32 = 16,

  /**
      int64 milliseconds since the UNIX epoch.
  */
  Date64 = 17,

  /**
      Exact timestamp encoded with int64 since UNIX epoch.
      Default unit millisecond.
  */
  Timestamp = 18,

  /**
      Exact time encoded with int32, supporting seconds or milliseconds
  */
  Time32 = 19,

  /**
      Exact time encoded with int64, supporting micro- or nanoseconds
  */
  Time64 = 20,

  /**
      YEAR_MONTH interval in SQL style.
  */
  MonthInterval = 21,

  /**
      DAY_TIME interval in SQL style.
  */
  DayTimeInterval = 22,

  /**
      Precision- and scale-based decimal
      type with 128-bit. Storage type depends on the parameters.
  */
  Decimal128 = 23,

  /**
      Precision- and scale-based decimal
      type with 256-bit. Storage type depends on the parameters.
  */
  Decimal256 = 24,

  /**
      A list of some logical data type.
  */
  List = 25,

  /**
      Struct of logical types.
  */
  Struct = 26,

  /**
      Sparse unions of logical types.
  */
  SparseUnion = 27,

  /**
      Dense unions of logical types.
  */
  DenseUnion = 28,

  /**
      Dictionary aka Category type.
  */
  Dictionary = 29,

  /**
      A repeated struct logical type.
  */
  Map = 30,

  /**
      Custom data type, implemented by user.
  */
  Extension = 31,

  /**
      Fixed size list of some logical type.
  */
  FixedSizeList = 32,

  /**
      Measure of elapsed time in either seconds,
      milliseconds, microseconds or nanoseconds.
  */
  Duration = 33,

  /**
      64bit offsets UTF-8 variable-length string.
  */
  LargeString = 34,

  /**
      64bit offsets Variable-length bytes (no guarantee of
    UTF-8-ness).
  */
  LargeBinary = 35,

  /**
      A list of some logical data type with 64-bit offsets.
  */
  LargeList = 36,

  /**
      MONTH_DAY_NANO interval in SQL style.
  */
  MonthDayNanoInterval = 37,

  /**
      Run-end encoded data.
  */
  RunEndEncoded = 38,

  /**
      String (UTF8) view type with 4-byte prefix and inline small
      string optimization.
  */
  StringView = 39,

  /**
      Bytes view type with 4-byte prefix and inline small string
      optimization.
  */
  BinaryView = 40,

  /**
      Precision- and scale-based decimal
  */
  Decimal32 = 43,

  /**
      Precision- and scale-based decimal
      type with 64-bit. Storage type depends on the parameters.
  */
  Decimal64 = 44,
}

/**
    They correspond to the values of `arrow::compute::Utf8NormalizeOptions::Form`.
*/
enum UTF8NormalizeForm
{
  /**
      Normalization Form Canonical Composition.
  */
  Nfc = 0,

  /**
      Normalization Form Compatibility
      Composition.
  */
  Nfkc = 1,

  /**
      Normalization Form Canonical Decomposition.
  */
  Nfd = 2,

  /**
      Normalization Form Compatibility
      Decomposition.
  */
  Nfkd = 3,
}

/**
    The major version.
*/
enum VERSION_MAJOR = 19;

/**
    The micro version.
*/
enum VERSION_MICRO = 0;

/**
    The minor version.
*/
enum VERSION_MINOR = 0;

/**
    The version tag. Normally, it's an empty string. It's "SNAPSHOT"
  for snapshot version.
*/
enum VERSION_TAG = "";
