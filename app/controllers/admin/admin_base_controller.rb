class Admin::AdminBaseController < BaseController
  before_action :authenticate_user!
end
