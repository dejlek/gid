module arrowdataset.c.types;

public import gid.basictypes;
public import arrow.c.types;

/**
    They are corresponding to `arrow::dataset::SegmentEncoding` values.
*/
enum GADatasetSegmentEncoding
{
  /**
      No encoding.
  */
  None = 0,

  /**
      Segment values are URL-encoded.
  */
  Uri = 1,
}

/** */
struct GADatasetCSVFileFormat
{
  /** */
  GADatasetFileFormat parentInstance;
}

/** */
struct GADatasetCSVFileFormatClass
{
  /** */
  GADatasetFileFormatClass parentClass;
}

/** */
struct GADatasetDataset
{
  /** */
  ObjectC parentInstance;
}

/** */
struct GADatasetDatasetClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetDatasetFactory
{
  /** */
  ObjectC parentInstance;
}

/** */
struct GADatasetDatasetFactoryClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetDirectoryPartitioning
{
  /** */
  GADatasetKeyValuePartitioning parentInstance;
}

/** */
struct GADatasetDirectoryPartitioningClass
{
  /** */
  GADatasetKeyValuePartitioningClass parentClass;
}

/** */
struct GADatasetFileFormat
{
  /** */
  ObjectC parentInstance;
}

/** */
struct GADatasetFileFormatClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetFileSystemDataset
{
  /** */
  GADatasetDataset parentInstance;
}

/** */
struct GADatasetFileSystemDatasetClass
{
  /** */
  GADatasetDatasetClass parentClass;
}

/** */
struct GADatasetFileSystemDatasetFactory
{
  /** */
  GADatasetDatasetFactory parentInstance;
}

/** */
struct GADatasetFileSystemDatasetFactoryClass
{
  /** */
  GADatasetDatasetFactoryClass parentClass;
}

/** */
struct GADatasetFileSystemDatasetWriteOptions
{
  /** */
  ObjectC parentInstance;
}

/** */
struct GADatasetFileSystemDatasetWriteOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetFileWriteOptions
{
  /** */
  ObjectC parentInstance;
}

/** */
struct GADatasetFileWriteOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetFileWriter
{
  /** */
  ObjectC parentInstance;
}

/** */
struct GADatasetFileWriterClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetFinishOptions
{
  /** */
  ObjectC parentInstance;
}

/** */
struct GADatasetFinishOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetFragment
{
  /** */
  ObjectC parentInstance;
}

/** */
struct GADatasetFragmentClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetHivePartitioning
{
  /** */
  GADatasetKeyValuePartitioning parentInstance;
}

/** */
struct GADatasetHivePartitioningClass
{
  /** */
  GADatasetKeyValuePartitioningClass parentClass;
}

/** */
struct GADatasetHivePartitioningOptions
{
  /** */
  GADatasetKeyValuePartitioningOptions parentInstance;
}

/** */
struct GADatasetHivePartitioningOptionsClass
{
  /** */
  GADatasetKeyValuePartitioningOptionsClass parentClass;
}

/** */
struct GADatasetIPCFileFormat
{
  /** */
  GADatasetFileFormat parentInstance;
}

/** */
struct GADatasetIPCFileFormatClass
{
  /** */
  GADatasetFileFormatClass parentClass;
}

/** */
struct GADatasetInMemoryFragment
{
  /** */
  GADatasetFragment parentInstance;
}

/** */
struct GADatasetInMemoryFragmentClass
{
  /** */
  GADatasetFragmentClass parentClass;
}

/** */
struct GADatasetKeyValuePartitioning
{
  /** */
  GADatasetPartitioning parentInstance;
}

/** */
struct GADatasetKeyValuePartitioningClass
{
  /** */
  GADatasetPartitioningClass parentClass;
}

/** */
struct GADatasetKeyValuePartitioningOptions
{
  /** */
  ObjectC parentInstance;
}

/** */
struct GADatasetKeyValuePartitioningOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetParquetFileFormat
{
  /** */
  GADatasetFileFormat parentInstance;
}

/** */
struct GADatasetParquetFileFormatClass
{
  /** */
  GADatasetFileFormatClass parentClass;
}

/** */
struct GADatasetPartitioning
{
  /** */
  ObjectC parentInstance;
}

/** */
struct GADatasetPartitioningClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetPartitioningFactoryOptions
{
  /** */
  ObjectC parentInstance;
}

/** */
struct GADatasetPartitioningFactoryOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetScanner
{
  /** */
  ObjectC parentInstance;
}

/** */
struct GADatasetScannerBuilder
{
  /** */
  ObjectC parentInstance;
}

/** */
struct GADatasetScannerBuilderClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetScannerClass
{
  /** */
  GObjectClass parentClass;
}

