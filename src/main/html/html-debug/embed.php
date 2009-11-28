<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de">
<head>
<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
<title>Accessible Opencast Progressive Download</title>
<script type="text/javascript" src="bridge/lib/FABridge.js"></script>
<script type="text/javascript" src="bridge/Videodisplay.js"></script>

<link rel="stylesheet" href="jquery/ui/css/base/ui.all.css" type="text/css" />
<link rel="stylesheet" href="css/oc.player.css" type="text/css" />
<script type="text/javascript" src="jquery/jquery-1.3.2.js"></script>
<script type="text/javascript" src="jquery/ui/ui.core.js"></script>
<script type="text/javascript" src="jquery/ui/ui.slider.js"></script>


<script type="text/javascript">
        function doPlay () {
            Videodisplay.play();
        }

        function doPause () {
            Videodisplay.pause();
        }

        function doStop () {
            Videodisplay.stop();
        }

        function doSeek (time) {
            Videodisplay.seek (time);
        }

        function setPlayhead (newPosition) {
            $('#slider').slider('value', newPosition);
        }

        function doSetVolume (value) {
           Videodisplay.setVolume(value);
        }

        function setTime (text) {
            document.getElementById("time").innerHTML = text;

                   }

        function setDuration (time) {
            $('#slider').slider('option', 'max', time);
        }

        function setProgress (value)
        {
        	$('.matterhorn-progress-bar').css("width", value + "%");
        }

    </script>

<!-- js code for scrubber -->
<script type="text/javascript">

            $(document).ready(function(){
                $("#slider").slider();
                $('#slider').slider('option', 'animate', true);
                $('#slider').slider('option', 'min', 0);
                $('#slider').bind('slide', function(event, ui) {

                    Videodisplay.seek (ui.value);
                });
            });

        </script>
</head>

<body>
<div style="width: 370px; margin-left: auto; margin-right: auto;">
<div style="height: 300px; position: absolute; margin-top: -150px; top: 50%;">
<div style="margin: 10px; margin-bottom: 0px;">
  <object id="oc_Videodisplay" type="application/x-shockwave-flash"
    data="Videodisplay.swf"
    style="width: 360px; height: 206px;">
      <param name="allowScriptAccess" value="always" />
      <param name="allowFullScreen" value="true" />
      <param name="movie" value="Videodisplay.swf" />
      <param name="quality" value="high" />
      <param name="bgcolor" value="#000000" />
      <param name="flashvars" value="bridgeName=b_Videodisplay&amp;video_url=<? echo $_GET['video']; ?>&amp;autoplay=false" />
  </object>
</div>

<div id="slider" class="ui-slider"
	style="width: 360px; display: inline-block; margin-left: 10px; margin-right: 10px; margin-top: 10px;">
<div class="matterhorn-progress-bar"></div>
</div>

<div style="margin-left: 10px; margin-right: 10px; margin-top: 5px;">
<input type="button" onclick="doPlay();" value="Play" /> <input
	type="button" onclick="doPause();" value="Pause" /> <input
	type="button" onclick="doStop();" value="Stop" />
<div id="time" style="display: inline-block; margin-left: 50px;">00:00:00
| 00:00:00</div>
</div>
</div>
</div>

</body>
</html>