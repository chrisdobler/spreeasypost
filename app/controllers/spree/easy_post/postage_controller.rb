class Spree::EasyPost::PostageController < ApplicationController

  require 'easypost'

	def create
		params.each do |key,value|
		  Rails.logger.warn "Param #{key}: #{value}"
		end
		response = {url: "https://easypost-files.s3-us-west-2.amazonaws.com/files/postage_label/20170126/2baff2c5684648ab8b8b472bcde66802.png", id: params[:shipment_id] }
		respond_to do |format|
      format.json { render :json => response }
    end
	end

end
