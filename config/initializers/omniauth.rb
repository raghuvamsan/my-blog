Rails.application.config.middleware.use OmniAuth::Builder do
  # The following is for facebook
  provider :facebook, "1403624496544543", "c2ecd5626ae5d880024481537be5de8a", {:scope => 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
 
  provider :twitter, "nRnpN65t72ipJFhR7R0JQ", "CVCYfBH4l72q0WSDobjwfAoZxOoxn6eUX3QAAIkoU", {:scope => 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
  
  provider :google_oauth2, "804981136378-svkhvrn2vq10rhafp1tsqte2ou1stkk7.apps.googleusercontent.com", "N2PXYakWlZPfR_LYbkn4aH6c"
  # If you want to also configure for additional login services, they would be configured here.
end