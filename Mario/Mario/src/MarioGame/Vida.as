package  MarioGame
{
	import org.flixel.FlxObject;
	
	/**
	 * ...
	 * @author Dennis
	 */
	
	public class Vida implements Pieza
	{
		private PiezaImplementacion objPiezaImplementacion = new ImplementacionVida();
		
		public function Vida(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(X, Y, SimpleGraphic);
		}
		
		protected function logic(p:Jugador):void
		{
		}
		
		override public function update():void
		{
			objPiezaImplementacion.update();
		}
		
	}

}

		