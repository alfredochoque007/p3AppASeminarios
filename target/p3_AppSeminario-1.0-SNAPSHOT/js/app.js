


const submitButton = document.querySelector("[type='submit']"); // Replace with your submit button selector
const checkboxes = document.querySelectorAll(".seminar-checkbox");

submitButton.addEventListener("click", function (event) {
    let isChecked = false;
    for (const checkbox of checkboxes) {
        if (checkbox.checked) {
            isChecked = true;
            break;
        }
    }

    if (!isChecked) {
        event.preventDefault(); // Prevent form submission
        alert("Por favor, seleccione al menos un seminario.");
    }
});