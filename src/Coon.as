/**
 * Created with IntelliJ IDEA.
 * User: maxfrank
 * Date: 22.01.13
 * Time: 11:06
 * To change this template use File | Settings | File Templates.
 */
package
{
    import starling.display.Image;

    public class Coon extends Enemy
    {
        private var image:Image;

        public function Coon(x:int, ebene:int)
        {
            super(x, ebene);
            speed = 5;
            lifePoints = 5;
            image = new Image(Assets.getTexture("SpermditImage"));
            addChild(image);
        }
    }
}
