require_relative "recurse_try/version"
require_relative "recurse_try/plugin_methods"
require_relative "recurse_try/method_class"
require_relative "recurse_try/version"

module RecurseTry
  def self.included(klass)
    klass.include PluginMethods
    klass.extend PluginMethods
  end
end
