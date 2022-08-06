# typed: strict

module Tapioca
  module Compilers
    class ActiveInteraction < Tapioca::Dsl::Compiler
      extend T::Sig

      ConstantType = type_member { { fixed: T.class_of(::ActiveInteraction::Base) } }

      sig { override.returns(T::Enumerable[Module]) }
      def self.gather_constants
        classes = descendants_of(::ActiveInteraction::Base)
        classes << ::ActiveInteraction::Base unless classes.empty?
        classes
      end

      sig { override.void }
      def decorate
        if constant == ::ActiveInteraction::Base
          handle_base_class_slugs
        else
          handle_interaction_class
        end
      end

      private

      sig { void }
      def handle_base_class_slugs
        filter_classes = descendants_of(::ActiveInteraction::Filter)
        return if filter_classes.empty?

        root.create_path(constant) do |klass|
          filter_classes.each do |filter|
            klass.create_method(
              filter.slug,
              parameters: [
                create_rest_param("args", type: "Symbol"),
                create_kw_rest_param("kwargs", type: "T.untyped"),
                create_block_param("blk", type: "T.untyped")
              ],
              class_method: true
            )
          end
        end
      end

      sig { void }
      def handle_interaction_class
        filters = constant.filters

        return if filters.empty?

        root.create_path(constant) do |klass|
          filters.each_value do |filter|
            klass.create_method(filter.name)
            klass.create_method(
              "#{filter.name}=",
              parameters: [create_param("value", type: "T.untyped")],
              return_type: "void"
            )
          end
        end
      end
    end
  end
end