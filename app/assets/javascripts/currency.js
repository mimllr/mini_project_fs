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
  $('input[name=startingCurrency], input[name=endingCurrency]').on('change', function() {
    if ($('input[name=startingCurrency]:checked').val() === $('input[name=endingCurrency]:checked').val()) {
      $('#convertButton').attr('disabled', 'disabled');
      $('#warning').show();
    } else {
      $('#convertButton').removeAttr('disabled');
      $('#warning').hide();
    }
  })
});