//!gir freetype2-2.0
//!info description "D binding for the FreeType library - font rendering library"
//!info homepage https://freetype.org

//# Change package name to just freetype2 rather than freetype22
//!info name freetype2

//# Include GLib for gid module
//!add repository '<include name="GLib" version="2.0"/>'

//# Set to structure pointers
//!set record[Face][pointer] 1
//!set record[Library][pointer] 1

//!del alias[Int32]
