class Admin::TeamsController < AdminController
  
  before_action :find_team, only: [:edit, :update, :destroy]
  
  def index
    @admin_teams = Admin::Team.order(sort: :asc)
  end

  def new
    @admin_team = Admin::Team.new
    @admin_team.build_image
  end

  def create
    @admin_team = Admin::Team.new(team_params)
    if @admin_team.save
      redirect_to admin_teams_path, notice: '新增成功'
    else
      flash[:alert] = '新增失敗'
      @admin_team.build_image if @admin_team.image.nil?
      render :new
    end
  end

  def edit
    @admin_team.build_image if @admin_team.image.nil?
  end

  def update
    if @admin_team.update(team_params)
      redirect_to admin_teams_path, notice: '更新成功'
    else
      flash[:alert] = '更新失敗'
      render :edit
    end
  end

  def destroy
    @admin_team.destroy
    redirect_to admin_teams_path, notice: '刪除成功'
  end

  private

  def find_team
    @admin_team = Admin::Team.find_by(id: params[:id])
  end

  def team_params
    params.require(:admin_team).permit(:name, :description,
                                        :name_zh_tw, :description_zh_tw,
                                        :name_en, :description_en,
                                        :name_zh_cn, :description_zh_cn,
                                        image_attributes: [:id, :src, :alt])
  end

end
