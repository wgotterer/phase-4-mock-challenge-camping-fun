class ActivitiesController < ApplicationController

    def index
        activities = Activity.all
        render json: activities
    end

    def destroy
        activity = Activity.find_by!(id: params[:id])
        activity.destroy
        head :no_content
        rescue ActiveRecord::RecordNotFound => error
            render json: {error: "Activity not found"}, status: :not_found
    end
end
