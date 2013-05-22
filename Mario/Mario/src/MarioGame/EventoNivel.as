package MarioGame 
{
	
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Dennis
	 */

	public class EventoNivel
	{

		protected var _func:Function;
		protected var _endFunc:Function;
		public var trigger:FlxSprite;
		public var _tiempoTrigger:Number;
		
		public function EventoNivel(p_function:Function, p_endFunc:Function = null, p_component:FlxSprite = null, p_time:Number = -1)
		{
			_func = p_function;
			_endFunc = p_endFunc;
			trigger = p_component;
			_tiempoTrigger = p_time;
		}
		
		public function execute(p_jugador:Jugador = null):Boolean
		{
			return _func(this, p_jugador);
		}
				
		public function finalize():void
		{
			if (_endFunc != null) 
			{			
				_endFunc(this);
			}
		}
	}
}