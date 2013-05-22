package MarioGame 
{
	import MarioGame.Jugador;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author ...
	 */
	
	public class BarraVida extends FlxSprite
	{
		protected var _objetivo:Jugador;
		protected var _vidaPas:Number;
		protected var _ancho:Number;
		
		public function BarraVida(p_objetivo:Jugador) 
		{
			//super(p_objetivo.x, p_objetivo.y - 20, null);
			_objetivo = p_objetivo;
			_vidaPas = _objetivo.health;
			//_ancho = _objetivo.width;
			//createGraphic(_ancho, 10, 0xB3FF0000);
		}
		
		override public function update():void
		{
			super.update();
			
			x = _objetivo.x;
			y = _objetivo.y - 20;
			
			if(_objetivo.health != _vidaPas)
			{
				var percent:Number = (_objetivo.health / _objetivo._vidaMax) * 100;
				
				if (percent > 0) 
				{					
					//createGraphic((_ancho/100)*percent, 10, 0xB3FF0000);
				}
				else
				{					
					kill();
				}				
				_vidaPas = _objetivo.health;
			}
		}
	}
}