/**
 * Created with IntelliJ IDEA.
 * User: maxfrank
 * Date: 22.01.13
 * Time: 10:43
 * To change this template use File | Settings | File Templates.
 */
package
{
    import starling.display.DisplayObjectContainer;
    import starling.display.Sprite;

    // abstract class, mkay
    public class Enemy extends Sprite
    {
        public var speed:int;
        public var lifePoints:int;

        public static var enemies:Vector.<Enemy>;

        public function Enemy(x:int,  ebene:int)
        {
            this.x = x;
            this.y = (ebene-1) * 100 + 50;
        }

        /**
         * push in Vector enemies and add it to stage
         * @param stage
         */
        public function spawn(stage:DisplayObjectContainer):void
        {
            enemies.push(this);
            stage.addChild(this);
        }

        /**
         * subtract x-value of Enemy
         */
        public function move():void
        {
            this.x -= 5*speed;
        }

        public function isDead():Boolean
        {
            lifePoints--;
            return (lifePoints <= 0)
        }
    }
}
