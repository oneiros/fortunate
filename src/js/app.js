/* eslint no-console:0 */

// RailsUjs is *required* for links in Lucky that use DELETE, POST and PUT.
// Though it says "Rails" it actually works with any framework.
import RailsUjs from "rails-ujs";

// Turbolinks is optional. Learn more: https://github.com/turbolinks/turbolinks/
import Turbolinks from "turbolinks";

import "@fortawesome/fontawesome-free/js/all";

import "popper.js";
import "bootstrap";

RailsUjs.start();
Turbolinks.start();

import EasyMDE from "easymde";

import Prism from 'prismjs';

document.addEventListener("turbolinks:load", function() {
  window.FontAwesome.dom.i2svg();

  document.querySelectorAll("textarea#post_body").forEach(function(element) {
    new EasyMDE({element: element});
  });

  Prism.highlightAll();
});
