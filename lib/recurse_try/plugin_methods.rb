module RecurseTry
  module PluginMethods
    def recurse_try(*methods)
      MethodClass.new(self, *methods).perform
    end
  end
end
