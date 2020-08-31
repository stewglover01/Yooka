import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ['count'];
    connect() {
        this.countTarget.addEventListener("ended", () => {
            window.location.href = window.location.href + "/rewards";
        })
    }
}