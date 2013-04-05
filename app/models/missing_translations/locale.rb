module MissingTranslations
  class Locale #plain old ruby object

    DEFAULT_IGNORED_PREFIXES = %w{
      activemodel.errors.messages
      activerecord.errors.messages
      errors.messages
      helpers.button
      number
    }

    @@translations = nil
    @@keys = nil
    @@all = nil

    attr_accessor :name

    def initialize(name)
      self.name = name
    end

    def missing_keys(ignored_prefixes = DEFAULT_IGNORED_PREFIXES)
      self.class.all_keys.reject{ |k| ignores_key?(k, ignored_prefixes) || has_key?(k) }
    end

    def has_key?(key)
      # in the future, this might be replaced by I18n.exists? . See https://github.com/svenfuchs/i18n/pull/182
      I18n.backend.send(:lookup, self.name, key).present?
    end

    def ignores_key?(key, ignored_prefixes = DEFAULT_IGNORED_PREFIXES)
      ignored_prefixes.any?{ |i_p| key.start_with? i_p }
    end

    def self.all
      @@all ||= I18n.available_locales.collect{ |name| new(name) }
    end

    private

    def self.all_translations
      unless @@translations
        I18n.backend.send :init_translations
        @@translations = I18n.backend.send :translations
      end
      @@translations
    end

    def self.all_keys
      @@keys ||= all_translations.collect do |check_locale, translations|
        collect_keys([], translations).sort
      end.flatten.uniq
    end

    def self.collect_keys(scope, translations)
      full_keys = []
      translations.to_a.each do |key, translations|
        next if translations.nil?

        new_scope = scope.dup << key
        if translations.is_a?(Hash)
          full_keys += collect_keys(new_scope, translations)
        else
          full_keys << new_scope.join('.')
        end
      end
      full_keys
    end

  end
end
