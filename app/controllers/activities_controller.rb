class ActivitiesController < ApplicationController

    def index
        render json: Activity.all 
    end

    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
        head :no_content
    end

    private 

    def respond_when_not_found
        render json: {error: "Activity not found"}, status: :not_found
    end

end
