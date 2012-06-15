package  
{
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.events.MouseEvent;
	
	public class Components extends Sprite 
	{
		private var cmb:ComboBox = null;
		private var cmb2:ComboBox = null;
		private var listing:ListPicker = null;
		private var listing2:ListPicker = null;
		
		private var btn:Button = null;
		private var chk:CheckBox = null;
		private var day:DatePicker = null;
		private var ftr:Footer = null;
		private var lbl:Label = null;
		private var opt:OptionPicker = null;
		private var time:TimePicker = null;
		private var mnu:Menu = null;
		private var tme:Button = null;
		private var ttl:Title = null;
		private var txt:TextInput = null;
		
		private var arr:Array = [
						   {label:"A", data:"100"},
						   {label:"B", data:"200"},
						   {label:"C", data:"200"},
						   {label:"D", data:"200"},
						   {label:"E", data:"200"},
						   {label:"F", data:"200"},
						   {label:"G", data:"200"},
						   {label:"H", data:"200"},
						   {label:"I", data:"200"},
						   {label:"J", data:"200"},
						   {label:"K", data:"300"}
						   ];
		
		public function Components() 
		{
			super();
			init();
		}
		
		private function init():void
		{
			
			var btnx:Button = null;
			var lblx:Label = null;
			var today:String = DateDialog.formatShort( new Date() );
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			ttl = new Title( "Event details" );
			addChild( ttl );
			
			lbl = new Label( "What" );
			lbl.x = 9;
			lbl.y = 52;
			addChild( lbl );
			
			txt = new TextInput( "Event name" );
			txt.x = 9;
			txt.y = 85;
			addChild( txt );
			
			lblx = new Label( "From" );
			lblx.x = 9;
			lblx.y = 170;
			addChild( lblx );
			
			btn = new Button( today, 282, Button.TRIGGER );
			btn.x = 14;
			btn.y = 203;
			btn.addEventListener( MouseEvent.CLICK, doDateClick );
			addChild( btn );
			
			tme = new Button( "1:00pm", 158, Button.TRIGGER );
			tme.x = 306;
			tme.y = 203;
			tme.addEventListener( MouseEvent.CLICK, doTimeClick );
			addChild( tme );			
			
			lblx = new Label( "To" );
			lblx.x = 9;
			lblx.y = 276;
			addChild( lblx );
			
			btnx = new Button( today, 282, Button.TRIGGER );
			btnx.x = 14;
			btnx.y = 309;
			addChild( btnx );
			
			btnx = new Button( "2:00pm", 158, Button.TRIGGER );
			btnx.name = "to";
			btnx.x = 306;
			btnx.y = 309;
			addChild( btnx );			
			
			chk = new CheckBox();
			chk.x = 416;
			chk.y = 396;
			chk.addEventListener( MouseEvent.CLICK, doCheckClick );
			addChild( chk );
			

			
			ftr = new Footer( "Done", "Revert" );
			ftr.y = 680;
			addChild( ftr );
			
			mnu = new Menu( [
				{path: "search.png", label: "One"},
				{path: "search.png", label: "Two"},
				{path: "search.png", label: "Three"},
				{path: "search.png", label: "Four"},
				{path: "search.png", label: "Five"},
				{path: "search.png", label: "Six"}
			] );
			mnu.addEventListener( MenuEvent.CLICK, doMenuClick );
			addChild( mnu );
			
			day = new DatePicker();
			day.addEventListener( DialogEvent.OK, doDateOk );
			day.addEventListener( DialogEvent.CANCEL, doDialogCancel );
			addChild( day );
			
			time = new TimePicker();
			time.addEventListener( DialogEvent.OK, doTimeOk );
			time.addEventListener( DialogEvent.CANCEL, doDialogCancel );
			addChild( time );			
			
			
			cmb = new ComboBox( "Home" );
			cmb.x = 823;
			cmb.y = 39;
			cmb.addEventListener( MouseEvent.CLICK, doComboClick );
			//addChild( cmb );
			
			cmb2 = new ComboBox( "Work" );
			cmb2.x = 13;
			cmb2.y = 487;
			cmb2.addEventListener( MouseEvent.CLICK, doComboClick2 );
			//addChild( cmb2 );
			
			
			listing = new ListPicker();
			listing.addEventListener( ListEvent.CLICK, doListingClick );
			addChild( listing );
			
			listing2 = new ListPicker();
			listing2.addEventListener( ListEvent.CLICK, doListingClick2 );
			addChild( listing2 );
		}
		

		
		protected function doComboClick( event:MouseEvent ):void
		{
			listing.show( arr,
						   "LIST NAME"
						);
		}
		
		protected function doComboClick2( event:MouseEvent ):void
		{
			listing2.show( [{label:"10,000", data:"001"}, {label:"20,000", data:"002"}],
						   "LIST NAME"
						);
		}
		
		protected function doListingClick( event:ListEvent ):void
		{
			cmb.label = event.label;
		}
		
		protected function doListingClick2( event:ListEvent ):void
		{
			cmb2.label = event.label;
		}
		
		protected function doCheckClick( event:MouseEvent ):void
		{
			var btnx:Button = null;
			
			if( chk.selected )
			{
				tme.visible = false;
				btn.setWidth( 450 );
			} else {
				tme.visible = true;
				btn.setWidth( 282 );				
			}
		}
		
		protected function doDialogCancel( event:DialogEvent ):void
		{
			trace( "Dialog cancel." );
		}
		
		protected function doDateClick( event:MouseEvent ):void
		{
			day.show( new Date() );
		}
		
		protected function doDateOk( event:DialogEvent ):void
		{
			btn.label = DateDialog.formatShort( day.date );
		}
		
		protected function doMenuClick( event:MenuEvent ):void
		{
			trace( event.label );
		}
		
		protected function doTimeClick( event:MouseEvent ):void
		{
			time.show( new Date() );
		}
		
		protected function doTimeOk( event:DialogEvent ):void
		{
			tme.label = TimeDialog.formatShort( time.time );
		}
		
	}
}
