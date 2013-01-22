/**
 * Created with IntelliJ IDEA.
 * User: maxfrank
 * Date: 22.01.13
 * Time: 13:10
 * To change this template use File | Settings | File Templates.
 */
package
{
    import starling.display.Image;
    import starling.display.Sprite;

    public class Shot extends Sprite
    {
        private var image:Image;

        public static var ammunition:Vector.<Shot>;

        public function Shot()
        {
            image = new Image(Assets.getTexture("Fire"));
            addChild(image);
            ammunition.push(this);
        }

        public function shoot():void
        {
            if (this.x >= stage.stageWidth)
            {
                stage.removeChild(this);
                ammunition.splice(ammunition.indexOf(this), 1);
            }
            else
                this.x += 10;

        }
    }
}
