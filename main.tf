resource "oci_resource_scheduler_schedule" "this" {
  action             = var.action
  compartment_id     = var.compartment_id
  recurrence_details = var.recurrence_details
  recurrence_type    = var.recurrence_type
  defined_tags       = var.defined_tags
  description        = var.description
  display_name       = var.display_name
  freeform_tags      = var.freeform_tags
  dynamic "resource_filters" {
    for_each = var.resource_filters[*]
    iterator = rf
    content {
      attribute                         = rf.value.attribute
      condition                         = rf.value.condition
      should_include_child_compartments = rf.value.should_include_child_compartments
      value {
	namespace = rf.value.value.namespace
	tag_key   = rf.value.value.tag_key
	value     = rf.value.value.value
      }
    }
  }
  dynamic "resources" {
    for_each = var.resources
    content {
      id       = resources.value.id
      metadata = resources.value.metadata
      dynamic "parameters" {
	for_each = resources.value.parameters[*]
	content {
	  parameter_type = parameters.value.parameter_type
	  value          = parameters.value.value
	}
      }
    }
  }
  time_ends   = var.time_ends
  time_starts = var.time_starts
}
