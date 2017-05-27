class Task < ApplicationRecord

	validates :title, presence: true, length: {maximum: 50}

	validates :description, presence: true, length: {maximum: 250}
	
	validates :id_category, presence: true

	validates :date, presence: true

	validates :id_user, presence: true

	validates :id_category, presence: true

	validates :idDayWeek, presence: true
end
