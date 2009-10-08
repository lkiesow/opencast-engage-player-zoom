package org.opencast.engage.brick.videodisplay.control {
	
	import flash.geom.Point;
	
	import mx.core.Application;
	
	import org.opencast.engage.brick.videodisplay.model.VideodisplayModel;
	import org.swizframework.controller.AbstractController;

	public class DragController extends AbstractController {
		
		[Autowire]
		[Bindable]
		public var model: VideodisplayModel;
		
		private var dragStartPos: Point; 
		private var dispStartPos: Point; 
		private var draggingDisplay: Boolean = false;
		
		public function startDrag( mousePosX: Number, mousePosY: Number ): void {
		
			//Alert.show(mousePosX + ' - ' + mousePosY);
			dragStartPos = new Point(mousePosX, mousePosY);
			dispStartPos = new Point(model.displayPositionX, model.displayPositionY);
			draggingDisplay = true;
		
		}
		
		public function dragDisplay( mousePosX: Number, mousePosY: Number ): void {
		
			var dispWidth : int = Application.application.width  * model.zoomLevel / 100;
			var dispHeight: int = Application.application.height * model.zoomLevel / 100;
		
			if (draggingDisplay) {
				model.displayPositionX = dispStartPos.x + mousePosX - dragStartPos.x < 0 
					? ( 
						(dispStartPos.x + mousePosX - dragStartPos.x) + dispWidth < Application.application.width
						? Application.application.width - dispWidth
						: dispStartPos.x + mousePosX - dragStartPos.x
					) 
					: 0;
				model.displayPositionY = dispStartPos.y + mousePosY - dragStartPos.y < 0
					? ( 
						dispStartPos.y + mousePosY - dragStartPos.y + dispHeight < Application.application.height
						? Application.application.width - dispWidth
						: dispStartPos.y + mousePosY - dragStartPos.y
					)
					: 0;					
			}
		
		}
		
		public function stopDrag( mousePosX: Number, mousePosY: Number ): void {
		
			var dispWidth : int = Application.application.width  * model.zoomLevel / 100;
			var dispHeight: int = Application.application.height * model.zoomLevel / 100;
			
			if (draggingDisplay) {
				model.displayPositionX = dispStartPos.x + mousePosX - dragStartPos.x < 0 
					? ( 
						(dispStartPos.x + mousePosX - dragStartPos.x) + dispWidth < Application.application.width
						? Application.application.width - dispWidth
						: dispStartPos.x + mousePosX - dragStartPos.x
					) 
					: 0;
				model.displayPositionY = dispStartPos.y + mousePosY - dragStartPos.y < 0
					? ( 
						dispStartPos.y + mousePosY - dragStartPos.y + dispHeight < Application.application.height
						? Application.application.width - dispWidth
						: dispStartPos.y + mousePosY - dragStartPos.y
					)
					: 0;
				draggingDisplay = false;
			}
		
		
		}		
		
	}
	
}