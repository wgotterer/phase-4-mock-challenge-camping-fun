class CampersController < ApplicationController

    def index
        campers = Camper.all 
        render json: campers
    end

    def show
        camper = Camper.find_by!(id: params[:id])
        render json: camper, serializer: CamperActivitySerializer

    rescue ActiveRecord::RecordNotFound => error
        render json: {error: "Camper not found"}, status: :not_found
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: ["validation errors"] }, status: :unprocessable_entity
    end

    private

    def camper_params
        params.permit(:name, :age)
    end
end
