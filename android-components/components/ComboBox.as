﻿package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class ComboBox extends Sprite 
	{
		private var _width:Number = 0;
		private var _label:String = null;		
		
		public function ComboBox( label:String = null, width:Number = 250 ) 
		{
			super();			
			_label = label;			
			_width = width;
			addEventListener( Event.ADDED_TO_STAGE, doAdded );
		}
		
		protected function doAdded( event:Event ):void
		{
			field.text = customSubstr(_label);

			up.width = _width;
			down.width = _width;
			down.visible = false;
			
			arrow.x = _width - 46;

			hit.width = _width;
			hit.addEventListener( MouseEvent.MOUSE_DOWN, doMouseDown );
			hit.addEventListener( MouseEvent.MOUSE_UP, doMouseUp );
		}
		
		protected function doMouseDown( event:MouseEvent ):void
		{
			down.visible = true;
		}
		
		protected function doMouseUp( event:MouseEvent ):void
		{
			down.visible = false;
		}
		
		public function get label():String
		{
			return _label;
		}
		
		public function set label( value:String ):void
		{
			_label = value;	
			field.text = customSubstr(value);
		}
		
		private function customSubstr(val:String, num:int = 10):String
		{
			return val.substr(0, num);
		}
		
	}
}
