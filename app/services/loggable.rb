module Loggable
  extend ActiveSupport::Concern

  included do
  end

  def log_debug(message, klass: true)
    if klass
      pp "#{self.class.to_s} -- #{message}"
    else
      pp message
    end
  end

  def log_error(message)
    log_debug "ERROR -- #{message}"
  end
end
