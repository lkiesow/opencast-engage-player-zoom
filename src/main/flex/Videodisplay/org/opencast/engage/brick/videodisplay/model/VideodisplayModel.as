package org.opencast.engage.brick.videodisplay.model
{
	import com.adobe.strobe.players.MediaPlayerWrapper;
	
	import flash.media.Video;
	import flash.utils.Timer;
	
	import org.opencast.engage.brick.videodisplay.state.PlayerState;
	[Bindable]
	public class VideodisplayModel {
		
		// session-id for communication with BlazeDS
		public var session_id: int;
		// whether or not to communicate with the OZPEventServer
		public var userEventServer: Boolean;
		
		// zoomlevel of the video display
		public var zoomLevel: Number = 100;
		
		// position of the bideo display
		public var displayPositionX: Number = 0;
		public var displayPositionY: Number = 0;
		
		/**
		 * Timer in control fo hiding the controls.
		 */		
		public var controlHideTimer: Timer = new Timer(5000, 1);
		
		/**
		 * Whether or not the controls should be visible.
		 */
		public var showControls: Boolean = false;
		
		/**
		 * The download progress of the current video.
		 * A value between 0 (nothing loaded) and 1 (download complete).
		 */
		public var loadingProgress: Number = 0;
				
		/**
		 * Points to the displayed video after initialization. 
		 */
		public var video: Video = null;
		public var player : MediaPlayerWrapper;
		public var currentDuration : Number = 0;
		public var currentPlayhead : Number = 0;
		public var currentPlayerState : String = PlayerState.PAUSING;
		// Current Caption Set
		public var currentCaptionSet : Array;
		// ------- Constructor -------
		public function VideodisplayModel()
		{
			//implement as singelton
		}
	}
}
