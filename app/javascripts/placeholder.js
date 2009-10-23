(function($) {
  $.fn.placeHolder = function(text) {
    var submit_button = this.parents('form:first').find('input[type=submit],input[type=image]');
    if ($.trim(this.val()).length == 0 || this.val() == text) {
      this.addClass('placeholder').val(text);
    }
    this.blur(function() {
      if ($(this).val() === '') {
        $(this).addClass('placeholder').val(text);
      }
    });
    this.focus(function() {
      if ($(this).val() === text) {
        $(this).removeClass('placeholder').val('');
      }
    });
  }
})(jQuery);

// wire it all up
$(document).ready(function() {
  $('#user_email').placeHolder('Email Address...');
});