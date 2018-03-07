class RecordsController < ApplicationController
	def new
		@record = Record.new
	end

	def create
		@record = Record.new(params_for_record)
		if @record.save
			redirect_to @record
		else
			render 'new'
		end
	end

	def edit
		@record = Record.find(params[:id])
	end

	def update
		@record = Record.find(params[:id])
		if @record.update(params_for_record)
			redirect_to @record
		else
			render 'edit'
		end
	end
	def destroy
		@record = Record.find(params[:id])
		@record.destroy
		redirect_to root_path
	end

	def show
		if current_user != nil
			@record = Record.find(params[:id])
			if @record.user_id == current_user.id || current_user.name == "admin" || current_user.role == "manager" || current_user.role == "finance"
				@user = User.find(@record.user_id).name
				if @record.manager_id != nil
					@manager = User.find(@record.manager_id).name
				end
			else
				redirect_to root_path
			end
		else
			redirect_to root_path
		end	
	end
	def index
		if current_user != nil
			if current_user.name == "admin"
				@records = Record.all
			else		
				if current_user.role == "reg_user"
					@records = Record.where(user_id: current_user.id)
				elsif current_user.role == "manager"
					@records = Record.where(manager_id: current_user.id)
				elsif current_user.role == "finance"
					@records = Record.where(to_finance: 1) + Record.where(to_finance: 2)
				end
			end
		else
			redirect_to root_path
		end
	end
private
	
	def params_for_record
		params.require(:record).permit(:purpose,:description,:start_date,:end_date,:mode,:cost,:home_city_price,:destination_city_price,:hotel_price,:local_transport,:user_id,:manager_id,:status,:to_finance)
	end
	def filtering_params(params)
  		params.slice()
	end
end
