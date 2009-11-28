package org.opencast.engage.brick.videodisplay.control.responder {
	
	import mx.rpc.IResponder;
	
	import org.opencast.engage.brick.videodisplay.model.VideodisplayModel;

	public class UserEventResponder implements IResponder {
		
		[Autowire]
		private var model: VideodisplayModel;
		
		public function UserEventResponder() {
			
		}

		public function result(data:Object): void {
			
			model.session_id = int(data.result);
			
		}
		
		public function fault(info:Object): void {
			
			Alert.show('Error: Could not get sessionid!');
			
		}
		
	}
}