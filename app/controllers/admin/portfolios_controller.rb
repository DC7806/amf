class Admin::PortfoliosController < AdminController
  
  before_action :find_portfolio, only: [:edit, :update, :destroy]
  
  def index
    @admin_portfolios = Admin::Portfolio.order(sort: :asc).all
  end

  def new
    @admin_portfolio = Admin::Portfolio.new
    # @admin_portfolio.build_image
  end

  def create
    @admin_portfolio = Admin::Portfolio.new(portfolio_params)
    if @admin_portfolio.save
      redirect_to admin_portfolios_path, notice: '新增成功'
    else
      flash[:alert] = '新增失敗'
      # @admin_portfolio.build_image if @admin_portfolio.image.nil?
      render :new
    end
  end

  def edit
    @admin_portfolio.build_image if @admin_portfolio.image.nil?
  end

  def update
    if @admin_portfolio.update(portfolio_params)
      redirect_to admin_portfolios_path, notice: '更新成功'
    else
      flash[:alert] = '更新失敗'
      render :edit
    end
  end

  def destroy
    @admin_portfolio.destroy
    redirect_to admin_portfolios_path, notice: '刪除成功'
  end

  private

  def find_portfolio
    @admin_portfolio = Admin::Portfolio.find_by(id: params[:id])
  end

  def portfolio_params
    params.require(:admin_portfolio).permit(:title, :description, :video_src, :permalink,
                                            :title_zh_tw, :description_zh_tw, :title_en, :description_en,
                                            image_attributes: [:id, :src, :alt])
  end

end
