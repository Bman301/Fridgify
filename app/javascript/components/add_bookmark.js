import { fetchWithToken } from "../utils/fetch_with_token";

function fade(element) {
    var op = 1;  // initial opacity
    var timer = setInterval(function () {
        if (op <= 0.1){
            clearInterval(timer);
            element.style.display = 'none';
        }
        element.style.opacity = op;
        element.style.filter = 'alpha(opacity=' + op * 100 + ")";
        op -= op * 0.2;
    }, 50);
}








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
                        


            if (document.querySelector("body").dataset.controller === "recipes" && document.querySelector("body").dataset.action === "show" ){
      

                if (data.recipe_id){
                                
                    buttonId.innerHTML = ' <li class="tag__item m-4" style="color:black;font-size: 35px;list-style-type:none; color: white;"><i class="fas fa-bookmark mr-2" style="color: white;" ></i>';

                }
                else{

                    buttonId.innerHTML = '<li class="tag__item m-4" style="color:black;font-size: 35px;list-style-type:none; color: white;"><i class="far fa-bookmark mr-2" style="color: white;" ></i>';

                }
                            
            }
            else{




                                if (data.recipe_id){
                                
                                    buttonId.innerHTML = '<li style="list-style-type: none"><i class="far fa-bookmark mr-2"></i><span  style="color:black">saved</span></li>';

                                }
                                else{
                                    if (document.querySelector("body").dataset.controller === "cookbooks" && document.querySelector("body").dataset.action === "index" ){

                          
                                     fade(item.parentElement.parentElement.parentElement.parentElement);

                                    }
                             
                                    else{
                                        buttonId.innerHTML = '<li style="list-style-type: none"><i class="far fa-bookmark mr-2"></i><span  style="color:white">save</span></li>';

                                    }
                        
                       
                                }


                            }
                                        
                            }  );
                            
            });

        })
        
    }
}

export { addBookmark }