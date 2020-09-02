const radioButtonNumbers = () => {
    const radioButton = document.querySelectorAll(".choice-number").forEach((choice) => {
        choice.addEventListener("click", (event) => {
            const active = document.querySelectorAll(".active-number")
            console.log(active);
            if (active.length > 0) {
                active.forEach((item) => {
                    item.classList.toggle("active-number")
                });
            };
            event.currentTarget.classList.toggle("active-number");
            console.log("working");
        });
    });
};

export { radioButtonNumbers }