class WorkDays < Grape::API
  format :json
  formatter :json, Grape::Formatter::ActiveModelSerializers

  resource :workdays do

    desc "get schedule from a specific day"
    get '/:id' do
      WorkDay.find(params[:id])
    end

    desc "get schedule from a specific day"
    get 'employee/:id' do
      WorkDay.where(:employee_id => params[:id])
    end

    def default_serializer_options
      {root: false}
    end

  end

end
