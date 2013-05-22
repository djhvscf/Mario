package MarioGame 
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	
	/**
	 * ...
	 * @author Dennis
	 */
	
	public class EstadoJuego extends FlxState
	{
		
		protected var _jugadores:Array;
		protected var _nivel:Nivel;
		
		public function get nivel():Nivel
		{
			return _nivel;
		}
		
		public function get jugadores():Array
		{
			return _jugadores;
		}
		
		override public function create():void
		{
			FlxG.mouse.hide();
			_jugadores = new Array();
		}
				
		protected function actualizarNivel():void
		{
			_nivel.actualizarNivel();
			_nivel.revisarEventos();
		}
		
		override public function update():void
		{
			super.update();
			actualizarNivel();
		}
		
		/**
		 * Controla el proceso de renderizado
		 */
		override public function render():void
		{
			super.render();
			_nivel.renderNivelActual()
		}
	}
}