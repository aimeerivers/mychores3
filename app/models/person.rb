class Person < ActiveRecord::Base

  validates_length_of :email, :minimum => 6
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "should look like an email address"

  belongs_to :user

  def display_name
    name.blank? ? user.login : name
  end

end
