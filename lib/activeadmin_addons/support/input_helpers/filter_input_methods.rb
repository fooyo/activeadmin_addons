module ActiveAdminAddons
  module FilterInputMethods
    include InputMethods

    def object_class
      valid_object.klass
    end

    def input_value
      result = valid_object.conditions.find do |condition|
        condition.attributes.map(&:name).include?(valid_method.to_s)
      end

      return unless result
      result.values.first.value
    end

    def eq_input_name
      "#{valid_method}_eq"
    end
  end
end
