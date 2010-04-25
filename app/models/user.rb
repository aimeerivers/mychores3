class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.account_mapping_mode :internal
    c.validates_uniqueness_of_email_field_options = {:if => :validate_uniqueness_of_email?}
    c.transition_from_restful_authentication = true
  end

  def validate_uniqueness_of_email?
    false
  end

  def display_name
    name.blank? ? login : name
  end
end

# Provided for transition from old Restful Authentication
module Authlogic
  module CryptoProviders
    class Sha1
      def self.encrypt(*tokens)
        Digest::SHA1.hexdigest("#{tokens[1]}--#{tokens[2]}--")
      end
    end
  end
end

