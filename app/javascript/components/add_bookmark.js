
const addBookmark = () => {

const selectableItems = document.querySelectorAll(".selectable");

if (selectableItems.length > 0){

    selectableItems.forEach((item) => {

        item.addEventListener("click", (event) => {
            event.preventDefault();
            console.log("I have been clicked"); 
        })

    })
    
}

}


export { addBookmark };