class Companies < Grape::API
  format :json

  resource :companies do

    desc "list companies"
    get do
      Company.all
    end

    desc "create a company"
    params do
      requires :name, type: String
      requires :description, type: String
    end
    post do
      Company.create!({
        name: params[:name],
        description: params[:description]
        })
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
    end
    put ':id' do
      Company.find(params[:id]).update({
        name:params[:name],
        description:params[:description]
        })
    end


  end
end
