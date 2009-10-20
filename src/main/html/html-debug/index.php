<html>
<head>
<title>Accessible Opencast Progressive Download</title>
<script type="text/javascript" src="bridge/lib/FABridge.js"></script>
<script type="text/javascript" src="bridge/Videodisplay.js"></script>

<link rel="stylesheet" href="jquery/ui/css/base/ui.all.css"
	type="text/css">
<link rel="stylesheet" href="css/oc.player.css" type="text/css">
<script type="text/javascript" src="jquery/jquery-1.3.2.js"></script>
<script type="text/javascript" src="jquery/ui/ui.core.js"></script>
<script type="text/javascript" src="jquery/ui/ui.slider.js"></script>


<script language="javascript" type="text/javascript">
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
<div style="width: 910px; margin-left: auto; margin-right: auto;">
<div style="height: 600px; position: absolute; margin-top: -300px; top: 50%;">
<div style="margin: 10px; margin-bottom: 0px;">
<object id="oc_Videodisplay"
	codeBase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab"
	width="900" height="507"
	classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000">
	<param name="movie" value="Videodisplay.swf" />
	<param name="quality" value="high" />
	<param name="allowScriptAccess" value="always" />
	<param name="bgcolor" value="#000000" />
	<param name="allowFullScreen" value="true" />
	<param name="flashvars"
		VALUE="bridgeName=b_Videodisplay&video_url=<? echo $_GET['video']; ?>&autoplay=false&captions=http://vm069.rz.uos.de:8080/examples/car.dfxp.xml">
	<embed width="900" height="507" bgcolor="#000000"
		allowfullscreen="true" type="application/x-shockwave-flash"
		pluginspage="http://www.macromedia.com/go/getflashplayer"
		flashvars="bridgeName=b_Videodisplay&video_url=<? echo $_GET['video']; ?>&autoplay=false&captions=http://vm069.rz.uos.de:8080/examples/car.dfxp.xml"
		quality="high" allowScriptAccess="always" src="Videodisplay.swf" /></object></div>

<div id="slider" class="ui-slider"
	style="width: 900px; display: inline-block; margin-left: 10px; margin-right: 10px; margin-top: 10px;">
<div class="matterhorn-progress-bar"></div>
</div>

<div style="margin-left: 10px; margin-right: 10px; margin-top: 5px;">
<input type="button" onclick="doPlay();" value="Play" /> <input
	type="button" onclick="doPause();" value="Pause" /> <input
	type="button" onclick="doStop();" value="Stop" />
<div id="time" style="display: inline-block; margin-left: 90px;">00:00:00
| 00:00:00</div>
</div>
</div>
</div>

</body>
</html>