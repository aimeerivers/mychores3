class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.account_mapping_mode :internal
    c.transition_from_restful_authentication = true
  end

  has_many :memberships
  has_many :teams, :through => :memberships

  has_one :person
  accepts_nested_attributes_for :person

  def initialize(params = {})
    params.merge!(:person => Person.new) unless params[:person_attributes]
    super(params)
  end

  def add_to_team(team)
    teams << team
  end

  def member_of?(team)
    teams.include?(team)
  end

  def assign(task)
    return task if task.save
    raise 'Could not save task'
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

