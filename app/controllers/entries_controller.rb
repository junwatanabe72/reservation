class EntriesController < ApplicationController
  before_action :set_entry, only: :destroy
  before_action :new_entry, only: [:confirm, :confirm_back, :create]

  def new
    @entry = current_user.entries.new(room_id: params[:room_id])
  end

  def confirm
      if @entry.invalid?
        render :new
      end
  end

  def confirm_back
      render :new
  end

  def create
      if @entry.save
        #NoticeMailer.agreed(@entry).deliver_now
        redirect_to @entry.room, notice: 'Entry was successfully created.'
      else
        render :new
      end
  end

  def destroy
    user = User.find_by(email: @entry.user_email)
    # 予約のユーザーがログインユーザーと異なる時拒否する
    if current_user == user
      @entry.destroy
        redirect_to @entry.room, notice: 'Entry was successfully destroyed.'
    else
      redirect_to root_path
    end
  end

  def index
    @entries = Entry.all
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = current_user.entries.find(params[:id])
    end

   def new_entry
        @entry = current_user.entries.new(entry_params)
   end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:reserved_date, :usage_time,:room_id, :people, :user_id)
    end


end
