package org.opencast.engage.brick.videodisplay.business {
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	import org.opencast.engage.brick.videodisplay.vo.ozp_session;
	
	
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

	}
}