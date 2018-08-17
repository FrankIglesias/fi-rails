module Api
  module V1
    class RentsController < ApplicationController
      include Wor::Paginate

      def index
        render_paginated Rent
      end

      def create
        @rent = Rent.new(rent_params)
        if @rent.save
          @user = User.find(rent_params[:user_id])
          @book = Book.find(rent_params[:book_id])
          response = @rent.attributes.merge(:user => @user, :book => @book)
          render json: response, status: :ok
        end
      end

      private

      def rent_params
        params.require(:rent).permit(:book_id, :user_id, :from, :to)
      end
    end
  end
end
