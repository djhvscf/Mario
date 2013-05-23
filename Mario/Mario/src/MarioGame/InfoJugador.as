package MarioGame 
{
	
	import flash.geom.Point;
	import flash.text.TextField;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	
	/**
	 * @author Dennis Hernández Vargas - djhvscf
	 * @usage Mantiene la información del jugador
	 */
	
	public class InfoJugador extends FlxGroup
	{
		protected var _textoVida:FlxText;
		protected var _barraVida:FlxSprite;
		
		/**
		 * Crea la información del jugador
		 * @param	p_jugadores		Jugadores para agregar al nivel
		 */
		public function InfoJugador(p_jugadores:Array)
		{
			super();
			
			var _jugador:JugadorPrincipal = p_jugadores[0];
			_textoVida = new FlxText(90, 11, 40, String(_jugador.health));
			_textoVida.alignment = "center";
			_textoVida.scrollFactor = _pZero;
			
			var _vidaBase:FlxSprite = new FlxSprite(10, 10);
			_vidaBase.createGraphic(196, 16);
			_vidaBase.color = 0x0A0A85;
			_vidaBase.alpha = 0.4;
			_vidaBase.scrollFactor = _pZero;
			
			_barraVida = new FlxSprite(12, 12);
			_barraVida.createGraphic(192, 12);
			_barraVida.color = 0xFF0000;
			_barraVida.alpha = 0.7;
			_barraVida.scrollFactor = _pZero;
			
			//Agregar a la pantalla objetos "extra"
			add(_vidaBase);
			add(_barraVida);
			add(_textoVida);
		}
						
		override public function update():void
		{
			actualizarJugadores();
			super.update();
		}
		
		protected function actualizarJugadores():void
		{
			var _barra:Number = 192;
			var _jugador:Jugador = MarioFRG.players[0] as Jugador;
			var percent:Number;
			
			percent = (_jugador.health / _jugador._vidaMax) * 100;
			
			if (percent != 0) 
			{	
				_barraVida.createGraphic((_barra/100)*percent, 12, 0xB3FF0000);
			}
			else 
			{
				_barraVida.createGraphic(10, 12, 0x0);
			}
			_textoVida.text = String(_jugador.health);
		}
	}
}