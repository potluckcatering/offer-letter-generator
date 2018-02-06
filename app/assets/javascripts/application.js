// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery/dist/jquery
//= require popper.js/dist/umd/popper
//= require bootstrap/dist/js/bootstrap
//= require bootstrap-datepicker/dist/js/bootstrap-datepicker
//= require selectize/dist/js/standalone/selectize
//= require jquery-wizard/dist/jquery-wizard

$(document).on('turbolinks:load', function() {


	setTimeout(function() {
	    $('.alert.alert-warning, .alert.alert-info, .alert.alert-success, .alert.alert-danger, .alert.alert-notice, .alert.alert-alert').slideUp();
	}, 5000);

	$('select').selectize({});

	$('.wizard_form').wizard({
		templates: {
		  buttons: function() {
		    const options = this.options;
		    return `<div class="wizard-buttons"><a class="wizard-back btn btn-secondary" href="#${this.id}" data-wizard="back" role="button">${options.buttonLabels.back}</a><a class="wizard-next btn btn-primary" href="#${this.id}" data-wizard="next" role="button">${options.buttonLabels.next}</a><a class="wizard-finish" href="#${this.id}" data-wizard="finish" role="button">${options.buttonLabels.finish}</a></div>`;
		  }
		}
	});

});