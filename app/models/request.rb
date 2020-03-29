class Request < ApplicationRecord
  belongs_to :user
  has_one :volunteer
  has_one :review
  has_many :assignments, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  acts_as_favoritable

  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :category, inclusion: { in: ["Compras", "Reparações", "Recados", "Saúde", "Cuidados", "Donativos", "Companhia", "Associação", "Animais", "Denúncia", "Outro"] }
  validates :address, presence: true
  validates :zip_code, presence: true, format: { with: /\d{4}\-\d{3}/}
  validates :city, presence: true

  def completo
    self.completed ? "Sim" : "Não"
  end

  def volunteer
    User.find(self.volunteer_id)
  end
end

