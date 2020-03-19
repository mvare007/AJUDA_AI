class Request < ApplicationRecord
  belongs_to :user
  has_one :review

  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :category, inclusion: { in: ["compras", "obras", "recados", "saúde", "cuidados", "donativos"] }
  validates :person_name, presence: true
  validates :age, numericality: true
  validates :address, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true

end
