class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :requests
  has_many :assignments_as_asker, source: :assignment, foreign_key: :asker_id
  has_many :requests_as_volunteer, source: :request, foreign_key: :volunteer_id
  acts_as_favoritor
  acts_as_favoritable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :about_me, length: { maximum: 300 }


  def full_name
    "#{self.first_name.capitalize}" + " " + "#{self.last_name.capitalize}"
  end
end
