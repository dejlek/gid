module gtksource.types;

import gid.gid;
import gtksource.c.functions;
import gtksource.c.types;


// Enums
alias BackgroundPatternType = GtkSourceBackgroundPatternType;
alias BracketMatchType = GtkSourceBracketMatchType;
alias ChangeCaseType = GtkSourceChangeCaseType;
alias CompletionActivation = GtkSourceCompletionActivation;
alias CompletionError = GtkSourceCompletionError;
alias CompressionType = GtkSourceCompressionType;
alias FileLoaderError = GtkSourceFileLoaderError;
alias FileSaverError = GtkSourceFileSaverError;
alias FileSaverFlags = GtkSourceFileSaverFlags;
alias GutterRendererAlignmentMode = GtkSourceGutterRendererAlignmentMode;
alias GutterRendererState = GtkSourceGutterRendererState;
alias NewlineType = GtkSourceNewlineType;
alias SmartHomeEndType = GtkSourceSmartHomeEndType;
alias SortFlags = GtkSourceSortFlags;
alias SpaceLocationFlags = GtkSourceSpaceLocationFlags;
alias SpaceTypeFlags = GtkSourceSpaceTypeFlags;
alias ViewGutterPosition = GtkSourceViewGutterPosition;

// Structs
alias BufferPrivate = GtkSourceBufferPrivate*;
alias CompletionContextPrivate = GtkSourceCompletionContextPrivate*;
alias CompletionInfoPrivate = GtkSourceCompletionInfoPrivate*;
alias CompletionItemPrivate = GtkSourceCompletionItemPrivate*;
alias CompletionPrivate = GtkSourceCompletionPrivate*;
alias CompletionWordsPrivate = GtkSourceCompletionWordsPrivate*;
alias FileLoaderPrivate = GtkSourceFileLoaderPrivate*;
alias FilePrivate = GtkSourceFilePrivate*;
alias FileSaverPrivate = GtkSourceFileSaverPrivate*;
alias GutterPrivate = GtkSourceGutterPrivate*;
alias GutterRendererPixbufPrivate = GtkSourceGutterRendererPixbufPrivate*;
alias GutterRendererPrivate = GtkSourceGutterRendererPrivate*;
alias GutterRendererTextPrivate = GtkSourceGutterRendererTextPrivate*;
alias LanguageManagerPrivate = GtkSourceLanguageManagerPrivate*;
alias LanguagePrivate = GtkSourceLanguagePrivate*;
alias MarkAttributesPrivate = GtkSourceMarkAttributesPrivate*;
alias MarkPrivate = GtkSourceMarkPrivate*;
alias PrintCompositorPrivate = GtkSourcePrintCompositorPrivate*;
alias SearchContextPrivate = GtkSourceSearchContextPrivate*;
alias SearchSettingsPrivate = GtkSourceSearchSettingsPrivate*;
alias SpaceDrawerPrivate = GtkSourceSpaceDrawerPrivate*;
alias StyleSchemeManagerPrivate = GtkSourceStyleSchemeManagerPrivate*;
alias StyleSchemePrivate = GtkSourceStyleSchemePrivate*;
alias ViewPrivate = GtkSourceViewPrivate*;
