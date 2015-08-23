json.array!(@notes) do |note|
  json.extract! note, :id, :title, :introduction, :note_image
  json.url note_url(note, format: :json)
end
