export const record = () => {
  let recognition = new webkitSpeechRecognition();
  let on = false;
  recognition.lang = "en-US";
  recognition.continuous = true;

  recognition.onresult = function (event) {
    document.getElementById("SpeechToText").value =
      event.results[0][0].transcript;
  };

  const voice = document.getElementById("voice-recognition");

  voice.addEventListener("click", (e) => {
    if (on) {
      recognition.stop();
      on = false;
    } else {
      recognition.start();
      on = true;
    }
  });
};
