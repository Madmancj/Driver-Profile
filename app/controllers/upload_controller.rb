class UploadController < ApplicationController
	def get
		@driver = Driver.new
	end
	def save
		@driver = Driver.new(driver_params)
		if @driver.save
			redirect_to(action: 'show', id: @driver.id)
		else
			render(action: :get)
		end
	end
	def driver
		@driver = Driver.find(params[:id])
		send_data(@driver.data,
				filename: @driver.name,
				type: @driver.content_type,
				disposition: "inline")
	end
	def show
		@driver = Driver.find(params[:id])
	end
	private
		def driver_params
			params.require(:driver).permit(:comment, :address, :uploaded_driver, :number, :price)
		end
end
