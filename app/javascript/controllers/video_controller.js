import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ['count'];
    connect() {
        this.countTarget.addEventListener("ended", () => {
            console.log("hello")
            this.buttonTarget.click()
        })
    }
}