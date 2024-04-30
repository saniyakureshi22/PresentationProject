module Api
  module V1
    class RawSqlController < ApplicationController
      def select_all
        sql = "SELECT * FROM employees"
        results = ActiveRecord::Base.connection.execute(sql)
        render json: results
      end

      def select_where
        id = params[:id]
        sql = "SELECT * FROM employees WHERE id = #{id}"
        result = ActiveRecord::Base.connection.execute(sql)
        render json: result
      end

      def insert
        employee = Employee.new(
          employee_id: params[:employee_id],
          name: params[:name],
          profile: params[:profile],
          salary: params[:salary]
        )
        if employee.save
          render json: { message: "Record inserted successfully" }
        else
          render json: { error: "Failed to insert record", errors: employee.errors.full_messages }, status: :unprocessable_entity
        end
      end


      def update
        sql = "UPDATE employees SET salary = #{params[:new_salary]} WHERE employee_id = #{params[:id]}"
        ActiveRecord::Base.connection.execute(sql)
        render json: { message: "Record updated successfully" }
      end

      def delete
        sql = "DELETE FROM employees WHERE employee_id = #{params[:id]}"
        ActiveRecord::Base.connection.execute(sql)
        render json: { message: "Record deleted successfully" }
      end
    end
  end
end
