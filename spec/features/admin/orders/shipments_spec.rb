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
        click_on "Purchase Postage"
        wait_until{ expect(page).to_not have_content("Purchase Postage") }
        expect(page.current_url).to have_content('easypost') 
      end
    end

  end
end