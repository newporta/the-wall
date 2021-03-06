class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:github]

  has_many :projects

  def self.from_omniauth(auth)
    where(
      :github_username => auth[:info][:nickname]
    ).first_or_create do |user|
      user.email = auth[:info][:email]
    end
  end
end
