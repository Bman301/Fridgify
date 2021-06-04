export const inputFunct = () => {
  const input = document.getElementById("SpeechToText");
  input.addEventListener("keyup", function (event) {
    if (event.keyCode === 13) {
      event.preventDefault();
      document.getElementById("formButton").click();
    }
  });
};
