class Spree::EasyPost::PostageController < ApplicationController

  require 'easypost'

	def create
		params.each do |key,value|
		  Rails.logger.warn "Param #{key}: #{value}"
		end

		EasyPost.api_key = ENV['EASYPOST_API_KEY']

		order = Spree::Order.find_by_number(params["order_id"])

		package = Spree::Stock::Package.new(order.shipments[0].stock_location, order.contents)

    logger.debug '---refreshing rates---'
    # logger.debug "package: #{package.inspect}"

		to_address = process_address(order.ship_address)
    logger.debug "to_address: #{to_address.inspect}"

	  from_address = process_address(package.stock_location)
    logger.debug "from_address: #{from_address.inspect}"

    parcel = build_parcel(order)
    logger.debug "parcel: #{parcel.inspect}"

		shipment = build_shipment(from_address, to_address, parcel)
    logger.debug "shipment: #{shipment.inspect}"

    rates = shipment.rates.sort_by { |r| r.rate.to_i }
    logger.debug "rates: #{rates.inspect}"    
    logger.debug '---end---'

    if !rates.any?
      logger.info "No rates found."
      # logger.info "package: #{package.inspect}"
      logger.info "from_address: #{from_address.inspect}"
      logger.info "to_address: #{to_address.inspect}"
      []
    end

		shipment.buy(
		  :rate => shipment.lowest_rate
		)

		# shipment.insure(amount: 100)
		# puts shipment.insurance

		response = {url: shipment.postage_label.label_url, id: params[:shipment_id] }
		respond_to do |format|
      format.json { render :json => response }
    end
	end

  private

  def process_address(address)
    ep_address_attrs = {}
    # Stock locations do not have "company" attributes,
    ep_address_attrs[:company] = if address.respond_to?(:company)
      address.company
    else
      Spree::Store.current.name
    end
    ep_address_attrs[:name] = address.full_name if address.respond_to?(:full_name)
    ep_address_attrs[:street1] = address.address1
    ep_address_attrs[:street2] = address.address2
    ep_address_attrs[:city] = address.city
    ep_address_attrs[:state] = address.state ? address.state.abbr : address.state_name
    ep_address_attrs[:zip] = address.zipcode
    ep_address_attrs[:phone] = address.phone

    ::EasyPost::Address.create(ep_address_attrs)
  end

  def build_parcel(order)
  	total_weight = 0
    order.line_items.each do |line_item|
      total_weight = total_weight + line_item.quantity * line_item.variant.weight
    end
    parcel = ::EasyPost::Parcel.create(
      :weight => total_weight.to_f
    )
  end

  def build_shipment(from_address, to_address, parcel)
    shipment = ::EasyPost::Shipment.create(
      :to_address => to_address,
      :from_address => from_address,
      :parcel => parcel
    )
  end

  def logger
    @logger ||= Logger.new("#{Rails.root}/log/spree_easypost.log")
  end  

end
