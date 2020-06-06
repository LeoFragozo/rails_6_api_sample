module Api
	module V1
		class BooksController < ApplicationController

			def index
				books = Book.order('created_at ASC');
				render json: {status: 'SUCCESS', message:'Livros carregados', data:books},
				status: :ok
			end

			def show #está dando erro
				book = Book.find(params[:id])
				render json: {status: 'SUCCESS', message:'Livros carregados', data:book},
				status: :ok
			end

			def create
				book = Book.new(book_params)
				if book.save
					render json: {status: 'SUCCESS', message:'Livros carregados ', data:book},status: :ok
				else
					render json: {status: 'ERROR', message:'Livros não salvos', data:book.errors},status: :unprocessable_entity
				end
			end

			def update
				book = Book.find(params[:id]) #está dando erro

				if book.update_attributes(book_params)
					render json: {status: 'SUCCESS', message:'Livro atualizado', data:book},
					status: :ok
				else
					render json: {status: 'ERROR', message:'Livro não atualizado', data:book.errors},status: :unprocessable_entity
				end
			end

			def destroy
				book = Book.find(params[:id])
				book.destroy
				render json: {status: 'SUCCESS', message:'Livro excluído', data:book},
				status: :ok
			end

			private
			def book_params
				params.permit(:name, :author, :publication_date)
			end

		end
	end
end