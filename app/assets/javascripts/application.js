// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require growlyflash
//= require summernote
//= require refile
//= require turbolinks
//= require_tree .

Growlyflash.defaults = {
  align: 'right',
  delay: 3500,
  dismiss: true,
  spacing: 10,
  target: 'body',
  title: false,
  type: null,
  "class": ['alert', 'growlyflash', 'fade'],
  before_show: function(options) {
    return this.el.css(this.calc_css_position());
  }
};

$(document).on("upload:start", "form", function(e) {
  $(this).find("input[type=submit]").attr("disabled", true)
});

$(document).on("upload:complete", "form", function(e) {
  if(!$(this).find("input.uploading").length) {
    $(this).find("input[type=submit]").removeAttr("disabled")
  }
});
