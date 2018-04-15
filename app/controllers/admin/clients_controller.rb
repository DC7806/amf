class Admin::ClientsController < AdminController

  before_action :find_client, only: [:edit, :update, :destroy]
  
  def index
    @admin_clients = Admin::Client.order(sort: :asc)
  end

  def new
    @admin_client = Admin::Client.new
    @admin_client.build_image
  end

  def create
    @admin_client = Admin::Client.new(client_params)
    if @admin_client.save
      redirect_to admin_clients_path, notice: '新增成功'
    else
      flash[:alert] = '新增失敗'
      @admin_client.build_image if @admin_client.image.nil?
      render :new
    end
  end

  def edit
    @admin_client.build_image if @admin_client.image.nil?
  end

  def update
    if @admin_client.update(client_params)
      redirect_to admin_clients_path, notice: '更新成功'
    else
      flash[:alert] = '更新失敗'
      render :edit
    end
  end

  def destroy
    @admin_client.destroy
    redirect_to admin_clients_path, notice: '刪除成功'
  end

  private

  def find_client
    @admin_client = Admin::Client.find_by(id: params[:id])
  end

  def client_params
    params.require(:admin_client).permit(:name, :description,
                                        :name_zh_tw, :description_zh_tw,
                                        :name_en, :description_en,
                                        :name_zh_cn, :description_zh_cn,
                                        image_attributes: [:id, :src, :alt])
  end

end
