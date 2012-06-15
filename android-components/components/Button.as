﻿package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	//import flashx.textLayout.formats.TextAlign;
	
	public class Button extends Sprite 
	{
		public static const REGULAR:String = "regular";
		public static const TRIGGER:String = "trigger";
		
		private var _width:Number = 0;
		private var _label:String = null;
		private var _style:String = null;
		
		public function Button( label:String = null, width:Number = 193, style:String = "regular" ) 
		{
			super();
			_label = label;
			_width = width;
			_style = style;
			addEventListener( Event.ADDED_TO_STAGE, doAdded );
		}
		
		public function setWidth( value:Number ):void
		{
			hit.width = value;
			up.width = value;
			down.width = value;
			field.width = value;			
		}
		
		protected function doAdded( event:Event ):void
		{
			if( _style == TRIGGER )
			{
				field.defaultTextFormat = new TextFormat( "Droid Sans", 28, 0x000000, null, null, null, null, null, TextFormatAlign.LEFT );
				field.y = field.y - 4;
				field.x = field.x + 8;
			}
			
			setWidth( _width );
			
			if( _label != null )
			{
				field.text = _label;
			} else {
				field.text = "";
			}
			
			down.visible = false;
			
			addEventListener( MouseEvent.MOUSE_DOWN, doMouseDown );
			addEventListener( MouseEvent.MOUSE_UP, doMouseUp );
		}
		
		protected function doMouseDown( event:MouseEvent ):void
		{
			down.visible = true;
			up.visible = false;
		}
		
		protected function doMouseUp( event:MouseEvent ):void
		{
			up.visible = true;			
			down.visible = false;
		}		
		
		public function get label():String
		{
			return _label;
		}
		
		public function set label( value:String ):void
		{
			_label = value;
			
			if( _label == null )
			{
				field.text = "";
			} else {
				field.text = value;
			}
		}
	}
}
