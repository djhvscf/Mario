package MarioGame 
{
	
	import MarioGame.*;
	import org.flixel.FlxG;
	import org.flixel.FlxSave;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Dennis Hernández Vargas - djhvscf
	 * @usage Muestra la pantalla de creditos
	 */
	public class Credits extends FlxState
	{
		protected var info:FlxText;
		protected var credit:String;
		protected var gotoMenu:FlxButton;
		protected var gunter:FlxSprite;
		
		override public function create():void
		{
			super.create();
			
			FlxG.mouse.show();
			
			credit = "Developer: \n- Dennis Hernández (@djhvs)";
			credit += "\n\nYou can download the code in github: \ngithub.com/djhvscf/Mario";
			
			info = new FlxText(0, 0, 320);
			
			info.color = 0xffffffff;
			info.shadow = 0xff000000;
			info.text = credit;
			
			gotoMenu = new FlxButton(200, 20, backToMenuSelected);
					
			add(info);
			add(gotoMenu);
		}
		
		override public function update():void
		{
			super.update();
		}
		
		private function backToMenuSelected():void
		{
			FlxG.state = new Credits();
		}
		
	}

}