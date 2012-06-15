﻿package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.filters.GlowFilter;
	import flash.filters.BitmapFilterQuality;
	
	import com.greensock.*;

	public class TimePicker extends Sprite 
	{
		public function TimePicker() 
		{
			super();
			addEventListener( Event.ADDED_TO_STAGE, doAdded );
		}

		public function show( date:Date = null ):void
		{
			visible = true;

			dlg.time = date;

			block.alpha = 0;
			block.visible = true;

			dlg.alpha = 1;
			dlg.visible = true;
				
			TweenMax.to( block, 0.35, {
				alpha: 1	
			} );				
		}

		protected function doAdded( event:Event ):void
		{
			visible = false;
			
			block.alpha = 0;
			block.visible = false;
			
			dlg.visible = false;
			dlg.addEventListener( DialogEvent.OK, doDialogDismiss );
			dlg.addEventListener( DialogEvent.CANCEL, doDialogDismiss );
		}
		
		protected function doDialogDismiss( event:DialogEvent ):void
		{
			dlg.visible = false;			
			
			TweenMax.to( block, 0.35, {
				alpha: 0,
				visible: false
			} );										
		}
		
		protected function doDismissComplete():void
		{
			visible = false;
		}

		public function get time():Date
		{
			return dlg.time;
		}
		
		public function set time( value:Date ):void
		{
			dlg.time = value;
		}
	}
}
