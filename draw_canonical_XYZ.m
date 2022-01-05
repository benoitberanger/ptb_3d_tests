function draw_canonical_XYZ()
global GL

% X
glBegin(GL.LINES);
glMaterialfv(GL.FRONT_AND_BACK,GL.AMBIENT, [ 1.0 0.0 0.0 1 ]);
glMaterialfv(GL.FRONT_AND_BACK,GL.DIFFUSE, [ 1.0 0.0 0.0 1 ]);
glMaterialfv(GL.FRONT_AND_BACK,GL.SPECULAR,[ 1.0 0.0 0.0 1 ]);
glVertex3f(0.0, 0.0, 0.0);
glVertex3f(1.0, 0.0, 0.0);
glEnd();

% Y
glBegin(GL.LINES);
glMaterialfv(GL.FRONT_AND_BACK,GL.AMBIENT, [ 0.0 1.0 0.0 1 ]);
glMaterialfv(GL.FRONT_AND_BACK,GL.DIFFUSE, [ 0.0 1.0 0.0 1 ]);
glMaterialfv(GL.FRONT_AND_BACK,GL.SPECULAR,[ 0.0 1.0 0.0 1 ]);
glVertex3f(0.0, 0.0, 0.0);
glVertex3f(0.0, 1.0, 0.0);
glEnd();

% Z
glBegin(GL.LINES);
glMaterialfv(GL.FRONT_AND_BACK,GL.AMBIENT, [ 0.0 0.0 1.0 1 ]);
glMaterialfv(GL.FRONT_AND_BACK,GL.DIFFUSE, [ 0.0 0.0 1.0 1 ]);
glMaterialfv(GL.FRONT_AND_BACK,GL.SPECULAR,[ 0.0 0.0 1.0 1 ]);
glVertex3f(0.0, 0.0, 0.0);
glVertex3f(0.0, 0.0, 1.0);
glEnd();

end % function
