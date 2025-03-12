module cairo.text_cluster;

import cairo.c.functions;
import cairo.c.types;
import cairo.types;
import gid.gid;
import gobject.boxed;

/**
    The #cairo_text_cluster_t structure holds information about a single
  <firstterm>text cluster</firstterm>.  A text cluster is a minimal
  mapping of some glyphs corresponding to some UTF-8 text.
  
  For a cluster to be valid, both @num_bytes and @num_glyphs should
  be non-negative, and at least one should be non-zero.
  Note that clusters with zero glyphs are not as well supported as
  normal clusters.  For example, PDF rendering applications typically
  ignore those clusters when PDF text is being selected.
  
  See [cairo.context.Context.showTextGlyphs] for how clusters are used in advanced
  text operations.
*/
class TextCluster : gobject.boxed.Boxed
{

  this()
  {
    super(gMalloc(cairo_text_cluster_t.sizeof), Yes.Take);
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())cairo_gobject_text_cluster_get_type != &gidSymbolNotFound ? cairo_gobject_text_cluster_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override TextCluster self()
  {
    return this;
  }

  @property int numBytes()
  {
    return (cast(cairo_text_cluster_t*)cPtr).numBytes;
  }

  @property void numBytes(int propval)
  {
    (cast(cairo_text_cluster_t*)cPtr).numBytes = propval;
  }

  @property int numGlyphs()
  {
    return (cast(cairo_text_cluster_t*)cPtr).numGlyphs;
  }

  @property void numGlyphs(int propval)
  {
    (cast(cairo_text_cluster_t*)cPtr).numGlyphs = propval;
  }
}
