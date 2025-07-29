resource "oci_resource_scheduler_schedule" "test_schedule" {
  action             = var.action
  compartment_id     = var.compartment_id
  recurrence_details = var.recurrence_details
  recurrence_type    = var.recurrence_type
  defined_tags       = var.defined_tags
  description        = var.description
  display_name       = var.display_name
  freeform_tags      = var.freeform_tags
  resource_filters {
    attribute                         = var.schedule_resource_filters_attribute
    condition                         = var.schedule_resource_filters_condition
    should_include_child_compartments = var.schedule_resource_filters_should_include_child_compartments
    value {
      namespace = var.schedule_resource_filters_value_namespace
      tag_key   = var.schedule_resource_filters_value_tag_key
      value     = var.schedule_resource_filters_value_value
    }
  }
  resources {
    id       = var.schedule_resources_id
    metadata = var.schedule_resources_metadata
    parameters {
      parameter_type = var.schedule_resources_parameters_parameter_type
      value          = var.schedule_resources_parameters_value
    }
  }
  time_ends   = var.schedule_time_ends
  time_starts = var.schedule_time_starts

  # resource_filters {
  #   attribute = "DEFINED_TAGS"
  #   value {
  #     namespace = "SampleNamespace"
  #     tag_key   = "SampleTagKey"
  #     value     = "SampleValue"
  #   }
  # }
  # resource_filters {
  #   attribute = "LIFECYCLE_STATE"
  #   value {
  #     value = "SampleLifecycleState"
  #   }
  # }
  # resource_filters {
  #   attribute = "COMPARTMENT_ID"
  #   value {
  #     value = var.compartment_id
  #   }
  # }
}
