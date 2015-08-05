class ReportController < ApplicationController
  before_filter :authenticate_user!
  layout "printing", only: [:report, :report_print]

  def report
	@type = params[:t].to_f
	id = params[:id]
	@mode = 1
		
	if @type == 1
		@inspection = Inspection.find(id);
		@answers = Answer.where(inspection_id: id)
        	prepared_url = @inspection.photo_url.to_s
        	prepared_url.slice!(0)
		if prepared_url == ""
			@inspection_url = "error.img"
		else
        	@inspection_url = root_url + prepared_url
		end
	end
	if @type == 2
		@order = ReportConfig.readidonly
		@vistoria = Group.find(id) 
		@users = User.pluck(:name, :id)
	end
  end

  def report_print
	@type = params[:t].to_f
	id = params[:id]
	@mode = 2
	
	if @type == 1
		@inspection = Inspection.find(id);
		@answers = Answer.where(inspection_id: id)
        	prepared_url = @inspection.photo_url.to_s
        	prepared_url.slice!(0)
		if prepared_url == ""
			@inspection_url = "error.img"
		else
        		@inspection_url = root_url + prepared_url
		end
	end
	if @type == 2
		@order = ReportConfig.readidonly
		@vistoria = Group.find(params[:id])
		@data_inspec = params[:data]
		@autores = params[:authors]
		@revisores = params[:reviewers]
		@methodology = params[:methodology]
		@presentation = params[:presentation]
	end
  end

  def report_config
	@equiptypes = EquipType.all
	@previous_config = ReportConfig.read
  end

  def report_config_save
	#save and then return to config
	ReportConfig.update(params[:order])
	redirect_to '/report/config'
  end
end
