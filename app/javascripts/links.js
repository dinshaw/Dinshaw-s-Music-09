$(function($){//on document ready
  // External links
  // Creating custom :external selector
  $.expr[':'].external = function(obj){
    return !obj.href.match(/^mailto\:/) && (obj.hostname != location.hostname);
  };
  
  $.expr[':'].external_img = function(obj){
    return !obj.href.match(/^mailto\:/) && !$(obj).attr('src') != 'Undefinded' && (obj.hostname != location.hostname);
  };

  // Add 'external' CSS class to all external links
  $('a:external').addClass('external');
  $('a:external_img').addClass('external_img');
  $('a:external, a:external_img').click(function(){
    window.open(this.href);
    return false;
  });
});

