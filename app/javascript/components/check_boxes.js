const checkButton = () => {
document.querySelectorAll(".check-choice").forEach((choice) => {
        choice.addEventListener("mousedown", (event) => {
        console.log(event.currentTarget.classList.toggle("active"));
        });
    });
};

export { checkButton }

