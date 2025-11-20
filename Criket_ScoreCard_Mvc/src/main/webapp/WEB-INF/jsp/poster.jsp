<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ include file="Heder.jsp" %>
<%@ include file="sidebar.jsp" %>
<%@ include file="Footer.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${tournament.tournamentName} | Tournament Poster</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>

<style>

body {
    background-color: #f0f2f5 !important;
    font-family: 'Poppins', sans-serif;
}

.main-wrapper {
    padding-left: 260px;
    padding-top: 80px;
}

#posterContainer {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

#posterArea {
  position: relative;
  background: url('/assets/img/batballstump.png');
  background-size: cover;
  background-position: center;
  border-radius: 20px;
  padding: 40px;
  width: 80%;
  color: white;
  text-align: center;
  box-shadow: 0 0 25px rgba(0,0,0,0.5);
}


/* ⭐ GOLD ITEMS POSITIONING */
.gold-stumps {
   position: absolute;
   left: 20px;
   top: 150px;
   width: 160px;
   opacity: 0.92;
}

.gold-ball {
   position: absolute;
   right: 25px;
   bottom: 35px;
   width: 145px;
   opacity: 0.95;
}

h1 {
  font-size: 2.4rem;
  color: #ffea00;
  text-shadow: 2px 2px 10px #000;
}

.details {
  font-size: 1.1rem;
  margin: 8px 0;
}

label {
  color: #00eaff;
  display: block;
  margin-top: 10px;
  font-weight: 600;
}

input {
  width: 60%;
  padding: 8px;
  border: 2px solid #00eaff;
  border-radius: 6px;
  text-align: center;
  margin-top: 5px;
  outline: none;
  background-color: rgba(255,255,255,0.1);
  color: white;
}

button {
  margin-top: 20px;
  padding: 10px 25px;
  background: linear-gradient(90deg, #00c6ff, #0072ff);
  border: none;
  color: #fff;
  font-weight: bold;
  border-radius: 10px;
  cursor: pointer;
  box-shadow: 0 0 10px #00eaff;
}
button:hover { transform: scale(1.05); }

.color-section-in {
  text-align: center;
  margin-bottom: 15px;
}

.color-options {
  display: flex;
  justify-content: center;
  gap: 12px;
}

.color-btn {
  width: 38px;
  height: 38px;
  border-radius: 50%;
  border: 2px solid white;
  cursor: pointer;
  transition: 0.3s;
}
.color-btn:hover { transform: scale(1.1); }

</style>
</head>

<body>

<div class="main-wrapper">

<!-- POSTER MAIN BOX -->
<div id="posterContainer">
<div id="posterArea">

 


  <!-- Color Picker Inside Poster -->
  <div class="color-section-in">
    <h4 style="color: white">🎨 Select Poster Color</h4>
    <div class="color-options">
      <div class="color-btn" style="background: linear-gradient(135deg,#1e3c72,#2a5298);" onclick="changeBG('blue')"></div>
      <div class="color-btn" style="background: linear-gradient(135deg,#00b09b,#96c93d);" onclick="changeBG('green')"></div>
      <div class="color-btn" style="background: linear-gradient(135deg,#ff8008,#ffc837);" onclick="changeBG('orange')"></div>
      <div class="color-btn" style="background: linear-gradient(135deg,#8e2de2,#4a00e0);" onclick="changeBG('purple')"></div>
      <div class="color-btn" style="background: linear-gradient(135deg,#ee9ca7,#ffdde1);" onclick="changeBG('pink')"></div>
    </div>
  </div>

  <h1>${tournament.tournamentName}</h1>

  <p class="details">📍 ${tournament.city}, ${tournament.ground}</p>
  <p class="details">🗓 ${tournament.startDate} - ${tournament.endDate}</p>
  <p class="details">👤 Organizer: ${tournament.organizerName} (${tournament.organizerNumber})</p>
  <p class="details">🏏 Category: ${tournament.category}</p>

  <hr>

  <!-- FORM -->
  <form id="posterForm" onsubmit="showPoster(); return false;">
    <label>Entry Fee (₹)</label>
    <input type="text" id="entryFee" required>

    <label>1st Prize</label>
    <input type="text" id="firstPrize" required>

    <label>2nd Prize</label>
    <input type="text" id="secondPrize">

    <label>3rd Prize</label>
    <input type="text" id="thirdPrize">

    <label>4th Prize (optional)</label>
    <input type="text" id="fourthPrize"> <br>

    <button type="submit">🎨 Generate Poster</button>
  </form>


  <!-- FINAL POSTER -->
  <div id="finalPoster" style="display:none; margin-top:30px;">
    <h2 style="color:#ffcc00;">🏆 Prize Distribution 🏆</h2>

    <p id="entryFeeText"></p>
    <p id="firstPrizeText"></p>
    <p id="secondPrizeText"></p>
    <p id="thirdPrizeText"></p>
    <p id="fourthPrizeText"></p>

    <h3 style="color:#00ff99;">📞 Contact</h3>
    <p>${tournament.organizerName} - ${tournament.organizerNumber}</p>

    <button onclick="downloadPoster()">📸 Download Poster</button>
  </div>

</div>
</div>

</div>

<script>

function showPoster() {

  entryFeeText.innerText  = "💵 Entry Fee: ₹" + entryFee.value;
  firstPrizeText.innerText = "🥇 1st Prize: " + firstPrize.value;
  secondPrizeText.innerText = "🥈 2nd Prize: " + secondPrize.value;
  thirdPrizeText.innerText  = "🥉 3rd Prize: " + thirdPrize.value;

  const fourth = fourthPrize.value.trim();
  fourthPrizeText.innerText = fourth ? "🎖️ 4th Prize: " + fourth : "";

  posterForm.style.display = "none";
  finalPoster.style.display = "block";
}

function changeBG(color) {
  switch(color) {
    case 'blue': posterArea.style.background = 'linear-gradient(135deg,#1e3c72,#2a5298)'; break;
    case 'green': posterArea.style.background = 'linear-gradient(135deg,#00b09b,#96c93d)'; break;
    case 'orange': posterArea.style.background = 'linear-gradient(135deg,#ff8008,#ffc837)'; break;
    case 'purple': posterArea.style.background = 'linear-gradient(135deg,#8e2de2,#4a00e0)'; break;
    case 'pink': posterArea.style.background = 'linear-gradient(135deg,#ee9ca7,#ffdde1)'; break;
  }
}

function downloadPoster() {

	  // Hide UI elements before capture
	  document.querySelector(".color-section-in").style.display = "none";
	  document.querySelector("#finalPoster button").style.display = "none";

	  html2canvas(posterArea, { scale: 3 }).then(canvas => {

	    // Bring UI back after capture
	    document.querySelector(".color-section-in").style.display = "block";
	    document.querySelector("#finalPoster button").style.display = "block";

	    const link = document.createElement("a");
	    link.href = canvas.toDataURL("image/png");
	    link.download = "${tournament.tournamentName}_Poster.png";
	    link.click();

	    // Redirect
	    setTimeout(() => {
	      window.location.href = "/tournament/manage?id=${tournament.id}";
	    }, 1200);
	  });
	}


</script>

</body>
</html>
