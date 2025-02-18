import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.element.addEventListener(
      "turbo:before-morph-element",
      this.beforeMorph.bind(this),
    );
  }

  disconnect() {
    this.element.removeEventListener(
      "turbo:before-morph-element",
      this.beforeMorph.bind(this),
    );
  }

  beforeMorph(event) {
    if (this.element.open) {
      event.preventDefault();
    }
  }

  showModal() {
    if (!this.element.open) {
      this.element.showModal();
    }
  }
}
