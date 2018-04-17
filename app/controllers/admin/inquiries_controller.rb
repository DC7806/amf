class Admin::InquiriesController < AdminController

  before_action :find_inquiry, only: [:show, :destroy]
  
  def index
    @admin_inquiries = Admin::Inquiry.order(created_at: :desc)
  end

  def show
  end

  def destroy
    @admin_inquiry.destroy
    redirect_to admin_inquiries_path, notice: '刪除成功'
  end

  private

  def find_inquiry
    @admin_inquiry = Admin::Inquiry.find_by(id: params[:id])
  end

  def inquiry_params
    params.require(:admin_inquiry).permit()
  end

end