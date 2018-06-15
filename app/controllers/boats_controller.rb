class BoatsController < ApplicationController
  def index
  	@boats = Boat.all.order("created_at DESC")
  end

  def new
  	@boat = Boat.new
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def create
  	@boat = Boat.new(boat_params)
    @boat.user_id = current_user.id
    if @boat.save
      redirect_to "/users/#{current_user.id}"
    else
      render "/boats/new"
    end
  end

  def show
    @boat = Boat.find(params[:id])
    @jobs = Job.all
  end


  	private

  	def boat_params
  	params.require(:boat).permit(:name, :location, :containers, :user_id, :job_id, :image)
  	end

end
