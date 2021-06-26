class User < ApplicationRecord
    has_secure_password
    validates :email, :name, presence: true
    validates :email, uniqueness: true
    has_many :artists
  
    # def user_serializer
    #     {
    #         name: name,
    #         email: email,
    #         id: id
    #     }
    # end
end
