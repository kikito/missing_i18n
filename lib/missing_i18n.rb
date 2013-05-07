require "missing_i18n/engine"

module MissingI18n
  DEFAULT_IGNORED_SCOPES = %w{
    activemodel.errors.messages
    activemodel.errors.template.header
    activerecord.errors.messages
    activerecord.errors.template.header
    datetime.distance_in_words
    datetime.prompts
    errors.messages
    errors.template.header
    helpers.button
    helpers.select
    helpers.submit
    i18n
    number
    support.array
    time
  }

  def self.ignored_scopes=(new_ignored_scopes)
    @@ignored_scopes = new_ignored_scopes
  end

  def self.ignored_scopes
    @@ignored_scopes ||= DEFAULT_IGNORED_SCOPES.clone
  end
end
