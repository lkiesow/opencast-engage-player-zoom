package org.opencast.engage.brick.videodisplay.control {
	
	import flash.display.StageDisplayState;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.controls.Alert;
	import mx.core.Application;
	
	import org.opencast.engage.brick.videodisplay.model.VideodisplayModel;
	import org.swizframework.controller.AbstractController;

	public class FullScreenController extends AbstractController {

		[Autowire]
		[Bindable]
		public var model: VideodisplayModel;
			
		[Autowire(bean="zoomController")]
		public var zoomController: ZoomController;
		
		public function toggleFullScreen(): void {
			
			try {
				switch (Application.application.stage.displayState) {
					case StageDisplayState.FULL_SCREEN:
						/* If already in full screen mode, switch to normal mode. */
						Application.application.stage.displayState = StageDisplayState.NORMAL;
						zoomController.adjustDisplayPos();
						break;
					default:
						/* If not in full screen mode, switch to full screen mode. */
						Application.application.stage.displayState = StageDisplayState.FULL_SCREEN;
						model.controlHideTimer.addEventListener(TimerEvent.TIMER_COMPLETE, 
							function TimerComplete(): void {
								model.showControls = false;
							});
						model.controlHideTimer.start();
						/*
						var t: Timer = new Timer(5000, 1);
						t.addEventListener(TimerEvent.TIMER_COMPLETE, 
							function TimerComplete(): void {
								Alert.show('timerevent');
							});
						Alert.show('timer started');
						t.start();
						*/
						break;
				}
			} catch (err:SecurityError) {
                // ignore
			}
		}		
		
	}
}