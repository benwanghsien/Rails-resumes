import { Controller } from "stimulus"
import dropin from "braintree-web-drop-in"

export default class extends Controller {
  setNonce(nonce) {
    const el = document.createElement("input")
    el.setAttribute("type", "hidden")
    el.setAttribute("name", "nonce")
    el.setAttribute("value", nonce)

    this.element.appendChild(el)
  }

  connect() {
    const token = this.element.dataset.token
    dropin
      .create({
        authorization: token,
        container: this.element,
      })
      .then((cashier) => {
        const form = this.element.closest("form")
        form.addEventListener("submit", (e) => {
          e.preventDefault()

          cashier
            .requestPaymentMethod()
            .then(({ nonce }) => {
              this.setNonce(nonce)
              form.submit()
            })
            .catch((err) => {
              console.log(err)
            })
        })
      })
      .catch((err) => {
        console.log(err)
      })
  }
}
