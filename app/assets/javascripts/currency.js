$(document).ready(function() {
  $('#currencyConvert').on('ajax:success', function(event) {
    var response = event.detail[0];
    $('#endingAmount').val(response);
  }).on('ajax:error', function(event) {
    $('#endingAmount').val('');
    $('#startingAmount').val('');
    alert('there was an error. try again.');
  });
  $('input').on('change', function() {
    $('#endingAmount').val('');
  });
});