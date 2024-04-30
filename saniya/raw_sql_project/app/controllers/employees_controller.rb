class EmployeesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    search_params = params[:search]
    query = case search_params
            when "name"
              "SELECT name FROM employees"
            when "email"
              "SELECT email FROM employees"
            when "age"
              "SELECT age FROM employees"
            when "salary"
              "SELECT salary FROM employees"
            when "department"
              "SELECT department FROM employees"
            else
              "SELECT * FROM employees"
            end

    @all_employees = ActiveRecord::Base.connection.exec_query(query)
    @count = ActiveRecord::Base.connection.exec_query("SELECT COUNT(*) FROM employees")

    render json: { count: @count, all_employees: @all_employees }
  end

  def create
    @name = params[:employee][:name]
    @email = params[:employee][:email]
    @age = params[:employee][:age]
    @salary = params[:employee][:salary]
    @department = params[:employee][:department]
    @created_at = params[:employee][:created_at]
    @updated_at = params[:employee][:updated_at]

    sql = "INSERT INTO employees (name, email, age, salary, department, created_at, updated_at) 
           VALUES ('#{@name}', '#{@email}', #{@age}, #{@salary}, '#{@department}', '#{@created_at}', '#{@updated_at}')"
    ActiveRecord::Base.connection.exec_query(sql)

    render json: { message: 'Employee created successfully.' }
  end


  def destroy
    id = params[:id]
    sql = "DELETE FROM employees WHERE id = #{id}"
    ActiveRecord::Base.connection.exec_query(sql)
    render json: { message: 'Employee deleted successfully.' }
  end

  def filter
    where_params = params[:where]
    sql = "SELECT * FROM employees WHERE name LIKE '%#{where_params}%' OR email LIKE '%#{where_params}%' OR department LIKE '%#{where_params}%'"
    @records = ActiveRecord::Base.connection.exec_query(sql)
    render json: { records: @records }
  end


end
