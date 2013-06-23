class VisitorsController < ApplicationController
  def create
    visitor = Visitor.find_by_identifier(identifier: params[:identifier])
    if visitor.present?
      visitor.visit_count = visitor.visit_count + 1
      visitor.save
    else
      visitor = Visitor.create(identifier: params[:identifier], visit_count: 0)
    end

    render json: { visitor: visitor }
  end

  def index
    visitors = Visitor.all
    render json: { visitors: visitors }
  end
end
