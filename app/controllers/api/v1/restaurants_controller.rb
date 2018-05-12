class Api::V1::RestaurantsController < Api::V1::BaseController
    def index
      @restaurants = Restaurant.all
    end

    def show
        @restaurant = Restaurant.find(params[:id])
    end

    def update
        @restaurant = Restaurant.find(params[:id])
        if @restaurant.update(restaurant_params)
            render :show
        else
            rendor_error
        end
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        if @restaurant.save
        render :show, status: :created
        else
        render_error
        end
    end

    def destroy
        @restaurant = Restaurant.find(params[:id])
        @restaurant.destroy
        head :no_content
    end

    private

    def restaurant_params
        params.require(:restaurant).permit(:name, :address, :description, :image)
    end

    def render_error
        render json: { errors: @restaurant.errors.full_messages },
          status: :unprocessable_entity
    end

end
