package MarioGame 
{
	
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author Dennis
	 * @usage
	 */
	
	public class PersonalizaJuego extends EstadoJuego
	{
				
		override public function create():void
		{
			super.create();
			
			
			//Crea el objeto Mario que utilizara el usuario			
			var mario:Mario;
			mario = new Mario(40, 640);
			mario.ARRIBA = "UP";
			mario.ABAJO = "DOWN";
			mario.DERECHA = "RIGHT";
			mario.IZQUIERDA = "LEFT";
			mario.keyJump = "Z";
			mario.keyAttack = "X";
			
			_jugadores.push(mario); 
			
			FlxG.follow(_jugadores[0]);
			
			_nivel = new nivelMonta();
			_nivel.create();
			_nivel.add(_jugadores[0]);
			add(_nivel);
			add(new InfoJugador(_jugadores));			
		}
		
		//Muestra la pantalla de juego perdido
		override public function update():void
		{
			super.update();
			var _jugador:JugadorPrincipal = _jugadores[0] as JugadorPrincipal;
			if (_jugador.dead) 
			{			
				FlxG.state = new JuegoPerdido();
			}		
		}
	}
}