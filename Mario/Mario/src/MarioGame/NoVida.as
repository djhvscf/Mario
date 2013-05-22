package  MarioGame
{
	import org.flixel.FlxObject;
	
	/**
	 * ...
	 * @author Dennis
	 */
	
	public class NoVida implements Pieza
	{
		private PiezaImplementacion objPiezaImplementacion = new ImplementacionNoVida();
		
		public function NoVida(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
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