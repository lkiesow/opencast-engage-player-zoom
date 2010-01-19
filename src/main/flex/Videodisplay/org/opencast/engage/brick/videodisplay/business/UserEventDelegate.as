package org.opencast.engage.brick.videodisplay.business {
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	import org.opencast.engage.brick.videodisplay.vo.ozp_session;
	import org.opencast.engage.brick.videodisplay.vo.ozp_event;
	
	
	public class UserEventDelegate {
				
		[Autowire(bean='userEventRO')]
		public var userEventRO : RemoteObject;
		
		public function UserEventDelegate() { }

		public function start_session(browser: String, os: String, ip: String): AsyncToken {
				
				var session: ozp_session = new ozp_session();
				
				session.browser = browser;
				session.ip = ip;
				session.operating_system = os;
				
				return userEventRO.start_session(session);
				
		}
		
		public function dispatch_event(evt_type: String): void {
				
				/*
				var evt: ozp_event = new ozp_event();
				evt.session_id = session_id;
				evt.event_type = evt_type;
				evt.pos_x = mouseX;
				evt.pos_y = mouseY;
				evt.video_time = 42;
				evt.zoomlevel = 100;
				
				ro.add_event(evt);
				*/
				
			}

	}
}