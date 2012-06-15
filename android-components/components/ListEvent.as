﻿package  
{
	import flash.events.Event;

	public class ListEvent extends Event
	{
		public static const CLICK:String = "listClick";		
		public static const RENDERED:String = "listRendered";
		
		public var index:Number = 0;
		public var label:String = null;
		public var data:* = null;
		
		public function ListEvent( type:String, bubbles:Boolean = true, cancelable:Boolean = true ) 
		{
			super( type, bubbles, cancelable );
		}

		override public function clone():Event
		{
			return new ListEvent( type, bubbles, cancelable );
		}
	}
}
