import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["options", "clearfix"]

  toggle() {
    this.optionsTarget.classList.toggle("hidden")
  }
}
