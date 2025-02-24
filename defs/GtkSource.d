//!repo GtkSource-5

//# (temporarily disabling the following methods:

//# Reason:InOut arguments of type 'Boxed' not supported (GtkSource.Buffer.backwardIterToSourceMark)
//!set class[Buffer].method[backward_iter_to_source_mark][disable] 1

//# Reason: InOut arguments of type 'Boxed' not supported (GtkSource.Buffer.forwardIterToSourceMark)
//!set class[Buffer].method[forward_iter_to_source_mark][disable] 1

//# Reason: InOut arguments of type 'Boxed' not supported (GtkSource.Buffer.iterBackwardToContextClassToggle)
//!set class[Buffer].method[iter_backward_to_context_class_toggle][disable] 1

//# Reason: InOut arguments of type 'Boxed' not supported (GtkSource.Buffer.iterForwardToContextClassToggle)
//!set class[Buffer].method[iter_forward_to_context_class_toggle][disable] 1

//# Reason: InOut arguments of type 'Boxed' not supported (GtkSource.Indenter.indent)
//!set interface[Indenter].method[indent][disable] 1

//# Reason: generates an alias measure = Widget.measure, yet Gtk.Widget is not in the import list
//!set class[GutterRendererText].method[measure][disable] 1
