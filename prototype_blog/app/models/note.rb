class Note < ActiveRecord::Base
	belongs_to :user
	mount_uploader :image, NoteimageUploader
end
