package org.opencast.engage.brick.videodisplay.control
{
	import org.opencast.engage.brick.videodisplay.model.VideodisplayModel;
	import org.swizframework.controller.AbstractController;

	public class ZoomController extends AbstractController {
		
		[Autowire]
		[Bindable]
		public var model:VideodisplayModel;
		
		
		public function changeZoomLevel(delta: int): void {
			
			// change zoomlevel; min 100%
			model.zoomLevel = model.zoomLevel + delta < 100 ? 100 : model.zoomLevel + delta;
				
		}
		
		public function setZoomLevel(value: int): void {
		
			// set zoomlevel (min. 100%)
			model.zoomLevel = value < 100 ? 100 : value; 
		
		}
		
	}
}