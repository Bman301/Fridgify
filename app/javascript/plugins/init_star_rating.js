import "jquery-bar-rating";

const initStarRating = () => {
    $('#rating_rating').barrating({
      theme: 'css-stars',
      onSelect: (value, text, event) => {
        const form = $("form.review_form");  // We are selecting the form on the page with its class
        form.submit(); // We submit the form with javascript
      }
    });
  };



  const displayRating = () => {
    const score = document.getElementById("thisrating");
    if (score){
      const score2 = score.dataset.rating;
      var number = parseFloat(score2);
      var number = number;
      $('#diplay-rating').barrating({
        theme: 'css-stars',
        initialRating: number,
        readonly: 'true'
      });
     }
  };
  

export { initStarRating };
export {displayRating };


