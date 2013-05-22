package MarioGame 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author Dennis
	 */
	
	public class Nivel extends FlxGroup
	{
		protected var _listaEventos:Array;
		protected var _nivelActual:FlxGroup;
		protected var _background:FlxSprite;
		protected var _tiempoInicio:uint;
		protected var _minY:Number;
		protected var _maxY:Number;
		
		public function Nivel(p_background:Class, p_minY:Number, p_maxY:Number)
		{
			_minY = p_minY;
			_maxY = p_maxY;
			_background = new FlxSprite(0, 0, p_background);
			add(_background);
			_tiempoInicio = MarioFRG.currentTime;
			_listaEventos = new Array();
			_nivelActual = new FlxGroup();
		}
		
		public function create():void{}
		
		public function get minY():Number
		{
			return _minY;
		}
		
		public function get maxY():Number
		{
			return _maxY;
		}
				
		public function revisarEventos():void
		{
			var _jugadores:Array = MarioFRG.players;
			
			for each (var _eventoNivel:EventoNivel in _listaEventos)
			{
				if (_eventoNivel == null) 
				{
					continue;
				}
								
				if(_eventoNivel._tiempoTrigger != -1)
				{
					if(MarioFRG.currentTime - _tiempoInicio >=  _eventoNivel._tiempoTrigger)
					{
						if (_eventoNivel.execute()) 
						{							
							removerEvento(_eventoNivel).finalize();
						}
					}				
				}
				
				
				if(_eventoNivel.trigger != null)
				{
					for each (var _jugador:Jugador in _jugadores)
					{
						if (_jugador.overlaps(_eventoNivel.trigger))
						{
							if (_eventoNivel.execute(_jugador)) 
							{								
								removerEvento(_eventoNivel);
							}
						}
					}
				}
			}
		}
		
		protected function getPrimerEventoNull():int
		{
			var ml:uint = _listaEventos.length;
			for(var i:uint = 0; i < ml; i++)
			{
				if(_listaEventos[i] == null)
					return i;
			}
			return -1;
		}
				
		public function agregarEvento(p_eventoNivel:EventoNivel):void
		{
			var i:uint;			
			_listaEventos.push(p_eventoNivel);
		}
		
		public function removerEvento(p_eventoNivel:EventoNivel):EventoNivel
		{
			var index:int = _listaEventos.indexOf(p_eventoNivel);
			
			if ((index < 0) || (index >= _listaEventos.length)) 
			{				
				return null;
			}
			else 
			{			
				_listaEventos[index] = null;
			}
			
			return p_eventoNivel;
		}
				
		public function actualizarNivel():void
		{
			_nivelActual.update();
		}
				
		public function renderNivelActual():void
		{
			_nivelActual.render();
		}
	}
}