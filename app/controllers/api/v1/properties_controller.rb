# app/controllers/api/v1/properties_controller.rb

module Api
  module V1
    class PropertiesController < ApplicationController
      before_action :authenticate_user!, except: [:index, :show]

      def index
        properties = Property.all
        render json: properties
      end

      def show
        property = Property.find(params[:id])
        render json: property
      end

      def create
        property = Property.new(property_params)

        if property.save
          render json: property, status: :created
        else
          render json: { error: property.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        property = Property.find(params[:id])

        if property.update(property_params)
          render json: property
        else
          render json: { error: property.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        property = Property.find(params[:id])
        property.destroy
        head :no_content
      end

      def search
        properties = Property.where("title LIKE ?", "%#{params[:q]}%")
        render json: properties
      end

      private

      def set_property
        @property = Property.find(params[:id])
      end

      def property_params
        params.require(:property).permit(:title, :description, :address, :city, :state, :zip_code, :price, :bedrooms, :bathrooms, :size, :status, :listing_id)
      end
    end
  end
end




# class Api::V1::PropertiesController < ApplicationController
#   before_action :set_property, only: [:show, :update, :destroy]

#   def index
#     @properties = Property.all
#     render json: @properties
#   end

#   def show
#     render json: @property
#   end

#   def create
#     @property = Property.new(property_params)
#     if @property.save
#       render json: @property, status: :created
#     else
#       render json: @property.errors, status: :unprocessable_entity
#     end
#   end

#   def update
#     if @property.update(property_params)
#       render json: @property
#     else
#       render json: @property.errors, status: :unprocessable_entity
#     end
#   end

#   def destroy
#     @property.destroy
#     head :no_content
#   end

#   def search
#     # Perform the search based on the query parameters
#     properties = Property.where("name LIKE ?", "%#{params[:q]}%")

#     # Return the results as JSON
#     render json: properties
#   end

#   private

#   def set_property
#     @property = Property.find(params[:id])
#   end

#   def property_params
#     params.require(:property).permit(:name, :price, :description, :address, :city, :state, :zip)
#   end
# end


# ***************************

# # app/controllers/api/v1/properties_controller.rb

# module Api
#   module V1
#     class PropertiesController < ApplicationController
#       before_action :authenticate_user!, except: [:index, :show]

#       def index
#         properties = Property.all
#         render json: properties
#       end

#       def show
#         property = Property.find(params[:id])
#         render json: property
#       end

#       def create
#         property = Property.new(property_params)

#         if property.save
#           render json: property, status: :created
#         else
#           render json: { error: property.errors.full_messages }, status: :unprocessable_entity
#         end
#       end

#       def update
#         property = Property.find(params[:id])

#         if property.update(property_params)
#           render json: property
#         else
#           render json: { error: property.errors.full_messages }, status: :unprocessable_entity
#         end
#       end

#       def destroy
#         property = Property.find(params[:id])
#         property.destroy
#         head :no_content
#       end

#       def search
#         properties = Property.where("title LIKE ?", "%#{params[:q]}%")
#         render json: properties
#       end

#       private

#       def set_property
#         @property = Property.find(params[:id])
#       end

#       def property_params
#         params.require(:property).permit(:title, :description, :address, :city, :state, :zip_code, :price, :bedrooms, :bathrooms, :size, :status, :listing_id)
#       end
#     end
#   end
# end
