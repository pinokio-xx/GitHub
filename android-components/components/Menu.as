﻿package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import com.greensock.*;
	
	public class Menu extends Sprite 
	{
		private var _items:Array = null;
		
		public function Menu( items:Array ) 
		{
			super();
			_items = items;
			addEventListener( Event.ADDED_TO_STAGE, doAdded );
		}

		private function five():void
		{
			var item:MenuItem = null;
			
			div2.visible = false;
			div3.visible = false;
			div4.visible = false;
			div5.visible = true;
			div6.visible = false;
			
			item = new MenuItem( _items[0].path, _items[0].label, 157 );
			item.x = 3;
			item.y = 3;
			item.addEventListener( MouseEvent.CLICK, doItemClick );
			addChild( item );
			
			item = new MenuItem( _items[1].path, _items[1].label, 157 );
			item.x = 161;
			item.y = 3;
			item.addEventListener( MouseEvent.CLICK, doItemClick );
			addChild( item );			
			
			item = new MenuItem( _items[2].path, _items[2].label, 158 );
			item.x = 319;
			item.y = 3;
			item.addEventListener( MouseEvent.CLICK, doItemClick );
			addChild( item );						
			
			item = new MenuItem( _items[3].path, _items[3].label, 236 );
			item.x = 3;
			item.y = 102;
			item.addEventListener( MouseEvent.CLICK, doItemClick );
			addChild( item );									
			
			item = new MenuItem( _items[4].path, _items[4].label, 237 );
			item.x = 240;
			item.y = 102;
			item.addEventListener( MouseEvent.CLICK, doItemClick );
			addChild( item );												
		}

		private function four():void
		{
			var item:MenuItem = null;
			
			div2.visible = false;
			div3.visible = false;
			div4.visible = true;
			div5.visible = false;
			div6.visible = false;
			
			item = new MenuItem( _items[0].path, _items[0].label, 236 );
			item.x = 3;
			item.y = 3;
			item.addEventListener( MouseEvent.CLICK, doItemClick );
			addChild( item );
			
			item = new MenuItem( _items[1].path, _items[1].label, 237 );
			item.x = 240;
			item.y = 3;
			item.addEventListener( MouseEvent.CLICK, doItemClick );
			addChild( item );			
			
			item = new MenuItem( _items[2].path, _items[2].label, 236 );
			item.x = 3;
			item.y = 102;
			item.addEventListener( MouseEvent.CLICK, doItemClick );
			addChild( item );						
			
			item = new MenuItem( _items[3].path, _items[3].label, 237 );
			item.x = 240;
			item.y = 102;
			item.addEventListener( MouseEvent.CLICK, doItemClick );
			addChild( item );									
		}

		private function one():void
		{
			var item:MenuItem = null;
			
			div2.visible = false;
			div3.visible = false;
			div4.visible = false;
			div5.visible = false;
			div6.visible = false;
			
			item = new MenuItem( _items[0].path, _items[0].label, 474 );
			item.x = 3;
			item.y = 3;
			item.addEventListener( MouseEvent.CLICK, doItemClick );
			addChild( item );
		}
		
		private function six():void
		{
			var item:MenuItem = null;
			
			div2.visible = false;
			div3.visible = false;
			div4.visible = false;
			div5.visible = false;
			div6.visible = true;
			
			item = new MenuItem( _items[0].path, _items[0].label, 157 );
			item.x = 3;
			item.y = 3;
			item.addEventListener( MouseEvent.CLICK, doItemClick );
			addChild( item );
			
			item = new MenuItem( _items[1].path, _items[1].label, 157 );
			item.x = 161;
			item.y = 3;
			item.addEventListener( MouseEvent.CLICK, doItemClick );
			addChild( item );			
			
			item = new MenuItem( _items[2].path, _items[2].label, 158 );
			item.x = 319;
			item.y = 3;
			item.addEventListener( MouseEvent.CLICK, doItemClick );
			addChild( item );						
			
			item = new MenuItem( _items[3].path, _items[3].label, 157 );
			item.x = 3;
			item.y = 102;
			item.addEventListener( MouseEvent.CLICK, doItemClick );
			addChild( item );									
			
			item = new MenuItem( _items[4].path, _items[4].label, 157 );
			item.x = 161;
			item.y = 102;
			item.addEventListener( MouseEvent.CLICK, doItemClick );
			addChild( item );												
			
			item = new MenuItem( _items[5].path, _items[5].label, 158 );
			item.x = 319;
			item.y = 102;
			item.addEventListener( MouseEvent.CLICK, doItemClick );
			addChild( item );															
		}		
		
		private function three():void
		{
			var item:MenuItem = null;
			
			div2.visible = false;
			div3.visible = true;
			div4.visible = false;
			div5.visible = false;
			div6.visible = false;
			
			item = new MenuItem( _items[0].path, _items[0].label, 157 );
			item.x = 3;
			item.y = 3;
			item.addEventListener( MouseEvent.CLICK, doItemClick );
			addChild( item );
			
			item = new MenuItem( _items[1].path, _items[1].label, 157 );
			item.x = 161;
			item.y = 3;
			item.addEventListener( MouseEvent.CLICK, doItemClick );
			addChild( item );			
			
			item = new MenuItem( _items[2].path, _items[2].label, 158 );
			item.x = 319;
			item.y = 3;
			item.addEventListener( MouseEvent.CLICK, doItemClick );
			addChild( item );						
		}		
		
		private function two():void
		{
			var item:MenuItem = null;
			
			div2.visible = true;
			div3.visible = false;
			div4.visible = false;
			div5.visible = false;
			div6.visible = false;
			
			item = new MenuItem( _items[0].path, _items[0].label, 236 );
			item.x = 3;
			item.y = 3;
			item.addEventListener( MouseEvent.CLICK, doItemClick );
			addChild( item );
			
			item = new MenuItem( _items[1].path, _items[1].label, 237 );
			item.x = 240;
			item.y = 3;
			item.addEventListener( MouseEvent.CLICK, doItemClick );
			addChild( item );			
		}		

		protected function doAdded( event:Event ):void
		{
			y = 763;
			visible = false;
			
			switch( _items.length )
			{
				case 1:
					one();
					break;					
				case 2:
					two();
					break;					
				case 3:
					three();
					break;										
				case 4:
					four();
					break;															
				case 5:
					five();
					break;																				
				case 6:
					six();
					break;																									
			}
			
			stage.addEventListener( KeyboardEvent.KEY_DOWN, doMenuCheck );
		}
		
		protected function doItemClick( event:MouseEvent ):void
		{
			var dispatch:MenuEvent = null;
			
			TweenMax.to( this, 0.35, {
				y: 763,
				visible: false
			} );
			
			dispatch = new MenuEvent( MenuEvent.CLICK );
			dispatch.label = MenuItem( event.currentTarget ).label;
			
			dispatchEvent( dispatch );
		}
		
		protected function doMenuCheck( event:KeyboardEvent ):void
		{
			var dest:Number = 661;
			
			if( event.keyCode == 95 )
			{
				event.preventDefault();
				
				visible = true;
				
				if( y != 763 )
				{
					dest = 763;
				} else {
					if( _items.length > 3 )
					{
						dest = 562;
					}					
				}
				
				TweenMax.to( this, 0.35, {
					y: dest		
				} );
			}
		}
	}
}
