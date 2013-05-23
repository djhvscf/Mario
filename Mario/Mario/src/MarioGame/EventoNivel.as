package MarioGame 
{
	
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	import org.flixel.FlxSprite;
	
	/**
	 * @author Dennis Hernández Vargas -djhvscf
	 * @usage Genera los eventos del nivel
	 */

	public class EventoNivel
	{

		protected var _func:Function;
		protected var _endFunc:Function;
		public var trigger:FlxSprite;
		public var _tiempoTrigger:Number;
		
		/**
		 * Crea un objeto EventoNivel
		 * @param	p_function		Funcion
		 * @param	p_endFunc		Funcion
		 * @param	p_component		Objeto del juego
		 * @param	p_time			Tiempo
		 */
		public function EventoNivel(p_function:Function, p_endFunc:Function = null, p_component:FlxSprite = null, p_time:Number = -1)
		{
			_func = p_function;
			_endFunc = p_endFunc;
			trigger = p_component;
			_tiempoTrigger = p_time;
		}
		
		
		/**
		 * Ejecuta el evento
		 * @param	p_jugador		Jugador actual a quien se le aplicara el evento
		 * @return Funcion a ejecutar
		 */
		public function execute(p_jugador:Jugador = null):Boolean
		{
			return _func(this, p_jugador);
		}
				
		/**
		 * Finaliza el evento
		 */
		public function finalize():void
		{
			if (_endFunc != null) 
			{			
				_endFunc(this);
			}
		}
	}
}