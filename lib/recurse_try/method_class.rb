module RecurseTry
  class MethodClass
    attr_accessor :object, :methods
    def initialize(new_object, *new_methods)
      @object = new_object
      @methods = new_methods.flatten
    end

    def perform
      return object if methods.empty?
      return enumerate if object.is_a?(Enumerator)
      return hash if method.is_a?(Hash)
      return split_string if method.is_a?(String) && method.include?('.')
      return array_string
    rescue
      return nil
    end

    def enumerate
      object.each { |e| object_recurse_try(e, *methods) }
    end

    def hash
      object_recurse_try(object.send(*method.first), methods)
    end

    def split_string
      object_recurse_try(object_recurse_try(object, method.split('.')), methods)
    end

    def array_string
      object_recurse_try(object.send(method), methods)
    end

    def method
      @method ||= methods.shift
    end

    def object_recurse_try(new_object, *new_methods)
      MethodClass.new(new_object, new_methods).perform
    end
  end
end
