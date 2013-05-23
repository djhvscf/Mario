package MarioGame 
{
	
	import flash.geom.Point;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	/**
	 * @author Dennis Hernández Vargas - djhvscf
	 * @usage Muestra la pantalla de juego perdido y termina el juego actual
	 */
	
	public class JuegoPerdido extends FlxState
	{
		
		/**
		 * Crea la pantalla
		 */
		override public function create():void
		{
			super.create();
			var a:FlxSprite = new FlxSprite();
			a.createGraphic(FlxG.width, FlxG.height, 0);
			var textJuegoPerdido:FlxText = new FlxText(180, 140, 300, "Has perdido");
			textJuegoPerdido.setFormat("system", 40);
			var textJuegoOtra:FlxText = new FlxText(230, 200, 200, "Presione ENTER para intentarlo de nuevo.");
			textJuegoOtra.alignment = "center";
			add(textJuegoPerdido);
			add(textJuegoOtra);
		}
		
		/**
		 * Actualiza la pantalla
		 */
		override public function update():void
		{
			super.update();
			if(FlxG.keys.justPressed("ENTER"))
				FlxG.state = new PersonalizaJuego();
		}
	}
}