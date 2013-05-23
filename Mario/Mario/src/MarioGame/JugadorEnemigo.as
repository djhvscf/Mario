package  MarioGame
{
	
	import org.flixel.FlxG;
	import org.flixel.FlxU;
	
	/**
	 * @author Dennis Hernández Vargas - djhvscf
	 * @usage Jugador enemigo con el que el usuario luchara en el juego
	 */
	
	public class JugadorEnemigo extends Jugador
	{
		
		protected var _attackDelay:uint;
		protected var _delay:uint;
		
		/**
		 * Crea el jugador enemigo
		 * @param	p_x			Ubicación
		 * @param	p_y			Ubicación
		 * @param	p_graphic	Objeto que se creara en la posiciones especificadas
		 * @param	p_health	"Vida" con la que inicia el jugador enemigo
		 */
		public function JugadorEnemigo(p_x:Number=0, p_y:Number=0, p_graphic:Class=null, p_health:uint=100)
		{
			super(p_x, p_y, p_graphic, p_health);
		}
		
		override protected function updateLogic():void
		{
			var _jugador:Jugador = MarioFRG.players[0] as Jugador;
			
			velocity.x = 0;
			velocity.y = 0;
			
			if (_jugador == null || _atacando || dead || disable) 
			{		
				return;
			}
			
			if (_delay < _attackDelay) 
			{				
				_delay++;
			}
			
			if (x+(width/2) < _jugador.x)
			{
				velocity.x = _velocidad;
			}
			else if (x > _jugador.x+(_jugador.width/2))
			{
				velocity.x = -_velocidad;
			}
			
			if (y+height < _jugador.y+_jugador.height)
			{
				velocity.y = _velocidad;
			}
			else if (y+height > _jugador.y+_jugador.height)
			{
				velocity.y = -_velocidad;
			}
			
			if(x+(width/2) > _jugador.x && x < _jugador.x+(_jugador.width/2) && _delay >= _attackDelay)
			{
				_atacando = true;
				_animacion = "attack";
				_attackDelay = 50;
			}
			else
			{
				_animacion = "";
			}
		}
	}
}