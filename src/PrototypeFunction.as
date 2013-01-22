package {

import flash.display.Sprite;

    import starling.core.Starling;

    [SWF(width="1280", height="800", frameRate="60", backgroundColor="#222222")]
    public class PrototypeFunction extends Sprite
    {
        public var _starling:Starling;
        public function PrototypeFunction()
        {
            _starling = new Starling(Game, stage);
            _starling.start();
        }
    }
}
