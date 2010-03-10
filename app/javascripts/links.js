// (function($){
//   $.fn.autoExternalLinker = function() {
//     var context = $(this);
//     
//     // Creating custom :external selector
//     $.expr[':'].external = function(obj){
//         return !obj.href.match(/^mailto\:/)
//                 && (obj.hostname.replace(/:3000|:3001/,'') != location.hostname);
//     };
//     // Add 'external' CSS class to all external links
//     $('a:external').addClass('external');
//   }
// })(jQuery);

$(function() {
  // $('a.auto_external').autoExternalLinker();
  externals = $('a.external, .external a, .external_img a, a.external_img.new_window');
  externals.click(function(){
    window.open(this.href);
    return false;
  });
});
