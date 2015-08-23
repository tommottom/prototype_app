class Note < ActiveRecord::Base
	belongs_to :user
	mount_uploader :note_image, NoteimageUploader
end
