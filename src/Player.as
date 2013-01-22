/**
 * Created with IntelliJ IDEA.
 * User: maxfrank
 * Date: 20.01.13
 * Time: 17:01
 * To change this template use File | Settings | File Templates.
 */
package
{
    import flash.geom.Point;

    import starling.display.Image;
    import starling.display.Sprite;

    public class Player extends Sprite
    {
        private var image:Image;
        private var _velocity:Number=0;
        private var _acceleration:Number=0;

        public function Player()
        {
            image = new Image(Assets.getTexture("Player"));
            pivotX = 128;
            pivotY = 128;
            addChild(image);
        }

        public function getPosition():Point{
            return new Point(x, y);
        }

        public function update(timeElapsed:Number):void
        {
            if(this.y > Game.waterLevel)
            {
                this._velocity*=0.95;
                this._acceleration=(Game.waterLevel-this.y)*20;
            }

            if(this.y < Game.waterLevel)
            {
                this._acceleration = 1000;
            }

            this._velocity += (this._acceleration*timeElapsed);
            this.y += (this._velocity*timeElapsed);

        }
    }
}
