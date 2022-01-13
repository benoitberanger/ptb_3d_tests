function draw_3d_tetris(segments)
global GL

glPushMatrix();
glMaterialfv(GL.FRONT_AND_BACK,GL.AMBIENT, [ 0.2 0.2 0.2 1 ]);
glMaterialfv(GL.FRONT_AND_BACK,GL.DIFFUSE, [ 0.5 0.5 0.5 1 ]);
glMaterialfv(GL.FRONT_AND_BACK,GL.SHININESS, 30);
glMaterialfv(GL.FRONT_AND_BACK,GL.SPECULAR,[ 0.5 0.5 0.5 1 ]);
draw_cubes(segments,'solid',1.0)
glPopMatrix();

glPushMatrix();
glMaterialfv(GL.FRONT_AND_BACK,GL.AMBIENT, [ 0.0 0.0 0.0 1 ]);
glMaterialfv(GL.FRONT_AND_BACK,GL.DIFFUSE, [ 0.0 0.0 0.0 1 ]);
glMaterialfv(GL.FRONT_AND_BACK,GL.SPECULAR,[ 0.0 0.0 0.0 1 ]);
draw_cubes(segments,'wired',1.002)
glPopMatrix();


end % function

function draw_cubes(segments, type, dim)

switch type
    case 'solid'
        fcn = @glutSolidCube;
    case 'wired'
        fcn = @glutWireCube;
end

nSegment = size(segments,1);

for iSegment = 1 : nSegment
    
    seg = segments(iSegment,:);
    nDisplacement = sum(seg);
    nDisplacement = abs(nDisplacement);
    seg = seg/nDisplacement;
    
    if iSegment == 1
        fcn(dim)
        nDisplacement = nDisplacement -1;
    end
    for n = 1 : nDisplacement
        glTranslatef(seg(1),seg(2),seg(3)) % move
        fcn(dim)                           % draw
    end
    
end

end % function
