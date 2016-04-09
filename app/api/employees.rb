class Employees < Grape::API
  format :json
  formatter :json, Grape::Formatter::ActiveModelSerializers

  resource :employees do

    desc "get employees from a specific company"
    get '/company/:id' do
      
      Company.find(params[:id]).Employees
    end

    desc "create a employee"
    params do
      requires :name, type: String
      requires :company_id, type: Integer
    end
    post do
      employee = Employee.new({
        name: params[:name],
        company_id: params[:company_id]
        })
      employee.save!
    end

    desc "deletes a employee"
    params do
      requires :id, type: String
    end
    delete ':id' do
      Employee.find(params[:id]).destroy!
    end

    desc "update a company"
    params do
      requires :id, type: String
      requires :name, type:String
      requires :description, type:String
      requires :location, type: String
    end
    put ':id' do
      Company.find(params[:id]).update({
        name:params[:name],
        description:params[:description],
        location: params[:location]
        })
    end

    def default_serializer_options
      {root: false}
    end

  end

end
