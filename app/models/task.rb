class Task < ApplicationRecord
	enum state: [:not_started_yet, :in_progress,:done] 
	belongs_to :user, optional: true
	mount_uploader :image, ImageUploader


	def deadline_over?
		Date.today > deadline
	end

	

	
end
