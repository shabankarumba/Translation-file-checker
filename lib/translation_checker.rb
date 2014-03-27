require 'yaml'

class TranslationChecker
  attr_accessor :missing_translations, :file

  def initialize(file)
    @file = YAML.load_file(file)
    @missing_translations = []
  end

  def output_missing_translations
    @missing_translations.each do |missing|
      puts "The following needs to be translated:- #{missing}"
    end
  end

  def check_for_missing_values(data = nil)
    data = data || @file[@file.keys.first]
    data.each do |key,value|
      if value.is_a?(Hash)
        check_for_missing_values(value)
      elsif !value
        @missing_translations << key
      end
    end
  end
end

