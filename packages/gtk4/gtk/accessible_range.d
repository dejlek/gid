module gtk.accessible_range;

public import gtk.accessible_range_iface_proxy;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    This interface describes ranged controls, e.g. controls which have a single
  value within an allowed range and that can optionally be changed by the user.
  
  This interface is expected to be implemented by controls using the following
  roles:
  
  $(LIST
    * [gtk.types.AccessibleRole.meter]
    * [gtk.types.AccessibleRole.progressBar]
    * [gtk.types.AccessibleRole.scrollbar]
    * [gtk.types.AccessibleRole.slider]
    * [gtk.types.AccessibleRole.spinButton]
  )
    
  If that is not the case, a warning will be issued at run time.
  
  In addition to this interface, its implementers are expected to provide the
  correct values for the following properties:
  
  $(LIST
    * [gtk.types.AccessibleProperty.valueMax]
    * [gtk.types.AccessibleProperty.valueMin]
    * [gtk.types.AccessibleProperty.valueNow]
    * [gtk.types.AccessibleProperty.valueText]
  )
*/
interface AccessibleRange
{

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_accessible_range_get_type != &gidSymbolNotFound ? gtk_accessible_range_get_type() : cast(GType)0;
  }
}
