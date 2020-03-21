class Request < ApplicationRecord
  belongs_to :user
  has_one :review
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :category, inclusion: { in: ["Compras", "Reparações", "Recados", "Saúde", "Cuidados", "Donativos", "Companhia", "Associação", "Outro"] }
  validates :age, numericality: true
  validates :address, presence: true
  validates :zip_code, presence: true, format: { with: /\d{4}\-\d{3}/, message: "Por favor introduz um Código Postal válido"}
  validates :city, presence: true

end

