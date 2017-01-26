// Shipments AJAX API
$(document).ready(function () {
  'use strict';

    // handle ship click
  $('[data-hook=admin_shipment_form] a.purchase-postage').on('click', function () {
    var link = $(this);
    var shipment_number = link.data('shipment-number');
    var url = Spree.url('/easy_post/shipment/'+shipment_number+'/postage.json');
    $.ajax({
      type: 'POST',
      url: url,
      data: {
        token: Spree.api_key
      }
    }).done(function (data) {
      console.log(data.url);
      window.location.assign(data.url);
    }).error(function (msg) {
      console.log(msg);
    });
  });
});