class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.account_mapping_mode :internal
  end

end
