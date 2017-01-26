# coding: utf-8
require 'spec_helper'

describe "Shipments", type: :feature, js: true do
  stub_authorization!

  let!(:order) { create(:order_ready_to_ship, number: "R100", state: "complete", line_items_count: 5) }

  context "shipping an order", js: true do
    before(:each) do
      visit spree.admin_orders_path
      within_row(1) do
        click_link "R100"
      end
    end

    describe "purchase postage button" do
      
      it "should exist" do
        expect(page).to have_link("Purchase Postage")    
      end

      it "on click should call method using ajax" do
        WebMock.enable!
        binding.pry
        stub_request(:post, '/easy_post/shipment/'+order.id+'/postage').
        with(body: "abc", headers: { 'Content-Length' => 3 })
        # should have_link('Purchase Postage', href: spree.new_easy_post_shipment_postage_path(order.shipments[0].id))
        click_on "Purchase Postage"
        wait_for_ajax
        expect(page).to have_content("abc") 

        WebMock.disable!
      end
    end

    # it "can ship a completed order" do
    #   click_on "Ship"
    #   wait_for_ajax

    #   expect(page).to have_content("shipped package")
    #   expect(order.reload.shipment_state).to eq("shipped")
    # end

  end
end