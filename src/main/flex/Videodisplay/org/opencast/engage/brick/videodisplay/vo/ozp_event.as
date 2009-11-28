package org.opencast.engage.brick.videodisplay.vo {
	
	[Bindable]
	[RemoteClass(alias='ozp_eventserver.ozp_event')]
	
	public class ozp_event {
		
		public static const EVENT_TYPE_ZOOM  : String = 'zoom';
		public static const EVENT_TYPE_PLAY  : String = 'play';
		public static const EVENT_TYPE_PAUSE : String = 'pause';
		public static const EVENT_TYPE_DRAG  : String = 'drag';
		public static const EVENT_TYPE_JUMP  : String = 'jump';
		
		public var session_id: int;
		public var event_type: String;
		public var video_time: int;
		public var zoomlevel: int;
		public var pos_x: int;
		public var pos_y: int;
		public var timestamp: int = 0; 

	}
}