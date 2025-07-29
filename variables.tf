variable "action" {
  description = "(Required) (Updatable) This is the action that will be executed by the schedule."
  type        = string
}

variable "compartment_id" {
  description = "(Required) (Updatable) The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment in which the schedule is created"
  type        = string
}

variable "defined_tags" {
  description = "(Optional) (Updatable) These are defined tags for this resource. Each key is predefined and scoped to a namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm)."
  type        = map(string)
  default     = null
}

variable "description" {
  description = "(Optional) (Updatable) This is the description of the schedule."
  type        = string
  default     = null
}

variable "display_name" {
  description = "(Optional) (Updatable) This is a user-friendly name for the schedule. It does not have to be unique, and it's changeable."
  type        = string
  default     = null
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) These are free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm)."
  type        = map(string)
  default     = {}
}

variable "recurrence_details" {
  description = "(Required) (Updatable) This is the frequency of recurrence of a schedule. The frequency field can either conform to RFC-5545 formatting or UNIX cron formatting for recurrences, based on the value specified by the recurrenceType field."
  type        = string
}

variable "recurrence_type" {
  description = "(Required) (Updatable) Type of recurrence of a schedule"
  type        = string
}


variable "resource_filters" {
  description = "(Optional) (Updatable) This is a list of resources filters.  The schedule will be applied to resources matching all of them."
  type = object({
    attribute = string
    value = optional(object({
      namespace                         = optional(string)
      tag_key                           = optional(string)
      value                             = optional(string)
      condition                         = optional(string)
      should_include_child_compartments = optional(string)
    }))
  })
  default = null
}

variable "resources" {
  description = "(Optional) (Updatable) This is the list of resources to which the scheduled operation is applied."
  type = list(object({
    id       = string
    metadata = optional(map(string))
    parameters = optional(object({
      parameter_type = optional(string)
      value          = optional(string)
    }))
  }))
  default = []
}

variable "time_ends" {
  description = "(Optional) (Updatable) This is the date and time the schedule ends, in the format defined by [RFC 3339](https://tools.ietf.org/html/rfc3339)  Example: `2016-08-25T21:10:29.600Z`"
  type        = string
  default     = null
}

variable "time_starts" {
  description = "(Optional) (Updatable) This is the date and time the schedule starts, in the format defined by [RFC 3339](https://tools.ietf.org/html/rfc3339)  Example: `2016-08-25T21:10:29.600Z`"
  type        = string
  default     = null
}

variable "state" {
  description = "(Optional) (Updatable) The target state for the Schedule. Could be set to `ACTIVE` or `INACTIVE`."
  type        = string
  default     = "ACTIVE"
}
