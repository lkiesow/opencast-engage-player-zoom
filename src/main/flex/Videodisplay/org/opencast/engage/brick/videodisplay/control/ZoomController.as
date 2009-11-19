package org.opencast.engage.brick.videodisplay.control
{
	import mx.core.Application;
	
	import org.opencast.engage.brick.videodisplay.model.VideodisplayModel;
	import org.swizframework.controller.AbstractController;

	public class ZoomController extends AbstractController {
		
		[Autowire]
		[Bindable]
		public var model:VideodisplayModel;
		
		
		public function changeZoomLevel(delta: int, pos_x: int = -1, pos_y: int = -1): void {
			
			// change zoomlevel; min 100%
			model.zoomLevel = model.zoomLevel + delta < 100 ? 100 : model.zoomLevel + delta;
			
			// zomm in center is position is not set
			if (pos_x == -1 || pos_y == -1) {
				adjustDisplayPos(
					- Application.application.width * delta / 200,
					- Application.application.height * delta / 200);
			} else {
				adjustDisplayPos(
					- pos_x * delta / 100,
					- pos_y * delta / 100);
			}
				
		}
		
		public function setZoomLevel(value: int, pos_x: int = -1, pos_y: int = -1): void {
		
			var oldZoomLevel: int = model.zoomLevel;
			
			// set zoomlevel (min. 100%)
			model.zoomLevel = value < 100 ? 100 : value; 
			
			// zomm in center is position is not set
			if (pos_x == -1 || pos_y == -1) {
				adjustDisplayPos(
					- Application.application.width * (oldZoomLevel - model.zoomLevel) / 200,
					- Application.application.height * (oldZoomLevel - model.zoomLevel) / 200);
			} else {
				adjustDisplayPos(
					- pos_x * (oldZoomLevel - model.zoomLevel) / 100,
					- pos_y * (oldZoomLevel - model.zoomLevel) / 100);
			}
		
		}
		
		public function adjustDisplayPos(delta_x: int = 0, delta_y: int = 0): void {
		
			var dispWidth : int = Application.application.width  * model.zoomLevel / 100;
			var dispHeight: int = Application.application.height * model.zoomLevel / 100;
			
			model.displayPositionX += delta_x;
			model.displayPositionY += delta_y;
			
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