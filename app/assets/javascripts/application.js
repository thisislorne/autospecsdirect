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

var trackOutboundLink = function(url) {
  gtag('event', 'conversion', {'send_to': 'AW-788320855/9EJwCK3VsYkBENek8_cC'});
  gtag('event', 'click', {
    'event_category': 'outbound',
    'event_label': url,
    'transport_type': 'beacon',
    'event_callback': function(){window.open = url;}
  });
}
