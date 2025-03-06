module rsvg.types;

import gid.gid;
import rsvg.c.functions;
import rsvg.c.types;


// Structs

/** */
alias DimensionData = RsvgDimensionData;

/** */
alias Length = RsvgLength;

/** */
alias PositionData = RsvgPositionData;

/** */
alias Rectangle = RsvgRectangle;

// Callbacks

/**
    Function to let a user of the library specify the SVG's dimensions
  
  See the documentation for [rsvg.handle.Handle.setSizeCallback] for an example, and
  for the reasons for deprecation.

  ## Parameters
  $(LIST
    * $(B width)       the width of the SVG
    * $(B height)       the height of the SVG
  )

  Deprecated:     Use [rsvg.handle.Handle.renderDocument] instead, which lets you specify
    a viewport size in which to render the SVG document.
*/
alias SizeFunc = void delegate(out int width, out int height);

/**
    An enumeration representing possible errors
*/
enum Error
{
  /**
      the request failed
  */
  Failed = 0,
}

/**
    Configuration flags for an [rsvg.handle.Handle].  Note that not all of [rsvg.handle.Handle]'s
  constructors let you specify flags.  For this reason, [rsvg.handle.Handle.newFromGfileSync]
  and [rsvg.handle.Handle.newFromStreamSync] are the preferred ways to create a handle.
*/
enum HandleFlags : uint
{
  /**
      No flags are set.
  */
  FlagsNone = 0,

  /**
      Disable safety limits in the XML parser.  Libxml2 has
    [several limits](https://gitlab.gnome.org/GNOME/libxml2/blob/master/include/libxml/parserInternals.h)
    designed to keep malicious XML content from consuming too much memory while parsing.
    For security reasons, this should only be used for trusted input!  Since: 2.40.3
  */
  FlagUnlimited = 1,

  /**
      Use this if the Cairo surface to which you are
    rendering is a PDF, PostScript, SVG, or Win32 Printing surface.  This will make librsvg
    and Cairo use the original, compressed data for images in the final output, instead of
    passing uncompressed images.  For example, this will make the a resulting PDF file
    smaller and faster.  Please see [the Cairo
    documentation](https://www.cairographics.org/manual/cairo-cairo-surface-t.html#cairo-surface-set-mime-data)
    for details.
  */
  FlagKeepImageData = 2,
}

/**
    Units for the [rsvg.types.Length] struct.  These have the same meaning as [CSS length
  units](https://www.w3.org/TR/CSS21/syndata.html#length-units).
*/
enum Unit
{
  /**
      percentage values; where <literal>1.0</literal> means 100%.
  */
  Percent = 0,

  /**
      pixels
  */
  Px = 1,

  /**
      em, or the current font size
  */
  Em = 2,

  /**
      x-height of the current font
  */
  Ex = 3,

  /**
      inches
  */
  In = 4,

  /**
      centimeters
  */
  Cm = 5,

  /**
      millimeters
  */
  Mm = 6,

  /**
      points, or 1/72 inch
  */
  Pt = 7,

  /**
      picas, or 1/6 inch (12 points)
  */
  Pc = 8,
}

/**
    This is a C macro that expands to a number with the major version
  of librsvg against which your program is compiled.
  
  For example, for librsvg-2.3.4, the major version is 2.
  
  C programs can use this as a compile-time check for the required
  version, but note that generally it is a better idea to do
  compile-time checks by calling [pkg-config](https://www.freedesktop.org/wiki/Software/pkg-config/)
  in your build scripts.
  
  Note: for a run-time check on the version of librsvg that your
  program is running with (e.g. the version which the linker used for
  your program), or for programs not written in C, use
  `rsvg_major_version` instead.
*/
enum MAJOR_VERSION = 2;

/**
    This is a C macro that expands to a number with the micro version
  of librsvg against which your program is compiled.
  
  For example, for librsvg-2.3.4, the micro version is 4.
  
  C programs can use this as a compile-time check for the required
  version, but note that generally it is a better idea to do
  compile-time checks by calling [pkg-config](https://www.freedesktop.org/wiki/Software/pkg-config/)
  in your build scripts.
  
  Note: for a run-time check on the version of librsvg that your
  program is running with (e.g. the version which the linker used for
  your program), or for programs not written in C, use
  `rsvg_micro_version` instead.
*/
enum MICRO_VERSION = 1;

/**
    This is a C macro that expands to a number with the minor version
  of librsvg against which your program is compiled.
  
  For example, for librsvg-2.3.4, the minor version is 3.
  
  C programs can use this as a compile-time check for the required
  version, but note that generally it is a better idea to do
  compile-time checks by calling [pkg-config](https://www.freedesktop.org/wiki/Software/pkg-config/)
  in your build scripts.
  
  Note: for a run-time check on the version of librsvg that your
  program is running with (e.g. the version which the linker used for
  your program), or for programs not written in C, use
  `rsvg_minor_version` instead.
*/
enum MINOR_VERSION = 57;

/**
    This is a C macro that expands to a string with the version of
  librsvg against which your program is compiled.
  
  For example, for librsvg-2.3.4, this macro expands to
  `"2.3.4"`.
  
  C programs can use this as a compile-time check for the required
  version, but note that generally it is a better idea to do
  compile-time checks by calling [pkg-config](https://www.freedesktop.org/wiki/Software/pkg-config/)
  in your build scripts.
  
  Note: for a run-time check on the version of librsvg that your
  program is running with (e.g. the version which the linker used for
  your program), or for programs not written in C, use
  `rsvg_version` instead.
*/
enum VERSION = "2.57.1";
