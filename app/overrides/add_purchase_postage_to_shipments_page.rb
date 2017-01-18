Deface::Override.new(virtual_path: 'spree/admin/orders/_shipment',
  name: 'add_purchase_postage_to_shipments_page',
  insert_after: "strong.stock-location-name",
  text: "
    <% if shipment.ready? %>
      <%= link_to 'Purchase Postage', 'javascript:;', class: 'purchase-postage pull-right btn btn-success', data: { 'shipment-number' => shipment.number } %>
    <% end %>
  ")