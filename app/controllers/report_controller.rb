class ReportController < ApplicationController
  before_filter :authenticate_user!
  layout "printing", only: [:report]

  def report
	@type = params[:t].to_f
	id = params[:id]
	if @type == 1
		@inspection = Inspection.find(id);
		@answers = Answer.where(inspection_id: id)
        	prepared_url = @inspection.photo_url.to_s
        	prepared_url.slice!(0)
		if prepared_url == ""
			@inspection_url = nil
		else
        		@inspection_url = root_url + prepared_url
		end
	end
  end

  def report_config
	@equiptypes = EquipType.all
  end

  def report_config_save
	#save and then return to config	

	redirect_to '/report/config'
  end
end
