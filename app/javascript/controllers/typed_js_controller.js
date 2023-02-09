import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Comedy", "Drama", "Fantasy", "Science fiction", "Thriller" ],
      typeSpeed: 70,
      loop: true
    })
  }
}
