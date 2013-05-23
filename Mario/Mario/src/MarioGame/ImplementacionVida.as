package  MarioGame
{
	/**
	 * @author Dennis Hernández Vargas - djhvscf
	 * @usage Implementación de vida
	 */
	public class ImplementacionVida implements PiezaImplementacion
	{		
		
		/**
		 * Actualiza
		 */
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