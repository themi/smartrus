class Students::BaseController < ApplicationController
  before_action :authenticate_student!
end
