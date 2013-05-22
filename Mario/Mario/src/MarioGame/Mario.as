package MarioGame 
{
	
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	/**
	 * ...
	 * @author Dennis
	 */
	public class Mario extends JugadorPrincipal
	{
		
		[Embed(source="data\\marioSpriteFinal3.png")]
		protected var _imgMario:Class;
		[Embed(source="data\\punch.mp3")]
		protected var _hit:Class;
		[Embed(source="data\\kick.mp3")]
		protected var _kick:Class;
		[Embed(source="data\\win.mp3")]
		protected var _winSound:Class;
		
		public function Mario(p_x:Number=0, p_y:Number=0)
		{
			super(p_x, p_y, null, 200);
		
			loadGraphic(_imgMario, true, false,20,30);
			
			_anchoOriginal = width = 5;
			_largoOriginal = height = 100;
			offset.x = 30;
			offset.y = 30;
			_dano = 10;
			
			keyJump = "Z";
			keyAttack = "X";
			
			addAnimation("idle", [15,14], 4);
			addAnimation("left", [0,1], 12);
			addAnimation("right", [6,7], 12);
			addAnimation("jump", [6,11,6], 4, false);
			
			addAnimation("attack", [13,5,8,13,5,8,13,5,8,13,5,8,13,5,8,13,5,8], 6, false);
			addAnimation("punch", [13,5,8,13,5,8,13,5,8,13,5,8,13,5,8,13,5,8], 10, false);
			addAnimation("lowKick", [16,17,16,17,16,17,16,17,16,17,16,17,16,17,16,17,16,17,16,17,16,17], 10, false);
			
			addAnimation("hit", [8,9,8,9,8,9,8,9,9,8,9,8,9,8,9,8,9,8,9,8,9,8,9,8,9,8,9,8,9,8,9,8,9,8,9,8,9,8], 12, false);
			addAnimation("win", [9], 12, false);
		}
		
		protected function attack(p_animationNumber:uint):void
		{
			if(p_animationNumber == 2)
			{
				var func:Function = function():void {
					FlxG.play(_hit);
					_jump_delay = true;
					if(FlxG.keys[keyAttack])
					{
						_animacion = "punch";
					}
				}
				
				atacarJugadores(_dano, func, "JugadorEnemigo");
			}
			
			if(p_animationNumber >= 3)
			{
				cancelAttack();
			}
		}
		
		protected function punch(p_animationNumber:uint):void
		{
			if(p_animationNumber == 2 || p_animationNumber == 4)
			{
				var func:Function = function():void {
					FlxG.play(_hit);
					_jump_delay = true;
					if(FlxG.keys[keyAttack] && p_animationNumber == 4)
					{
						_animacion = "lowKick";
					}
				}
				
				atacarJugadores(_dano, func, "JugadorEnemigo");
			}
			
			if(p_animationNumber >= 6)
			{
				cancelAttack();
			}
		}
		
		protected function lowKick(p_animationNumber:uint):void
		{
			if(p_animationNumber == 3)
			{
				var func:Function = function():void {
					FlxG.play(_kick);
					_jump_delay = true;
				}
				
				atacarJugadores(_dano, func, "JugadorEnemigo");
			}
			
			if(p_animationNumber >= 5)
			{
				cancelAttack();
			}
		}
				
		protected function gettingHit(p_animationNumber:uint):void
		{
			if(p_animationNumber >= 2)
			{
				disable = false;
			}
		}
		
		protected function win(p_animationNumber:uint):void
		{
			if(p_animationNumber == 0)
			{
				FlxG.music.destroy();
				FlxG.play(_winSound);
			}
			else if(p_animationNumber >= 38)
			{
				FlxG.state = new Menu();
			}
		}
		
		override protected function actuarLogica(p_animationName:String, p_animationNumber:uint, p_animationIndex:uint):void
		{
			switch(p_animationName)
			{
				case "attack":
					attack(p_animationNumber);
					break;
				case "punch":
					punch(p_animationNumber);
					break;
				case "lowKick":
					lowKick(p_animationNumber);
					break;
				case "hit":
					gettingHit(p_animationNumber);
					break;
				case "win":
					win(p_animationNumber);
					break;
			}
		}
		
		override protected function updateLogic():void
		{
			super.updateLogic();
		}
		
		override public function hurt(Damage:Number):void
		{
			super.hurt(Damage);
			_animacion = "hit";
			disable = true;
			cancelAttack();
		}
	}
}