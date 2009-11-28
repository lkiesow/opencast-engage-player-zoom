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
		
	}
}