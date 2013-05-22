package MarioGame 
{
	
	import flash.events.KeyboardEvent;
	import MarioGame.*;
	import org.flixel.FlxG;
	import org.flixel.*;
	import org.flixel.FlxGame;
	
	/**
	 * ...
	 * @author Dennis Hernández Vargas
	 * @usage Inicia el juego y muesta el menú de inicio
	 */
	
	public class InicioJuego extends FlxGame
	{
		
		[SWF(width = "1000", height = "600", backgroundColor = "#000000")]
	
		public function InicioJuego()
		{
			super(1000, 600, Menu, 1);
		}
	}
}