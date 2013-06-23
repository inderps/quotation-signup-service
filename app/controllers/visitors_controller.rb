class VisitorsController < ApplicationController
  def create
    visitor = Visitor.find_by_identifier(params[:identifier])
    if visitor.present?
      visitor.visit_count = visitor.visit_count + 1
      visitor.save
    else
      visitor = Visitor.create(identifier: params[:identifier], visit_count: 1)
    end

    render json: { visitor: visitor }
  end

  def index
    visitors = Visitor.all
    render json: { visitors: visitors }
  end

  def signup
    visitor = Visitor.find_by_identifier(identifier: params[:identifier])
    visitor.email = params[:email]
    visitor.visit_time = Time.now
    visitor.save

  end
end
