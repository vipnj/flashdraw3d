This library is designed to implement the same features as the 2D drawing API. Except in 3D.

So usage would be :

var g3d = new Graphics3D(this);

g3d.lineStyle(1,0xff0000,1);
g3d.moveTo(0,0,0);
g3d.lineTo(100,0,0);

etc...