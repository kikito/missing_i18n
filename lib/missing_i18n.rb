require "missing_i18n/engine"

module MissingI18n
  DEFAULT_IGNORED_SCOPES = %w{
    activemodel.errors.messages
    activerecord.errors.messages
    errors.messages
    helpers.button
    number
  }

  def self.ignored_scopes=(new_ignored_scopes)
    @@ignored_scopes = new_ignored_scopes
  end

  def self.ignored_scopes
    @@ignored_scopes ||= DEFAULT_IGNORED_SCOPES.clone
  end
end
