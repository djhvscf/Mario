package MarioGame 
{
	import MarioGame.*;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Dennis Hernández Vargas - djhvscf
	 * @usage Muestra la pantalla de menú
	 */
	
	public class Menu extends FlxState
	{
		[Embed(source="data\\title2.jpg")]
		protected var _menuInicio:Class;
		[Embed(source="data\\intro.mp3")]
		protected var _musicaIntro:Class;
		protected var _boton:FlxSprite;
		protected var credits:FlxButton;
		
		/**
		 * Aquí se crean los objetos necesarios para el inicio del juego
		 */
		override public function create():void
		{
			super.create();
			FlxG.mouse.show();
			_boton = new FlxSprite(0, 0, _menuInicio);
			credits = new FlxButton(3, 220,viewCredits);
			add(_boton);
			add(credits);
			FlxG.play(_musicaIntro);
		}
		
		/**
		 * Actualiza todo lo agregado en el juego, permite manejar colisiones
		 */
		override public function update():void
		{
			super.update();
			if (FlxG.keys.ENTER) 
			{				
				FlxG.state = new PersonalizaJuego();
			}
		}
		
		private function viewCredits():void
		{
			FlxG.state = new Credits();
		}
	}
}