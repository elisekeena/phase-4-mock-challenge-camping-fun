class CampersController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :respond_when_not_found_2
    # rescue_from ActiveRecord::RecordInvalid, with: :respond_when_record_invalid_2

    def index
        # render json: Camper.all
        # campers = Camper.all 
        render json: Camper.all #.to_json(only: [:id, :name, :age])
        # render json: campers.to_json(only: [:id, :name, :age])
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperWithActivitySerializer
    
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created

    end



    private 

    def camper_params
        params.permit(:name, :age)
    end


    def respond_when_not_found
        render json: {error: 'Camper not found'}, status: :not_found
    end

    # def respond_when_record_invalid
    #     render json: {error: 'Name can\'t be blank', "Age is not included in the list"}, status: :unprocessable_entity
    # end

end
