class User < ActiveRecord::Base
    
    def self.create_user!(hs)
         hs.merge!(session_token: SecureRandom.base64)
        self.create!(hs)
    end
    
end
