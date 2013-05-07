//= require jquery-1.8.3.min
//= require_tree .

jQuery(function($) {
  $('.locales').on('click', 'li', function() {
    var $li = $(this);
    $('iframe').attr('src', $li.find('a').attr('href'));
    $li.parent().find('.active').removeClass('active');
    $li.addClass('active');
  });
});
