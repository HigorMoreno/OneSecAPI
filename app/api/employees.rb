class Employees < Grape::API
  format :json
  formatter :json, Grape::Formatter::ActiveModelSerializers

  resource :employees do

    desc "get employees from a specific company"
    get '/company/:id' do

      Company.find(params[:id]).Employees
    end

    desc "create a employee"
    post do
      employee = Employee.new({
        name: params.name,
        company_id: params.company_id
        })

      params.work_days.each do |param|
        smt = param.start_morning_time.split(':')
        emt = param.end_morning_time.split(':')
        sat = param.start_afternoon_time.split(':')
        eat = param.end_morning_time.split(':')
        employee.WorkDays << WorkDay.new({
          day: param.day,
          start_morning_time: Time.new(2000,01,01,smt[0],smt[1],00, "+00:00"),
          end_morning_time: Time.new(2000,01,01,emt[0],emt[1],00, "+00:00"),
          start_afternoon_time: Time.new(2000,01,01,sat[0],sat[1],00, "+00:00"),
          end_afternoon_time: Time.new(2000,01,01,eat[0],eat[1],00, "+00:00")
          })
      end
      employee.save!
      employee
    end

    desc "deletes a employee"
    params do
      requires :id, type: String
    end
    delete ':id' do
      Employee.find(params[:id]).destroy!
    end

    def default_serializer_options
      {root: false}
    end

  end

end
