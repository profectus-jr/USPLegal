class GroupsController < ApplicationController
  before_filter :authenticate_user!  
  
  def index
    @groups = Group.all
  end
  
  def show
    @group = Group.find(params[:id])
    @inspections = Inspection.where('group_id = ' + params[:id]).order("created_at DESC")
  end
  
  def new
    @group = Group.new 
    @predios = Building.order("name").all.collect{|p| [p.name,p.id]}
    @predio = 0
  end
  
  def create
    group = Group.new
    group.update_attributes(group_params)
    group.save
    redirect_to new_equipment_path(:id_local => group.building_id)
  end
  
  def edit
    @group = Group.find_or_create_by_id(params[:id])
  end
  
  def update
    group = Group.find params[:id]
    group.update_attributes(group_params)
    group.save
    redirect_to groups_path
  end
  
  def group_params
    params.require(:group).permit(:name, :building_id, :vist_date)
  end
end
