# frozen_string_literal: true

class ResumesController < BaseController
  before_action :find_resume, only: [:show]
  before_action :find_my_resume, only: %i[edit update destroy pin]
  before_action :authenticate_user, except: %i[index show]

  def index
    if user_signed_in? && current_user.role == 'user'
      redirect_to my_resumes_path
    else
      @resumes = Resume.published.where(pinned: true).includes(:user)
      @vendor = current_user
    end
  end

  def my
    authorize :resume, :create?
    @resumes = current_user.resumes
  end

  def show
  end

  def new
    authorize :resume
    @resume = Resume.new
  end

  def create
    authorize :resume
    @resume = current_user.resumes.new(resume_params)

    if @resume.save
      redirect_to resumes_path, notice: '新增成功'
    else
      render :new
    end
  end

  def edit
    authorize :resume
  end

  def update
    authorize :resume

    if @resume.update(resume_params)
      redirect_to edit_resume_path(@resume), notice: '更新成功'
    else
      render :edit
    end
  end

  def destroy
    authorize :resume
    @resume.destroy
    redirect_to resumes_path, notice: '已刪除'
  end

  def pin
    authorize :resume, :create?

    current_user.resumes.update_all('pinned = false')
    @resume.update(pinned: true)

    redirect_to my_resumes_path
  end

  def like
    resume = Resume.published.friendly.find(params[:id])
    @vendor = current_user
    if !@vendor.like?(resume)
      @vendor.favorite_resumes << resume
      redirect_to root_path, notice: "點讚！"
    end
  end

  def unlike
    resume = Resume.published.friendly.find(params[:id])
    @vendor = current_user
    if @vendor.like?(resume)
      @vendor.favorite_resumes.destroy(resume)
      redirect_to root_path, notice: "取消讚！"
    end
  end

  def buy
    resume = Resume.published.friendly.find(params[:id])
    # @order = Order.new(price: 10, resume: resume)
    order = current_user.orders.create(price: 10, resume: resume)
    redirect_to checkout_order_path(order)
  end

  def view
    @resume = Resume.friendly.find(params[:id])
    @comment = Comment.new()
  end

  private

  def resume_params
    params.require(:resume).permit(:title, :content, :status, :mugshot, attachments: [])
  end

  def find_resume
    @resume = if user_signed_in?
                current_user.resumes.friendly.find(params[:id])
              else
                Resume.published.friendly.find(params[:id])
              end
  end

  def find_my_resume
    @resume = current_user.resumes.friendly.find(params[:id])
  end
end
