//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap
//= require_tree .

$(function() {

  $('#hamburger').click(function() {
    $(this).toggleClass('open');
  });

});


function convert(url, downloadType) {
  gtag_report_conversion(downloadType);
  window.location = url;
}

// Event snippet for Download Offer and Software
function gtag_report_conversion(downloadType) {
  var sendTo = downloadType == 'offer' ? 'AW-777281614/0hDhCMzw6pABEM7A0fIC' : 'AW-777281614/UXccCPz26pABEM7A0fIC';
  gtag('event', 'conversion', {
      'send_to': sendTo
  });
}
