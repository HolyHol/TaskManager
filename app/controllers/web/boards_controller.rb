class Web::BoardsController < Web::ApplicationController
  before_action :authenticate_user!
end