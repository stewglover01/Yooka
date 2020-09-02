const radioButton = () => {
  const radioButton = document.querySelectorAll(".choice").forEach((choice) => {
    choice.addEventListener("click", (event) => {
        const active = document.querySelectorAll(".active")
        console.log(active);
        if (active.length > 0) {
            active.forEach((item) => { 
                item.classList.toggle("active")
            });
        };
        event.currentTarget.classList.toggle("active");
        console.log("working");
    });
  });
};


export {radioButton}

