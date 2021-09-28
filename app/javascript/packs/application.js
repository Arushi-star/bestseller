// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require.context("../images",true)
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import jquery from 'jquery';
window.$ = window.jquery = jquery
import { createPopper } from '@popperjs/core';


//scss
//import 'bootstrap';
import "../css/frontend/common.scss";
import "@fortawesome/fontawesome-free/js/all";

require("bootstrap/dist/js/bootstrap")
require("jquery-validation")
require("./js/common")
require("./js/product")
