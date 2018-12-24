class DiariesController < ApplicationController
  before_action :set_target_diary, only: %i[ show edit update destroy]
  require 'date'
  
  def index
    @diaries = params[:tag_id].present? ? Tag.find(params[:tag_id]).diaries : Diary.all
    @diaries = Diary.page(params[:page])
  end
  
  def new
    @diary = Diary.new(flash[:diary])
    @time = Time.now
  end
  
  def create
    diary = Diary.new(diary_params)
    if diary.save
      flash[:notice] = "「#{diary.title}」を作成しました"
      redirect_to diary_path
    else
      redirect_to :back, flash: {
        diary: diary,
        error_messages: diary.errors.full_messages
      }
    end
  end
  
  def show
    
  end
  
  def edit
  end
  
  def update
    if @diary.update(diary_params)
      flash[:notice] = "「#{@diary.title}」を編集しました"
      redirect_to @diary
          else
      redirect_to :back, flash: {
        diary: @diary,
        error_messages: @diary.errors.full_messages
      }
    end
  end
  
  def destroy
    @diary.destroy
    redirect_to diaries_path, flash: { notice: "「#{@diary.title}」が削除されました"}
  end

  private
  
    def diary_params
      params.require(:diary).permit(:title, :body)
    end
    
    def set_target_diary
      @diary = Diary.find(params[:id])
    end
end