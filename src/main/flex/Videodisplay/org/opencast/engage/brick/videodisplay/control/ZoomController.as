package org.opencast.engage.brick.videodisplay.control
{
	import mx.core.Application;
	
	import org.opencast.engage.brick.videodisplay.model.VideodisplayModel;
	import org.swizframework.controller.AbstractController;

	public class ZoomController extends AbstractController {
		
		[Autowire]
		[Bindable]
		public var model:VideodisplayModel;
		
		
		public function changeZoomLevel(delta: int): void {
			
			// change zoomlevel; min 100%
			model.zoomLevel = model.zoomLevel + delta < 100 ? 100 : model.zoomLevel + delta;
			adjustDisplayPos();
				
		}
		
		public function setZoomLevel(value: int): void {
		
			// set zoomlevel (min. 100%)
			model.zoomLevel = value < 100 ? 100 : value; 
			adjustDisplayPos();
		
		}
		
		private function adjustDisplayPos(): void {
		
			var dispWidth : int = Application.application.width  * model.zoomLevel / 100;
			var dispHeight: int = Application.application.height * model.zoomLevel / 100;
			
			model.displayPositionX = model.displayPositionX < 0 
				? ( 
					model.displayPositionX + dispWidth < Application.application.width
					? Application.application.width - dispWidth
					: model.displayPositionX
				) 
				: 0;
			model.displayPositionY = model.displayPositionY < 0
				? ( 
					model.displayPositionY + dispHeight < Application.application.height
					? Application.application.height - dispHeight
					: model.displayPositionY
				)
				: 0;
		
		}
		
	}
}