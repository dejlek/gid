module gstcontroller.types;

import gid.gid;
import gobject.value;
import gstcontroller.c.functions;
import gstcontroller.c.types;
import gstcontroller.direct_control_binding;


// Enums

/** */
alias InterpolationMode = GstInterpolationMode;

/** */
alias LFOWaveform = GstLFOWaveform;

// Callbacks

/**
    Function to map a control-value to the target GValue.

  ## Parameters
  $(LIST
    * $(B self)       the #GstDirectControlBinding instance
    * $(B srcValue)       the value returned by the cotnrol source
    * $(B destValue)       the target GValue
  )
*/
alias DirectControlBindingConvertGValue = void delegate(gstcontroller.direct_control_binding.DirectControlBinding self, double srcValue, gobject.value.Value destValue);

/**
    Function to map a control-value to the target plain data type.

  ## Parameters
  $(LIST
    * $(B self)       the #GstDirectControlBinding instance
    * $(B srcValue)       the value returned by the cotnrol source
    * $(B destValue)       the target location
  )
*/
alias DirectControlBindingConvertValue = void delegate(gstcontroller.direct_control_binding.DirectControlBinding self, double srcValue, void* destValue);
