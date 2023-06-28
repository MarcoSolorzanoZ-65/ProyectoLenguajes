import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require ../../../../../../../../.rvm/gems/ruby-3.2.0/gems/activestorage-7.0.4.3/app/assets/javascripts/activestorage.js
//= require turbolinks
//= require bootstrap
//= require_tree .
