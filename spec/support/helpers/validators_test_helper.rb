module ValidatorsTestHelper

  @@class_name_sequence = 0
  ##
  # Object for use in validators tests.
  #
  # It should be initialized with a hash of hashes, as follow:
  # { :first_attribute_name => { :type => :string, :validator_name => true } }
  # Usage:
  #   * object_with_validations :name => { :type => :string, :presence => true }
  #   * ObjectWithValidations.new :size => { :type => :integer, :presence => true, :inclusion => {
  #                                           :in => %w(small medium large) } }
  ##
  def object_with_validations(columns = {})
    klass = Class.new ActiveRecord::Base do
      def self.columns() @columns ||= []; end
      def self.column(name, sql_type = nil, default = nil, null = true)
        columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
        attr_accessor name
      end

      columns.each_pair do |column_name, opts|
        column column_name, opts.delete(:type)
        validates column_name, opts unless opts.empty?
      end
    end
    Object.const_set("ObjectWithValidation_#{@@class_name_sequence}", klass)
    @@class_name_sequence += 1

    klass.new
  end

end

