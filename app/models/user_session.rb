class UserSession < Authlogic::Session::Base
  extend ActiveModel::Naming

  rpx_key ENV['RPX_API_KEY']
  auto_register true
  rpx_extended_info

  private

  # map_rpx_data maps additional fields from the RPX response into the user object
  # override this in your session controller to change the field mapping
  # see https://rpxnow.com/docs#profile_data for the definition of available attributes
  #
  def map_rpx_data
    # map core profile data using authlogic indirect column names
    self.attempted_record.send("#{klass.login_field}=", @rpx_data['profile']['preferredUsername'] ) if attempted_record.send(klass.login_field).blank?
    self.attempted_record.send("#{klass.email_field}=", @rpx_data['profile']['email'] ) if attempted_record.send(klass.email_field).blank?

    # map some other columns explicitly
    self.attempted_record.name = @rpx_data['profile']['displayName'] if attempted_record.name.blank?

    if rpx_extended_info?
      # map some extended attributes
    end
  end

end
