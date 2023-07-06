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
require("@nathanvda/cocoon")
import "bootstrap";
global.toastr = require("toastr");
import $ from 'jquery';
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

// $(document).on("turbolinks:load", function () {
//   var time_arr = [];
//   for (var i = 0; i < 24; i++) {
//     time_arr.push(i + ":00");
//     time_arr.push(i + ":15");
//     time_arr.push(i + ":30");
//     time_arr.push(i + ":45");
//   }

//   var date = new Date();

//   var start_time = date.getHours();
//   var finish_time = start_time + 1;

//   $("#showdate").datetimepicker({
//     allowTimes: time_arr,
//     defaultDate: date,
//     defaultTime: start_time,
//     format: "d.m.Y H:i",
//   });
// });
