package MarioGame 
{
	
	import flash.geom.Point;	
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	
	/**
	 * @author Dennis Hernández Vargas - djhvscf
	 * @usage Caracterisricas importantes del Jugador
	 */
	
	public class Jugador extends FlxSprite
	{			
		public var disable:Boolean;
		protected var _saltando:Boolean;
		protected var _atacando:Boolean;
		protected var _jumpY:Number;
		protected var _velocidad:Number;
		protected var _velocidadSalto:Number;
		protected var _jump_delay:Boolean;		
		protected var _animacion:String;
		protected var _anchoOriginal:Number;
		protected var _largoOriginal:Number;
		protected var _dano:Number;				
		protected var _muerto:Function;		
		public var uvel:Number;
		public var _gravedad:Number;
		public var z:Number;
		public var _vidaMax:uint;
		
		/**
		 * Crea el jugador
		 * @param	p_x			Ubicación
		 * @param	p_y			Ubicación
		 * @param	p_graphic	Objetos que se creara en la pantalla
		 * @param	p_health	"Vida" con la que inicia el jugador
		 */
		public function Jugador(p_x:Number=0, p_y:Number=0, p_graphic:Class=null, p_health:uint = 100)
		{
			super(p_x, p_y, p_graphic);
			health = _vidaMax = p_health;
			uvel = velocity.y;
			_gravedad = 0.9;
			_velocidad = 230;
			_velocidadSalto = 15;
			_dano = 0;
			_anchoOriginal = width;
			_largoOriginal = height;
			addAnimationCallback(actuarLogica);
		}
		
		public function sanar(p_amount:uint):void
		{
			health += p_amount;
			
			if(health > _vidaMax)
			{
				health = _vidaMax;
			}
		}
		
		protected function actuarLogica(p_animationName:String, p_animationNumber:uint, p_animationIndex:uint):void
		{
		}
		
		//Actualiza la posición y velocidad del objeto
		override protected function updateMotion():void
		{
			var ym:Number = 0;
			
			if(disable || dead)
			{
				if (dead && _muerto != null) 
				{
					_muerto(this);
				}
				return;
			}
			
			if(_saltando)
			{
				velocity.y = 0;
			}
			
			super.updateMotion();
			
			if(_saltando && !_jump_delay)
			{
				ym -= uvel;
				uvel -= _gravedad;
				
				y += ym;
				
				if(y >= _jumpY)
				{
					y = _jumpY;
					uvel = _velocidadSalto;
					_saltando = false;
				}
			}
			else
			{
				_jump_delay = false;
				
				if(y+height < MarioFRG.currentLevel.minY)
				{
					y = MarioFRG.currentLevel.minY-height;
				}
				else if (y+height > MarioFRG.currentLevel.maxY)
				{
					y = MarioFRG.currentLevel.maxY-height;
				}
				
				z = y+height - MarioFRG.currentLevel.minY;
			}
		}
		
		protected function updateLogic():void{}
		
		protected function updatePlay():void
		{
			if(_animacion == "")
			{
				//Si el eje X el punto es mayor que 0 ->se mueve a la derecha
				if(velocity.x > 0)
				{
					_animacion = "right";
				}
				//Si el eje X el punto es menor que 0 ->se mueve a la derecha
				else if (velocity.x < 0)
				{
					_animacion = "left";
				}
				else
				{
					_animacion = "idle";
				}
			}
		}
		
		override public function update():void
		{
			super.update();
			if (!disable) 
			{				
				updateLogic();
			}
			updatePlay();
			play(_animacion);
		}
		
		protected function renderUppers():void
		{
			for each(var obj:FlxObject in MarioFRG.currentLevel.members)
			{
				if(obj.exists && obj.visible)
				{
					if(obj is Jugador)
					{
						if(z < Jugador(obj).z)
						{
							obj.render();
						}
					}
					else if(obj is Pieza)
					{
						if(z < obj.y+obj.height-MarioFRG.currentLevel.minY)
						{
							obj.render();
						}
					}
				}
			}
		}
		
		override public function render():void
		{
			super.render();
			renderUppers();
		}
		
		override public function overlaps(p_object:FlxObject):Boolean
		{
			if (x + width > p_object.x && x < p_object.x + p_object.width && y + height > p_object.y && y < p_object.y + p_object.height) 
			{			
				return true;
			}
			else 
			{			
				return false;
			}
		}
		
		public function overlapsWithZ(p_object:FlxObject, p_range:Number = 15):Boolean
		{
			var objZ:Number;
			
			if(p_object is Jugador)
			{
				objZ = Jugador(p_object).z;
			}
			else
			{
				objZ = p_object.y+p_object.height - MarioFRG.currentLevel.minY;
			}
			
			if (x + width > p_object.x && x < p_object.x + p_object.width
					&& y + height > p_object.y && y < p_object.y + p_object.height &&
					z - objZ <= p_range && z - objZ >= -p_range)
			{
				
				return true;
			}
			else 
			{				
				return false;
			}
		}
		
		public function cancelAttack():void
		{
			_atacando = false;
			width = _anchoOriginal;
			height = _largoOriginal;
		}
		
		public function animate(p_animation:String = "idle"):void
		{
			disable = true;
			_animacion = p_animation;
		}
		
		public function addOnDeadCallback(p_func:Function):void
		{
			_muerto = p_func;
		}
		
		public function atacarJugadores(p_dano:Number, p_function:Function = null, p_tipoJugador:String="Jugador"):void
		{
			for each(var p:FlxObject in MarioFRG.currentLevel.members)
			{
				if(p != this && !p.dead && overlapsWithZ(p))
				{
					var flag:Boolean = false;
					
					switch(p_tipoJugador)
					{
						case "Jugador":
							if (p is Jugador) 
							{
								flag = true;
							}
							break;
						case "JugadorPrincipal":
							if (p is JugadorPrincipal) 
							{
								flag = true;
							}
							break;
						case "JugadorEnemigo":
							if (p is JugadorEnemigo) 
							{
								flag = true;
							}
							break;
					}
					
					if(flag)
					{
						p.hurt(p_dano);
						if (p_function != null) 
						{
							p_function();
						}
					}
				}
			}
		}
	}
}