module Api
	module V1
    class BooksController < ApplicationController
			def index
				books = Book.order('created_at ASC');
				render json: {status: 'SUCCESS', message:'Livros carregados', data:books},status: :ok
			end
		end
	end
end