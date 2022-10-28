import { Controller } from "@hotwired/stimulus"
import $ from 'jquery';
// // import 'select2/dist/css/select2.min.css'
// require("select2/dist/css/select2")
// require("select2-bootstrap-theme/dist/select2-bootstrap")
import Select2 from "select2"

// Connects to data-controller="select2"
export default class extends Controller {
  connect() {
    Select2()
    $('.authors-book').select2();
    $('.authors-search').select2();
    $('.year-book').select2();
  }
}
