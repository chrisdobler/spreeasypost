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

    it "should have a button to purchase postage" do
      expect(page).to have_link("Purchase Postage")    
    end
    
  end
end