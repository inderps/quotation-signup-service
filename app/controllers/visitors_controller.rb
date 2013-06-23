class VisitorsController < ApplicationController
  def create
    visitor = Visitor.create(identifier: params[:identifier], visit_count: 0)
    render json: { visitor: visitor }
  end

  def index
    visitors = Visitor.all
    render json: { visitors: visitors }
  end
end
