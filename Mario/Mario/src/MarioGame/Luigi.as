package MarioGame 
{
	
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	/**
	 * ...
	 * @author Dennis
	 */
	public class Luigi extends JugadorEnemigo
	{
		
		[Embed(source="data\\luigiSpriteFinal.png")]
		protected var _imgLuigi:Class;
		[Embed(source="data\\sonic_boom.mp3")]
		protected var _sonicBoom:Class;
				
		public function Luigi(p_x:Number=0, p_y:Number=0)
		{
			super(p_x, p_y, null, 140);
			
			loadGraphic(_imgLuigi, true, true, 30,30);
			
			_anchoOriginal = width = 80;
			_largoOriginal = height = 100;
			offset.x = 30;
			offset.y = 30;
			_velocidad = 50;
			_dano = 20;
			
			addAnimation("idle", [1,4,5], 12,false);
			addAnimation("left", [2,3,2,3,2,3,2,3,2,3], 12);
			addAnimation("right", [6,7,6,7,6,7,6,7,6,7], 12);
			addAnimation("jump", [1,3,1,3,1,3,1,3,1,3], 4);
			addAnimation("punch", [8,9,8,9,8,9,8,9,8,9,8,9], 4,false);
			addAnimation("sonic", [1,1,1,1], 4, false);
			addAnimation("fast", [2,3,4,5,6,2,3,4,5,6], 4, false);
			addAnimation("hit", [8,9,8,9,8,9], 4, false);
			addAnimation("die", [4,5,4,5,4,5,4,5,4,5,4,5,4,5,10,11], 3, false);
		}
		
		protected function atacar(p_numeroAnimacion:uint):void
		{
			if(p_numeroAnimacion == 2)
			{
				atacarJugadores(_dano, null, "JugadorPrincipal");
			}			
			if(p_numeroAnimacion >= 4)
			{
				cancelAttack();
				_delay = 0;
			}
		}
		
		protected function sonicBoom(p_numeroAnimacion:uint):void
		{
			if(p_numeroAnimacion == 2)
			{
				atacarJugadores(_dano, null, "JugadorPrincipal");
			}
			else if(p_numeroAnimacion == 0)
			{
				FlxG.play(_sonicBoom);
			}
			
			// When to stop attacking
			if(p_numeroAnimacion >= 2)
			{
				cancelAttack();
				_delay = 0;
			}
		}
		
		protected function fastKit(p_numeroAnimacion:uint):void
		{
			if(p_numeroAnimacion == 3)
			{
				atacarJugadores(_dano, null, "JugadorPrincipal");
			}
			
			if(p_numeroAnimacion >= 5)
			{
				cancelAttack();
				_delay = 0;
			}
		}
		
		protected function gettingHit(p_numeroAnimacion:uint):void
		{
			if(p_numeroAnimacion >= 2)
			{
				disable = false;
			}
		}
		
		protected function die(p_numeroAnimacion:uint):void
		{
			if(p_numeroAnimacion >= 9)
			{
				disable = false;
				exists = false;
			}			
		}
					
		override protected function actuarLogica(p_animationName:String, p_numeroAnimacion:uint, p_animationIndex:uint):void
		{
			switch(p_animationName)
			{
				case "punch":
					atacar(p_numeroAnimacion);
					break;
				case "sonic":
					sonicBoom(p_numeroAnimacion);
					break;
				case "fast":
					fastKit(p_numeroAnimacion);
					break;
				case "hit":
					gettingHit(p_numeroAnimacion);
					break;
				case "die":
					die(p_numeroAnimacion);
					break;
			}
		}
				
		override protected function updatePlay():void
		{
			super.updatePlay();
			
			var _ataques:Array = ["punch", "fast", "sonic"];
			
			if(_animacion == "attack")
			{
				var ind:uint = Math.floor(Math.random()*3);
				_animacion = _ataques[ind];
			}
		}
		
		override public function hurt(p_dano:Number):void
		{
			super.hurt(p_dano);
			if(_animacion != "die")
			{
				_animacion = "hit";
				disable = true;
				cancelAttack();
			}
		}
		
		
		//Jugador muerto
		override public function kill():void
		{
			dead = true;
			disable = true;
			_animacion = "die";
		}		
	}
}