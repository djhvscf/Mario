package MarioGame 
{
	/**
	 * ...
	 * @author Dennis
	 * @usage 
	 */
	
	import flash.display.Sprite;
	import org.flixel.FlxG;
	import org.flixel.FlxSound;
	import org.flixel.FlxSprite;
	import MarioGame.BarraVida;
	
	public class nivelMonta extends Nivel
	{
		[Embed(source="data\\background.png")]
		protected var _bg:Class;
		[Embed(source="data\\mario.mp3")]
		protected var _bgMario:Class;
		[Embed(source="data\\final.mp3")]
		protected var _final:Class;
		
		public function nivelMonta()
		{
			super(_bg, 543, 543);
		}
		
		override public function create():void
		{
			FlxG.followBounds(10, 50, _background.width, 460);
						
			var _evento:EventoNivel;
			var _pieza:Pieza;
						
			_pieza = new Pieza(800, 0);
			_pieza.createGraphic(50, _background.height, 0x0);
			_evento = new EventoNivel(primerEvento, null, _pieza);
			agregarEvento(_evento);			
						
			_pieza = new Pieza(1500, 0);
			_pieza.createGraphic(50, _background.height, 0x0);
			_evento = new EventoNivel(luigiEvent, null, _pieza);
			agregarEvento(_evento);			
						
			var luigi:Jugador = new Luigi(400,250);
			add(luigi);
			add(new BarraVida(luigi));
			
			luigi = new Luigi(380,430);
			add(luigi);
			add(new BarraVida(luigi));
			
			luigi = new Luigi(120,500);
			add(luigi);
			add(new BarraVida(luigi));
						
			FlxG.playMusic(_bgMario, 0.35);
						
		}
		
		public function primerEvento(e:EventoNivel, p:Jugador):Boolean
		{
			if (p == null)
			{
				return false;
			}
						
			var luigi:Jugador = new Luigi(1000,250);
			add(luigi);
			add(new BarraVida(luigi));
			
			luigi = new Luigi(980,430);
			add(luigi);
			add(new BarraVida(luigi));
			
			luigi = new Luigi(1020, 500);
			add(luigi);
			add(new BarraVida(luigi));
			
			//luigi = new Luigi(1070, 500);
			//add(luigi);
			//add(new BarraVida(luigi));
			//
			//luigi = new Luigi(1020, 500);
			//add(luigi);
			//add(new BarraVida(luigi));
			//
			//luigi = new Luigi(1060, 500);
			//add(luigi);
			//add(new BarraVida(luigi));
			
			//luigi = new Luigi(1050, 500);
			//add(luigi);
			//add(new BarraVida(luigi));
			//
			//luigi = new Luigi(1040, 500);
			//add(luigi);
			//add(new BarraVida(luigi));
			//
			//luigi = new Luigi(1030, 500);
			//add(luigi);
			//add(new BarraVida(luigi));

			return true;
		}
		
		public function luigiEvent(e:EventoNivel, p:Jugador):Boolean
		{
			if (p == null) 
			{
				return false;
			}
			
			FlxG.playMusic(_final, 0.4);
			FlxG.followBounds(p.x-10, 60, _background.width, 460);
						
			for each(var _jugador:Jugador in MarioFRG.players)
			{
				_jugador.animate();
			}					
			return true;
		}
		
		public function onLuigiDead(p:Jugador):void
		{
			for each(var _jugador:Jugador in MarioFRG.players)
			{
				_jugador.animate("win");
			}
		}
	}
}