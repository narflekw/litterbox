# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pcr_operations_session',
  :secret      => 'e053a515cda6ecf652d0e85c9187d8ef483cee5d282311ec1edc0e1a2fbeb6b265acbcb888f1a97ef324d75d7aa9bc515a22d8491b82c583e1395b40f75e1082'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
