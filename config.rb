require 'yaml'

# Config helper
class Config
  def initialize(file)
    @config = YAML.load_file file
    @config.keys.each do |k|
      self.class.send(:define_method, k) do
        @config[k]
      end
    end
  end
end
