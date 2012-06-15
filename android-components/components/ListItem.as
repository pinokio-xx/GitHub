package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	//import com.demonsters.debugger.MonsterDebugger;
	
	public class ListItem extends Sprite
	{
		private var _label:String = null;
		private var _data:* = null;
		
		public function ListItem( value:Object = null ) 
		{
			super();
		
			//_label = value;
			if(value != null)
			{
				_label = value["label"];
				_data = value["data"];
			}
			
			addEventListener(Event.ADDED_TO_STAGE, doAdded );
		}
		
		public function reset():void
		{
			down.visible = false;
		}
		
		protected function doAdded( event:Event ):void
		{
			if( _label == null )
			{
				field.text = "";
			} else {
				field.text = _label;
			}
			
			down.visible = false;
			
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
			
			if( value == null )
			{
				field.text = "";
			} else {
				field.text = value;
			}
		}
		
		public function get data():String
		{
			return _data;
		}
		
		public function set data( value:* ):void
		{
			_data = value;
		}
		
		
	}
}
