package  MarioGame
{
	
	import mx.collections.ArrayList;
	
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;	
	
	/**
	 * @author Dennis hernández Vargas - djhvscf
	 * @usage Jugaodr principal usado por el usuario
	 */
	
	public class JugadorPrincipal extends Jugador
	{		
		public var ATACAR:String = "Attack";
		public var BRINCAR:String = "Jump";
		
		public var IZQUIERDA:String;
		public var DERECHA:String;
		public var ARRIBA:String;
		public var ABAJO:String;
		
		public var listaMovimientos:Array;
		public var keyJump:String;
		public var keyAttack:String;
		
		/**
		 * Crea el JugadorPrincipal
		 * @param	p_x			Ubicación
		 * @param	p_y			Ubicación
		 * @param	p_graphic	Que se crear en la ubicaciones especificadas
		 * @param	p_health	Salud o "vida" pdel jugador para iniciar el juego
		 */
		public function JugadorPrincipal(p_x:Number=0, p_y:Number=0, p_graphic:Class=null, p_health:uint=100)
		{
			super(p_x, p_y, p_graphic, p_health);
			listaMovimientos = new Array;						
			IZQUIERDA = "LEFT";
			DERECHA = "RIGHT";
			ARRIBA = "UP";
			ABAJO = "DOWN";
			
			keyJump = "Z";
			keyAttack = "X";
		}
		
		
		/**
		 * Agega un nuevo movimiento al jugador
		 * @param	p_NombreMovimiento		Nombre del movimiento
		 * @param	p_tecla					Tecla para ejecutar ese movimiento
		 */
		public function agregarNuevoMovimiento(p_NombreMovimiento:String, p_tecla:String):void
		{
			listaMovimientos.push(p_NombreMovimiento);
		}	
		
		/**
		 * Actualiza el comportamiento del jugador
		 */
		override protected function updateLogic():void
		{	
			if(_atacando)
			{
				if(!_saltando)
				{
					velocity.x = 0;
					velocity.y = 0;
				}
				return;
			}
			
			if(!_saltando)
			{
				_animacion = "";
				velocity.x = 0;
				velocity.y = 0;
			}
			
			if(FlxG.keys.pressed(DERECHA))
			{
				velocity.x = _velocidad;
				_facing = RIGHT;
			}
			else if(FlxG.keys.pressed(IZQUIERDA))
			{
				velocity.x = -_velocidad;
				_facing = LEFT;
			}
			
			if(FlxG.keys.pressed(ARRIBA))
			{
				velocity.y = -_velocidad;
				_facing = UP;
			}
			else if(FlxG.keys.pressed(ABAJO))
			{
				velocity.y = _velocidad;
				_facing = DOWN;
			}
			
			if(FlxG.keys.justPressed(keyJump) && !_saltando)
			{
				_jumpY = y;
				_saltando = true;
				_animacion = "jump";
			}
			
			if(FlxG.keys.justPressed(keyAttack) && !_atacando)
			{
				_atacando = true;
				_animacion = "attack"; // Default
				width += 20;
			}
		}
		
		/**
		 * Actualiza la posición del jugador
		 */
		override protected function updateMotion():void
		{
			var point:FlxPoint;
			
			point = getScreenXY();
			
			if(point.x+offset.x <= 0 && velocity.x < 0)
			{
				velocity.x = 0;
			}
			else if (point.x-offset.x >= FlxG.height && velocity.x > 0)
			{
				velocity.x = 0;
			}
			
			super.updateMotion();
		}		
	}
}