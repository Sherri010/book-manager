class BooksController < ApplicationController
 before_action :require_login, only: :show

end
