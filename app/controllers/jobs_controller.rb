class JobsController < ApplicationController
  def index
  	@jobs= Job.all
  end

  def new
  	@job = Job.new
  	@boats = Boat.all
  end

  def create
  	@job = Job.new(job_params)
    @job.user_id = current_user.id
    if @job.save
      redirect_to "/jobs/"
    else
      render "/jobs/new"
    end
  end

  def edit
    @job = Job.find(params[:id])
    @boats = Boat.all
  end

  def update
    @job = Job.find(params[:id])
    @job.user_id = current_user.id
    if @job.update(job_params)
      redirect_to "/jobs/"
    else
      redirect_to "/jobs/#{job_id}/edit"
    end
  end

  def show
     @job = Job.find(params[:id])
     @boats = Boat.all
  end




  private
	def job_params
		params.require(:job).permit(:description,:cost,:containers_needed,:boat_id,:user_id)
	end
end
