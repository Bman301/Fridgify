export const record = () => {
  if (typeof webkitSpeechRecognition !== "undefined") {
    let mic = document.getElementById("microphone");
    let on = false;
    let recognition = new webkitSpeechRecognition();
    if (mic) {
      mic.hidden = false;
      recognition.lang = "en-US";
      recognition.continuous = true;

      recognition.onresult = function (event) {
        document.getElementById("SpeechToText").value =
          event.results[0][0].transcript;
      };
    }

    const voice = document.getElementById("voice-recognition");

    let nIntervId;

    function changeColor() {
      nIntervId = setInterval(flashText, 400);
    }

    function flashText() {
      if (mic.style.color === "red") {
        mic.style.color = "white";
      } else {
        mic.style.color = "red";
      }
    }

    function stopTextColor() {
      clearInterval(nIntervId);
    }

    if (!!document.getElementById("voice-recognition")) {
      voice.addEventListener("click", (e) => {
        if (on) {
          recognition.stop();
          stopTextColor();
          mic.style.color = "black";
          on = false;
        } else {
          recognition.start();
          changeColor();
          on = true;
        }
      });
    }
  }
};
