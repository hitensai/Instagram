class PicsController < ApplicationController
	before_action :find_pic, only: [:show, :edit, :update, :destroy]
	def index
		@pics = Pic.all.order("created_at")
	end

	def show

	end	
	
	def new
		@pic = Pic.new
	end

	def create
		@pic = Pic.new(pic_params)
		if @pic.save
			redirect_to @pic, notice: "Pic was posted successfully"
		else
		 render 'new'
		end 	
	end	


	def edit

	end	

	def update

    if @pic.update(pic_params)
    	flash[:notice] = "Event updated"
    	redirect_to @pic
    else 
    	flash.now[:alert] = "Event not updated"
    	render "edit"
    end	
	end	

	def destroy	
	@pic.destroy
	flash[:notice] = "Event deleted"
	redirect_to pics_path

	end	


    private

    def pic_params
    params.require(:pic).permit(:title, :description)
    end	

    def find_pic
       		@pic = Pic.find(params[:id]) 

    end	


end
