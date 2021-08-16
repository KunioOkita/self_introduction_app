class TopController < ApplicationController
  skip_before_action :authenticate
end
