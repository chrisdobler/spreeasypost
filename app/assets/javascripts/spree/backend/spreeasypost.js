// Shipments AJAX API
$(document).ready(function () {
  'use strict';

    // handle ship click
  $('[data-hook=admin_shipment_form] a.purchase-postage').on('click', function () {
    var link = $(this);
    var shipment_number = link.data('shipment-number');
    var url = Spree.url('/easy_post/shipment/'+shipment_number+'/postage');
    $.ajax({
      type: 'POST',
      url: url,
      data: {
        token: Spree.api_key
      }
    }).success(function () {
      window.location.reload();
    }).error(function (msg) {
      console.log(msg);
      alert("hfuc")
    });
  });
});