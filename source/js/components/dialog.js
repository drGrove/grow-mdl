'use strict'

export class Dialog {
  /**
   * Creates a new dialog that can be accessed
   */
  constructor(elem) {
    this.dialog_ = elem;
  }

  showModal() {
    if (!this.dialog_.showModal) {
      dialogPolyfill.registerDialog(this.dialog_);
    }

    this.dialog_.showModal();
  }

  hideModal() {
    this.dialog_.close();
  }
};
