import { fetchWithToken } from "../utils/fetch_with_token";


const addBookmark = () => {

    const selectableItems = document.querySelectorAll(".selectable");

    if (selectableItems.length > 0){

        selectableItems.forEach((item) => {

            item.addEventListener("click", (event) => {
                event.preventDefault();
                const recipe_id = event.currentTarget.dataset.id;

            

                fetchWithToken(`/recipes/${recipe_id}/cookbooks`, {
                    method: "POST",
                    headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                    }
                  //  body: JSON.stringify({ cookbook: {recipe_id: recipe_id }})
                })
           
                    .then(response => response.json())
                    .then((data) => {
                        const buttonId = document.getElementById(`button-${recipe_id}`);
                                if (data.recipe_id){
                                
                                    buttonId.innerHTML = '<li style="list-style-type: none"><i class="far fa-bookmark mr-2"></i><span  style="color:black">saved</span></li>';

                                }
                                else{

                        
                                    buttonId.innerHTML = '<li style="list-style-type: none"><i class="far fa-bookmark mr-2"></i><span  style="color:white">save</span></li>';



                                }
                                        
                            }  );
                            
                            
            });

        })
        
    }
}



export { addBookmark }