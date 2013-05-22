package MarioGame
{
	
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Dennis
	 */
	public class MarioFRG 
	{
		
		static public function get currentTime():uint
		{
			return new Date().time;
		}
		
		static public function get currentLevel():Nivel
		{
			if(FlxG.state is EstadoJuego)
			{
				return EstadoJuego(FlxG.state).nivel;
			}
			else
			{
				return null;
			}
		}
		
		static public function get players():Array
		{
			
			if(FlxG.state is EstadoJuego)
			{
				return EstadoJuego(FlxG.state).jugadores;
			}
			else
			{
				return null;
			}
		}		
	}
}