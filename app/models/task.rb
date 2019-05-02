class Task < ApplicationRecord
	enum state: [:not_started_yet, :in_progress,:done] 
	belongs_to :user, optional: true

	def deadline_over?
		Date.today > deadline
	end



end
