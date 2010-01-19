package org.opencast.engage.brick.videodisplay.control {
	
	import org.opencast.engage.brick.videodisplay.business.UserEventDelegate;
	import org.swizframework.controller.AbstractController;

	public class UserEventController extends AbstractController {

		[Autowire]
		[Bindable]
		public var model: VideodisplayModel;
		
		[Autowire(bean='userEventDelegate')]
		public var userEventDelegate : UserEventDelegate;
		
		public function start_session(): void {				

				var browser: String = String(ExternalInterface.call('function get_browser() {' + 
						'return navigator.appName + " " + navigator.appVersion;}'));
						
				var platform: String = String(ExternalInterface.call('function get_browser() {' + 
						'return navigator.platform;}'));
				
				executeServiceCall(userEventDelegate.start_session(browser, platform, '127.0.0.1'), 
					session_result, session_fault);
		
		}

		public function session_result(data:Object): void {
			
			model.session_id = int(data.result);
			
		}
		
		public function session_fault(info:Object): void {
			
			Alert.show('Error: Could not get sessionid!');
			
		}
		
		public function dispatch_event(evt_type: String): void {
			
			model.
			var evt: ozp_event = new ozp_event();
			evt.session_id = session_id;
			evt.event_type = evt_type;
			evt.pos_x = mouseX;
			evt.pos_y = mouseY;
			evt.video_time = 42;
			evt.zoomlevel = 100;
			
			ro.add_event(evt);
			
		}
		
	}
}