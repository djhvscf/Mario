package  MarioGame
{
	/**
	 * ...
	 * @author Dennis
	 */
	public class ImplementacionVida implements PiezaImplementacion
	{		
		override public function update():void
		{
			super.update();
			
			for each(var p:FlxObject in MarioFRG.currentLevel.members)
			{
				if(p is Jugador && !dead && Jugador(p).overlapsWithZ(this))
				{
					logic(Jugador(p));					
					return;
				}
			}
		}
		
	}

}