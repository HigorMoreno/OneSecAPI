class Companies < Grape::API
  format :json
  formatter :json, Grape::Formatter::ActiveModelSerializers

  resource :companies do

    desc "list companies"
    get do
      #format.json { render json:Company.first.to}
      Company.all
    end

    desc "create a company"
    params do
      requires :name, type: String
      requires :description, type: String
      requires :location, type: String
    end
    post do
      company = Company.new({
        name: params[:name],
        description: params[:description],
        location: params[:location]
        })

      
      # params[:workdays].each do |w|
      #   workday = WorkDay.new({
      #     day: w.day,
      #     start_morning_time: w.start_morning_time,
      #     end_morning_time: w.end_morning_time,
      #     start_afternoon_time: w.start_afternoon_time,
      #     end_afternoon_time: w.end_afternoon_time,
      #   }) 
      #   company << workday
      # end
      company.save!
    end

    desc "deletes a company"
    params do
      requires :id, type: String
    end
    delete ':id' do
      Company.find(params[:id]).destroy!
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
