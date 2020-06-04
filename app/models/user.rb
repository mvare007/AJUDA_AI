class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :requests
  has_many :assignments_as_asker, source: :assignment, foreign_key: :asker_id
  has_many :requests_as_volunteer, source: :request, foreign_key: :volunteer_id
  has_many :chatrooms, dependent: :destroy
  has_many :messages
  has_one_attached :photo
  acts_as_favoritor
  acts_as_favoritable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true, format: { with: /\d{4}\-\d{3}/}
  validates :city, presence: true
  validates :about_me, length: { maximum: 300 }

  include PgSearch::Model
  pg_search_scope :search_by_first_name_last_name_and_city,
    against: [ :first_name, :last_name, :city ],
    using: {
      tsearch: { prefix: true }
    }

  def full_name
    "#{self.first_name.capitalize}" + " " + "#{self.last_name.capitalize}"
  end
end
