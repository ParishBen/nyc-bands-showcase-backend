class User < ApplicationRecord
    has_secure_password
    validates :email, :name, presence: true
    validates :email, uniqueness: true
    has_and_belongs_to_many :artists
    def current_user
        User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !!current_user
    end
    # def user_serializer
    #     {
    #         name: name,
    #         email: email,
    #         id: id
    #     }
    # end
end
