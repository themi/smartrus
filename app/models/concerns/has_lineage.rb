require_relative "has_lineage/exception"
require_relative "has_lineage/class_options"
require_relative "has_lineage/class_methods"
require_relative "has_lineage/class_sql"
require_relative "has_lineage/instance_methods"
# require_relative "active_support/concern"
# require_relative "active_support/core_ext/class/attribute_accessors"

module HasLineage
  extend ActiveSupport::Concern

  included do
    class_attribute :has_lineage_options
  end

  module ClassMethods
    include LineageClassOptions
    include LineageClassMethods
    include LineageClassSql
  end

  include LineageInstanceMethods
end
