class VisitorsController < ApplicationController
  def create
    visitor = Visitor.find_by_identifier(params[:identifier])
    if visitor.present?
      visitor.visit_count = visitor.visit_count + 1
      visitor.visit_time = Time.now
      visitor.save
    else
      visitor = Visitor.create(identifier: params[:identifier], visit_count: 1, visit_time: Time.now)
    end

    render js: ""
  end

  def index
    visitors = Visitor.all
    render json: { visitors: visitors }
  end

  def signup
    visitor = Visitor.find_by_identifier(params[:identifier])
    visitor.email = params[:email]
    visitor.visit_time = Time.now
    visitor.save
    redirect_url = "http://inderps.github.io/quotation-maker/thankyou.html"
    redirect_url = "http://localhost:8000/thankyou.html" if Rails.env == "development"
    redirect_to redirect_url
  end
end
