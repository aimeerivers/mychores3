# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mychores3_session',
  :secret      => 'c6b5142cf28261e7442abc97d927d3d5d7f406b7816c5d9774e524296f50538d8de20716252391b53aa6222348f5feed77cfe583e4d5ac2af707e7d2b2150413'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
