﻿package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.geom.Point;

	public class List extends Sprite 
	{
		private var moved:Boolean = false;
		private var candidate:ListItem = null;
		private var created:Number = 0;
		private var total:Number = 0;
		private var elements:Sprite = null;
		private var masking:Sprite = null;
		
		public function List() 
		{
			super();
			addEventListener( Event.ADDED_TO_STAGE, doAdded );
		}

		protected function doAdded( event:Event ):void
		{
			while( numChildren > 0 )
			{
				removeChildAt( 0 );
			}
			
			masking = new Sprite();
			addChild( masking );
			
			elements = new Sprite();
			elements.mask = masking;
			addChildAt( elements, 0 );
		}

		/*
			* アイテムを表示させる範囲を決める
		*/
		protected function doItemAdded( event:Event ):void
		{
			var measure:Number = 0;
			
			created = created + 1;
			
			if( created == total )
			{
				measure = ( elements.numChildren * 97 ) - 1;
				
				if( measure > 625 )
				{
					measure = 625;
				}
				
				masking.graphics.clear();
				masking.graphics.lineStyle( 1, 0x00FF00, 0 );
				masking.graphics.beginFill( 0x00FF00 );
				masking.graphics.drawRoundRectComplex( 0, 0, 435, measure, 0, 0, 4, 4 );
				masking.graphics.endFill();

				dispatchEvent( new ListEvent( ListEvent.RENDERED ) );
			}
		}
		
		protected function doItemClick( event:MouseEvent ):void
		{
			var dispatch:ListEvent = null;
			
			if( !moved )
			{
				dispatch = new ListEvent( ListEvent.CLICK, true );
				dispatch.label = ListItem( event.currentTarget ).label;
				dispatch.data = ListItem( event.currentTarget ).data;
				dispatch.index = elements.getChildIndex( ListItem( event.currentTarget ) );
				
				dispatchEvent( dispatch );				
			} else {
				moved = false;
			}
		}
		
		protected function doItemDown( event:MouseEvent ):void
		{
			candidate = event.currentTarget as ListItem;
			
			stage.addEventListener( MouseEvent.MOUSE_MOVE, doMouseMove );
			stage.addEventListener( MouseEvent.MOUSE_UP, doMouseUp );
		}
		
		protected function doMouseMove( event:MouseEvent ):void
		{
			moved = true;
			candidate.reset();
			
			elements.startDrag( false, new Rectangle( 0, 0, 0, 0 - ( elements.height - 625 ) ) );
		}

		protected function doMouseUp( event:MouseEvent ):void
		{
			var items:Array = getObjectsUnderPoint( new Point( event.stageX, event.stageY ) );
			
			elements.stopDrag();
			
			stage.removeEventListener( MouseEvent.MOUSE_MOVE, doMouseMove );
			stage.removeEventListener( MouseEvent.MOUSE_UP, doMouseUp );
		}

		public function get items():Array
		{
			var result:Array = new Array();
			var item:ListItem = null;
			
			for( var c:Number = 0; c < numChildren; c++ )
			{
				item = getChildAt( c ) as ListItem;
				result.push( item.label );
			}
			
			return result;
		}
		
		public function set items( value:Array ):void
		{
			var item:ListItem = null;
			var measure:Number = 0;
			
			created = 0;
			
			if( value == null )
			{
				total = 0;
			} else {
				total = value.length;
			}
			
			while( elements.numChildren > 0 )
			{
				elements.removeChildAt( 0 );					
			}
			
			elements.y = 0;
			
			if( value != null )
			{
				for( var i:Number = 0; i < value.length; i++ )
				{
					item = new ListItem( value[i] );
					item.y = i * 97;
					item.addEventListener( Event.ADDED_TO_STAGE, doItemAdded );
					item.addEventListener( MouseEvent.CLICK, doItemClick );
					
					measure = ( value.length * 97 ) - 1;
					
					if( measure > 625 )
					{
						item.addEventListener( MouseEvent.MOUSE_DOWN, doItemDown );
					}
					
					elements.addChildAt( item, 0 );
				}							
			}
		}
	}	
}
