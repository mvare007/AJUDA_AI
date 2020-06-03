class Request < ApplicationRecord
  belongs_to :user
  has_one :review
  has_one :chatroom, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_one :volunteer, dependent: :destroy
  has_many :pictures, dependent: :destroy
  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_address?
  acts_as_favoritable

  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 2000 }
  validates :category, inclusion: { in: ["Reparações", "Recados", "Saúde", "Cuidados", "Donativos", "Companhia", "Associação", "Animais", "Denúncia", "Outro"] }
  validates :zip_code, format: { with: /\d{4}\-\d{3}/}
  validates :city, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_city,
    against: [ :title, :city ],
    using: {
      tsearch: { prefix: true }
    }

  def full_address
    "#{self.address}" + ", " + "#{self.zip_code}" + " " + "#{self.city}"
  end

end

