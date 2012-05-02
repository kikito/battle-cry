
public function moveObject(object:GameObject, moveDirX:int, moveDirY:int, speed:Number):void {

            var corners:Object = this.getCorners(object.x + moveDirX*speed,object.y + moveDirY*speed, object);

            if(moveDirY < 0) {
                if(!corners.topLeft.solid && !corners.topRight.solid) {
                    object.y += moveDirY*speed;
                } else {
                    object.y = object.yTile*game.tileH+object.halfHeight+1;
                }
            } else if(moveDirY > 0) {
                if(!corners.bottomLeft.solid && !corners.bottomRight.solid) {
                    object.y = object.y + moveDirY*speed;
                } else {
                    object.y = (object.yTile+1)*game.tileH-object.halfHeight-1;
                }
            }

            if(moveDirX < 0) {
                if(!corners.bottomLeft.solid && !corners.topLeft.solid) {
                    object.x = object.x + moveDirX*speed;
                } else {
                    object.x = object.xTile*game.tileW+object.halfWidth+1;
                }
            } else if(moveDirX > 0) {
                if(!corners.topRight.solid && !corners.bottomRight.solid) {
                    object.x = object.x + moveDirX*speed;
                } else {
                    object.x = (object.xTile+1)*game.tileW-object.halfWidth-1;
                }
            }

            object.xTile = this.getXTilesFromX(object.x);
            object.yTile = this.getYTilesFromY(object.y);
        }
