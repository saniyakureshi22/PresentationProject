class CustomersController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		sql = "SELECT * FROM customers"
		@customers = ActiveRecord::Base.connection.execute(sql)
		render json: @customers
	end

	def create
		# current_time = Time.now.strftime('%Y-%m-%d %H:%M:%S')
		sql = "INSERT INTO customers (username, date_of_birth, created_at, gender, occupation, company, interests, age, subscription_plan, updated_at) VALUES ('#{params[:customer][:username]}', '#{params[:customer][:date_of_birth]}', CURRENT_TIMESTAMP, '#{params[:customer][:gender]}', '#{params[:customer][:occupation]}', '#{params[:customer][:company]}', '#{params[:customer][:interests]}', #{params[:customer][:age]}, '#{params[:customer][:subscription_plan]}', CURRENT_TIMESTAMP)"

		if ActiveRecord::Base.connection.execute(sql)
			debugger
			render json: { message: 'Customer created successfully' }, status: :created
		else
			render json: { error: 'Failed to create customer' }, status: :unprocessable_entity
		end
	end

	def update
		sql = "UPDATE customers SET username = '#{params[:customer][:username]}', date_of_birth = '#{params[:customer][:date_of_birth]}', gender = '#{params[:customer][:gender]}', occupation = '#{params[:customer][:occupation]}', company = '#{params[:customer][:company]}', interests = '#{params[:customer][:interests]}', age = #{params[:customer][:age]}, subscription_plan = '#{params[:customer][:subscription_plan]}' WHERE id = #{params[:id]}"
		
		if ActiveRecord::Base.connection.execute(sql)
			render json: { message: 'Customer updated successfully' }
		else
			render json: { error: 'Failed to update customer' }, status: :unprocessable_entity
		end
	end

	def destroy
		sql = "DELETE FROM customers WHERE id = #{params[:id]}"
		ActiveRecord::Base.connection.execute(sql)
		render json: { message: 'Customer deleted successfully' }
	end
end
