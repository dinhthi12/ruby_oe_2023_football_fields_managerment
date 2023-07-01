import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "../stylesheets/application";

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("jquery");
import "bootstrap";
global.toastr = require("toastr");
toastr.options = {
  positionClass: "toast-top-right",
  showDuration: 300,
  hideDuration: 1000,
  timeOut: 5000,
  extendedTimeOut: 1000,
  closeButton: true,
  progressBar: true,
  preventDuplicates: true,
};
