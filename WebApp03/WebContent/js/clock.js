// Define the hours, minutes & seconds elements.
const hoursEl = document.getElementById("hours");
const minutesEl = document.getElementById("minutes");
const secondsEl = document.getElementById("seconds");

function main() {
  const totalSeconds = new Date().getTime() / 1000;

  const hours = Math.floor(totalSeconds / 3600) % 24 - 3;
  const minutes = Math.floor(totalSeconds / 60) % 60;
  const seconds = Math.floor(totalSeconds) % 60;

  hoursEl.innerText = formatTime(hours);
  minutesEl.innerText = formatTime(minutes);
  secondsEl.innerText = formatTime(seconds);
}

// Format the time by adding 0 before the time if it's less than 10..
function formatTime(time) {
  return time < 10 ? `0${time}` : time;
}

// Initial call.
main();

// Call the function every second.
setInterval(main, 1000);