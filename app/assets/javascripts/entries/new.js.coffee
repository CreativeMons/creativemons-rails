$ ->
  init = ->
    $('.datepicker').datetimepicker({format: 'yyyy-mm-dd hh:ii:ss'});

  toggleFields = ->
    if $('select#entry_kind').val() == 'event'
      $('#events-only').show();
    else
      $('#events-only').hide();

  init()
  toggleFields()

  $('select#entry_kind').change(toggleFields)
