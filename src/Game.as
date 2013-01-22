/**
 * Created with IntelliJ IDEA.
 * User: maxfrank
 * Date: 20.01.13
 * Time: 16:57
 * To change this template use File | Settings | File Templates.
 */
package
{
    import flash.geom.Point;

    import starling.display.Image;

    import starling.display.Sprite;
    import starling.events.EnterFrameEvent;
    import starling.events.Event;
    import starling.events.Touch;
    import starling.events.TouchEvent;
    import starling.events.TouchPhase;

    public class Game extends Sprite
    {
        private static const GAME_BOUNDS:int = 700;
        private static const TOUCH_RADIUS:int = 80;

        public static var waterLevel:int;

        private var image:Image;

        private var _ebenen:Array;
        private var _player:Player;
        private var _movingPlayerID:int = -1;

        public function Game()
        {
            image = new Image(Assets.getTexture("Background"));
            addEventListener(Event.ADDED_TO_STAGE, init);
        }

        private function init(event:Event):void
        {
            addChild(image);

            _ebenen = new Array();
            var schrittweite:int = GAME_BOUNDS/7;
            for(var i:int = 0; i<6; i++)
                _ebenen[i] = schrittweite*i+100;
            waterLevel = _ebenen[3];

            _player = new Player();
            _player.x = 128;
            _player.y = _ebenen[3];
            addChild(_player);

            addEventListener(Event.ENTER_FRAME, tick);
            addEventListener(TouchEvent.TOUCH, handleInput);
        }

        private function handleInput(e:TouchEvent):void
        {
            var initTouches:Vector.<Touch> = e.getTouches(this, TouchPhase.BEGAN);
            for (var i:int = 0; i < initTouches.length; i++)
                if ( initTouches[i].getLocation(parent).subtract(_player.getPosition()).length < TOUCH_RADIUS)
                {
                    _movingPlayerID = initTouches[i].id;
                    if(_player.y >waterLevel)
                        removeEventListener(Event.ENTER_FRAME,tick);
                }


            //Handle moves
            var touches:Vector.<Touch> = e.getTouches(this, TouchPhase.MOVED);
            for (var j:int = 0; j < touches.length; j++)
                if (touches[j].id == _movingPlayerID)
                {
                    var delta:Point = touches[j].getMovement(parent);

                    if(_player.y + delta.y >= waterLevel || delta.y > 0)
                        _player.y += delta.y;

                }

            //Handle end touch
            var endingTouches:Vector.<Touch> = e.getTouches(this, TouchPhase.ENDED);
            for (var k:int = 0; k < endingTouches.length; k++)
                if (endingTouches[k].id == _movingPlayerID)
                {
                    _movingPlayerID = -1;
                    addEventListener(Event.ENTER_FRAME,tick);
                }
        }

        private function tick(event:EnterFrameEvent):void
        {
            _player.update(event.passedTime);
        }
    }
}
