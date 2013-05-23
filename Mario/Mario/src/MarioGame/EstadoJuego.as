package MarioGame 
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	
	/**
	 * @author Dennis Hernández Vargas - djhvscf
	 * @usage Mantiene el estado del juego
	 */
	
	public class EstadoJuego extends FlxState
	{
		
		protected var _jugadores:Array;
		protected var _nivel:Nivel;
		
		/**
		 * Retorna el nivel
		 */
		public function get nivel():Nivel
		{
			return _nivel;
		}
		
		/**
		 * Retorna los jugadores del nivel
		 */
		public function get jugadores():Array
		{
			return _jugadores;
		}
		
		/**
		 * Crea el nivel
		 */
		override public function create():void
		{
			FlxG.mouse.hide();
			_jugadores = new Array();
		}
				
		/**
		 * Actualiza el nivel
		 */
		protected function actualizarNivel():void
		{
			_nivel.actualizarNivel();
			_nivel.revisarEventos();
		}
		
		/**
		 * Actualza el nivel
		 */
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