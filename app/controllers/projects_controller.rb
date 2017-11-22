class ProjectsController < ApplicationController

	def new
		@project = Project.new
	end

	def create
		@project = current_user.projects.new(project_params)
		if @project.save
			redirect_to '/'
		else
			redirect_to 'new_project_path'
		end
	end

	def show
		@project_show = Project.find(params[:id])
	end

	def destroy
       @project = Project.find(params[:id])
       @project.destroy

       respond_to do |format|
          format.html { redirect_to root_path, notice: 'Project was successfully destroyed.' }
          format.json { render json: { id: params[:id] } }
       end
    end

    def search
        if params[:search]
            @project = Project.search(params[:search])
        end
    end

	private

	def project_params
		params.require(:project).permit(:project_title, :project_description, :location, :fund_goal, :start_date, :end_date)
	end

end
