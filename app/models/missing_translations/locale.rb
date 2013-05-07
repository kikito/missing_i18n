module MissingTranslations
  class Locale #plain old ruby object

    DEFAULT_IGNORED_SCOPES = %w{
      activemodel.errors.messages
      activerecord.errors.messages
      errors.messages
      helpers.button
      number
    }

    @@merged_translations = nil
    @@i18n_translations = nil
    @@all = nil

    attr_accessor :id

    def initialize(id)
      self.id = id.to_s
    end

    def to_yaml(ignored_scopes = DEFAULT_IGNORED_SCOPES)
      {self.id => missing_translations(ignored_scopes)}.to_yaml
    end

    def translations
      self.class.i18n_translations[self.id]
    end

    def missing_translations(ignored_scopes = DEFAULT_IGNORED_SCOPES)
      diff = hash_deep_diff(self.class.merged_translations, self.translations)
      return hash_filter(diff, [], ignored_scopes)
    end

    def self.all
      @@all ||= I18n.available_locales.collect{ |id| new(id) }
    end

    def self.merged_translations
      unless @@merged_translations
        @@merged_translations = {}
        i18n_translations.each do |locale, translations|
          @@merged_translations = translations.deep_merge(@@merged_translations)
        end
      end
      @@merged_translations
    end

    def self.i18n_translations
      unless @@i18n_translations
        I18n.backend.send :init_translations
        @@i18n_translations = hash_deep_stringify_keys(I18n.backend.send(:translations))
      end
      @@i18n_translations
    end

    private


    def hash_filter(hash, scope, ignored_scopes)
      return hash unless hash.is_a? Hash
      result = {}
      hash.each do |key, value|
        new_scope = scope.dup << key
        unless new_scope.join('.').in?(ignored_scopes)
          new_value = hash_filter(value, new_scope, ignored_scopes)
          result[key] = new_value unless new_value.blank?
        end
      end
      result
    end

    # assumption big contains small completely
    def hash_deep_diff(big, small)
      return big unless small.is_a? Hash
      result = {}
      big.each do |key, value|
        if small[key].present?
          if value.is_a?(Hash)
            diff = hash_deep_diff(value, small[key])
            result[key] = diff unless diff.empty?
          end
        else
          result[key] = value
        end
      end
      result
    end

    def self.hash_deep_stringify_keys(hash)
      return hash unless hash.is_a? Hash
      hash.each_with_object({}) do |(key,value), result|
        result[key.to_s] = hash_deep_stringify_keys(value)
      end
    end

  end
end
