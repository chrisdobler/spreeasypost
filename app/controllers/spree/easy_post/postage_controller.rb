class Spree::EasyPost::PostageController < ApplicationController

  require 'easypost'

	def create
		params.each do |key,value|
		  Rails.logger.warn "Param #{key}: #{value}"
		end
		respond_to do |format|
      format.json { render :json => params[:shipment_id] }
    end
	end

end
