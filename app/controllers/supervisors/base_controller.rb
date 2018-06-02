class Supervisors::BaseController < ApplicationController
  before_action :authenticate_supervisor!
end
