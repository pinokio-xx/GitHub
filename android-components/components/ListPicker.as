package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import caurina.transitions.Tweener;
	
	public class ListPicker extends Sprite
	{
		public function ListPicker() 
		{
			super();
			addEventListener( Event.ADDED_TO_STAGE, doAdded );
			
		}
		
		public function show( items:Array, title:String = null ):void
		{
	
			if( title != null )
			{
				dlg.title = title;
			}
			
			dlg.x = (stage.stageWidth / 2) - (dlg.width / 2);
			dlg.y = (stage.stageHeight / 2) - (dlg.height / 2);
			dlg.items = items;
		}
		
		
		protected function doAdded( event:Event ):void 
		{
			
			block.alpha = 0;
			block.visible = false;
			
			dlg.visible = false;
			dlg.addEventListener( ListEvent.CLICK, doListClick );
			dlg.addEventListener( ListEvent.RENDERED, doListRendered );
		}
		
		protected function doListClick( event:ListEvent ):void
		{
			dlg.visible = false;			
			Tweener.addTween(block, {alpha:0, time:0.5, onComplete:function(){ block.visible = false;} });
		}
		
		/*
			* リストの表示準備ができたら呼ばれる
		*/
		protected function doListRendered( event:ListEvent ):void
		{
			event.stopImmediatePropagation();
			
			block.alpha = 0;
			block.visible = true;
			Tweener.addTween(block, {alpha:1, time:0.5});
	
			dlg.alpha = 1;
			dlg.visible = true;
		}
		
		public function get items():Array
		{
			return dlg.items;
		}
		
		public function set items( value:Array ):void
		{
			dlg.items = value;
		}
		
		public function get title():String
		{
			return dlg.title;
		}
		
		public function set title( value:String ):void
		{
			dlg.title = value;
		}		
	}
}
