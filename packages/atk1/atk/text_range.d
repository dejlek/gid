module atk.text_range;

import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;
import gobject.boxed;

/**
 * A structure used to describe a text range.
 */
class TextRange : gobject.boxed.Boxed
{

  this()
  {
    super(safeMalloc(AtkTextRange.sizeof), Yes.Take);
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_text_range_get_type != &gidSymbolNotFound ? atk_text_range_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  @property atk.types.TextRectangle bounds()
  {
    return (cast(AtkTextRange*)cPtr).bounds;
  }

  @property void bounds(atk.types.TextRectangle propval)
  {
    (cast(AtkTextRange*)cPtr).bounds = propval;
  }

  @property int startOffset()
  {
    return (cast(AtkTextRange*)cPtr).startOffset;
  }

  @property void startOffset(int propval)
  {
    (cast(AtkTextRange*)cPtr).startOffset = propval;
  }

  @property int endOffset()
  {
    return (cast(AtkTextRange*)cPtr).endOffset;
  }

  @property void endOffset(int propval)
  {
    (cast(AtkTextRange*)cPtr).endOffset = propval;
  }

  @property string content()
  {
    return (cast(AtkTextRange*)cPtr).content.fromCString(No.Free);
  }

  @property void content(string propval)
  {
    safeFree(cast(void*)(cast(AtkTextRange*)cPtr).content);
    (cast(AtkTextRange*)cPtr).content = propval.toCString(Yes.Alloc);
  }
}
