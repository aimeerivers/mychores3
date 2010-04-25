require File.join(File.dirname(__FILE__), '../../config/environment.rb')

namespace :mychores do
  desc 'Import data from previous version'
  task :import do
    require 'faster_csv'
    import_users
  end

  def import_users
    puts '=== USERS ==='

    puts 'Deleting all users and RPX data ...'
    User.destroy_all
    RPXIdentifier.destroy_all
    puts '... done'

    puts 'Importing users ...'
    User.connection.execute("ALTER TABLE users AUTO_INCREMENT = 10000")
    FasterCSV.foreach(RAILS_ROOT + '/db/import/people.csv', :headers => true) do |row|
      next unless row['usertype'] == '1'

      user = User.create(
        :name => row['name'],
        :login => row['login'],
        :email => row['email'],
        :password => 'fake-password',
        :password_confirmation => 'fake-password',
        :created_at => row['created_on']
      )
      if !user.valid?
        puts "##{row['id']} #{row['login']} is not valid"
        next
      end

      user.update_attributes(:crypted_password => row['password'], :password_salt => 'Planner')
      # Put the ID to what it should be
      User.connection.execute("UPDATE users SET id = #{row['id']} WHERE id = #{user.id}")

      # Add OpenID URL for those who use it
      unless row['openid_url'] == 'NULL'
        RPXIdentifier.create(
          :identifier => row['openid_url'],
          :provider_name => 'OpenID',
          :user_id => row['id']
        )
      end
    end
    puts '... done'
  end

end
