var mytrack = document.getElementById('mytrack');
var playButton = document.getElementById('playButton');
var muteButton = document.getElementById('muteButton');
var fwdButton = document.getElementById('fwdButton');
var rwdButton = document.getElementById('rwdButton');
var likeButton = document.getElementById('likeButton');
var dislikeButton = document.getElementById('dislikeButton');
var volumeslider = document.getElementById("volumeslider");
var likecount = document.getElementById('likecount').value;
var dislikecount = document.getElementById('dislikecount').value;
var canvas, ctx, source, context, analyser, fbc_array, bars, bar_x, bar_width, bar_height;
var alike = 0;
var adislike = 0;



var barSize = 640;
var bar = document.getElementById('defaultBar');
var baprogressBar = document.getElementById('progressBar');
var mouseX =  0;

bar.addEventListener('click',clickedBar,false);
playButton.addEventListener('click',playOrPause,false);
muteButton.addEventListener('click',muteOrUnmute,false);
fwdButton.addEventListener('click',forward,false);
rwdButton.addEventListener('click',rewind,false);

volumeslider.addEventListener("change",setvolume,false);



function myLikeFunction(){
	
	alert("likes - "+likecount);
	if(alike == 0 && adislike != 1){
		likeButton.style.backgroundImage = 'url(../images/lik.png)';
		alike = 1;
		likecount = +likecount+1
		document.getElementById("likecount").value = likecount;
		}
		else if (alike == 1){
			likeButton.style.backgroundImage = 'url(../images/like.png)';
			alike = 0;
			likecount = +likecount-1
			document.getElementById("likecount").value = likecount;
		}
}

function myDislikeFunction(){
	alert("dislikes - "+dislikecount);
	if(adislike == 0 && alike != 1){
		dislikeButton.style.backgroundImage = 'url(../images/dis.png)';
		adislike = 1;
		dislikecount = +dislikecount+1
		document.getElementById("dislikecount").value = dislikecount;
		}
		else if(adislike == 1){
			dislikeButton.style.backgroundImage = 'url(../images/dislike.png)';
			adislike = 0;
			dislikecount = +dislikecount-1
			document.getElementById("dislikecount").value = dislikecount;
		}
}

function playOrPause(){
	if(!mytrack.paused && !mytrack.ended){
		mytrack.pause();
		playButton.style.backgroundImage = 'url(../images/media_play.png)';
	}
	else{
		mytrack.play();
		playButton.style.backgroundImage = 'url(../images/media_pause.png)';
		wavesurfer.load('../audio/nm.mp3');
	}
}

function muteOrUnmute(){
	if(mytrack.muted == true){
		mytrack.muted = false;
		muteButton.style.backgroundImage = 'url(../images/speaker.png)';
	}
	else{
		mytrack.muted = true;
		muteButton.style.backgroundImage = 'url(../images/mute.png)';
	}
}

function forward(){
	if(!mytrack.ended){
		mouseX = mouseX +( mytrack.duration/barSize + 15);
		var newtime =  mouseX;
		
		mytrack.currentTime = newtime;
		progressBar.style.width = mouseX + "px";
	}
}

function rewind(){
	if(!mytrack.ended){
		mouseX = mouseX +( mytrack.duration/barSize - 15);
		var newtime =  mouseX;
		
		mytrack.currentTime = newtime;
		progressBar.style.width = mouseX + "px";
	}
}




function updateTrackTime(track){
  var currTimeDiv = document.getElementById('currentTime');
  var durationDiv = document.getElementById('fullDuration');
  
  var size = parseInt(track.currentTime*barSize/track.duration);
  progressBar.style.width = size + "px";

  var currTime = Math.floor(track.currentTime).toString(); 
  var duration = Math.floor(track.duration).toString();

  currTimeDiv.innerHTML = formatSecondsAsTime(currTime);

  if (isNaN(duration)){
    durationDiv.innerHTML = '00:00';
  } 
  else{
    durationDiv.innerHTML = formatSecondsAsTime(duration);
  }
  
  if(track.ended){
	  currTimeDiv.innerHTML = "0.00";
	  playButton.style.backgroundImage = 'url(../images/media_play.png)';
	  progressBar.style.width = "0px";
  }
}

function formatSecondsAsTime(secs, format) {
  var hr  = Math.floor(secs / 3600);
  var min = Math.floor((secs - (hr * 3600))/60);
  var sec = Math.floor(secs - (hr * 3600) -  (min * 60));

  if (min < 10){ 
    min = "0" + min; 
  }
  if (sec < 10){ 
    sec  = "0" + sec;
  }

  return min + ':' + sec;
}

function clickedBar(e){
	if(!mytrack.ended){
		mouseX = e.pageX - bar.offsetLeft;
		var newtime = mouseX * mytrack.duration/barSize;
		
		mytrack.currentTime = newtime;
		progressBar.style.width = mouseX + "px";
	}
}

function setvolume(){
	mytrack.volume = volumeslider.value / 100;
}

