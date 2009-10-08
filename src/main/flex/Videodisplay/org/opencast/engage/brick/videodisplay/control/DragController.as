package org.opencast.engage.brick.videodisplay.control {
	
	import flash.geom.Point;
	
	import mx.controls.Alert;
	
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
		
			if (draggingDisplay) {
				model.displayPositionX = dispStartPos.x + mousePosX - dragStartPos.x < 0 
					? dispStartPos.x + mousePosX - dragStartPos.x
					: 0;
				model.displayPositionY = dispStartPos.y + mousePosY - dragStartPos.y < 0
					? dispStartPos.y + mousePosY - dragStartPos.y
					: 0;					
			}
		
		}
		
		public function stopDrag( mousePosX: Number, mousePosY: Number ): void {
		
			if (draggingDisplay) {
				model.displayPositionX = dispStartPos.x + mousePosX - dragStartPos.x < 0 
					? dispStartPos.x + mousePosX - dragStartPos.x 
					: 0;
				model.displayPositionY = dispStartPos.y + mousePosY - dragStartPos.y < 0
					? dispStartPos.y + mousePosY - dragStartPos.y
					: 0;
				draggingDisplay = false;
			}
		
		
		}		
		
	}
	
}