import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

import jQuery from "jquery"
window.jQuery = jQuery // <- "select2" will check this
window.$ = jQuery

export { application }
