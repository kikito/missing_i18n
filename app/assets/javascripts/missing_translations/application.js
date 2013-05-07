//= require jquery-1.8.3.min
//= require_tree .

jQuery(function($) {
  $('.missing-translations').on('click', 'tr', function() {
    var $this = $(this);
    $('iframe').attr('src', $this.find('a').attr('href'));
    $this.parent().find('.active').removeClass('active');
    $this.addClass('active');
  });

  $('.refresh').click(function(e) {
    e.preventDefault();

    var table = $('.missing-translations');
    table.find('tbody').empty().append('<tr><td colspan="2">Loading...</td></tr>');
    table.load(table.data('locale-path') + ' .missing-translation', function() {
      $('iframe').attr('src', $('.missing-translation tbody a:first-child()').attr('href'));
    });
  });
});
