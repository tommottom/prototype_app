class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.page(params[:page]).per(9)
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
    @note.note_image.cache! unless @note.note_image.blank?
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    @user = current_user
    @note.user_id = @user.id

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    @user = current_user
    @note = Note.find(params[:id])

    if @note.user_id == @user.id
      check = 'PARAM_OK'
    else
      check = 'PARAM_NG'
    end
 
    case check
      when 'PARAM_OK'
        respond_to do |format|
          if @note.update(note_params)
            format.html { redirect_to @note, notice: 'Note was successfully updated.' }
            format.json { render :show, status: :ok, location: @note }
          else
            format.html { render :edit }
            format.json { render json: @note.errors, status: :unprocessable_entity }
          end
        end
      when 'PARAM_NG'
        respond_to do |format|        
            format.html { redirect_to notes_url , notice: 'You can not edit this item' }
            format.json { head :no_content }
        end
      else
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = Note.find(params[:id])
    @user = current_user    
    check = 'PARAM_OK'
     
    if @note.user_id == @user.id
      check = 'PARAM_OK'
    else
      check = 'PARAM_NG'
    end
     
    case check
      when 'PARAM_OK'
        @note.destroy
        respond_to do |format|
            format.html { redirect_to notes_url }
            format.json { head :no_content }
        end
      when 'PARAM_NG'
        respond_to do |format|
            format.html { redirect_to notes_url , notice: 'You can not delete this item' }
            format.json { head :no_content }
        end
      else
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :introduction, :note_image)
    end
end
