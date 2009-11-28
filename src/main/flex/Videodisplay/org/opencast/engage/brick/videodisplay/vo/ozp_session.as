package org.opencast.engage.brick.videodisplay.vo {	

	[Bindable]
	[RemoteClass(alias="ozp_eventserver.ozp_session")]
	
	public class ozp_session {
		
		public var session_id : int = -1;
		public var ip : String = '127.0.0.1';
		public var browser : String = '';
		public var operating_system : String = '';
		public var timestamp : int = 0;

	}
}