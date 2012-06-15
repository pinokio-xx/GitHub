﻿package  
{
	import flash.display.Sprite;
	import flash.events.Event;

	public class ListDialog extends Sprite
	{
		private var _title:String = null;
		
		public function ListDialog( title:String = null ) 
		{
			super();
			_title = title;
			addEventListener( Event.ADDED_TO_STAGE, doAdded );
		}
		
		protected function doAdded( event:Event ):void
		{
			title = _title;
		}
		
		public function get items():Array
		{
			return new Array();
		}
		
		public function set items( value:Array ):void
		{
			var measure:Number = ( value.length * 97 ) + 85 - 1;
			
			if( measure > 711 )
			{
				frame.height = 711;
			} else {
				frame.height = measure;				
			}
			
			//中央に来るように配置
			y = Math.round( ( stage.stageHeight - frame.height ) / 2 );
			
			list.items = value;
		}
		
		public function get title():String
		{
			return _title;
		}
		
		public function set title( value:String ):void
		{
			_title = value;
			
			if( value == null )
			{
				field.text = "";
			} else {
				field.text = value;				
			}
		}
	}
}
