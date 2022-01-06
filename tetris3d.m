sca
clc
clear

% Is the script running in OpenGL Psychtoolbox? Abort, if not.
PsychDefaultSetup(1);

ESCAPE = KbName('ESCAPE');

% OpenGL
InitializeMatlabOpenGL();

% PTB opening screen will be empty = black screen
Screen('Preference', 'VisualDebugLevel', 1);

% Open window
screenid=1;
[win , winRect] = Screen('OpenWindow', screenid, 0 , [],  [], [], [], 4);

% Setup the OpenGL rendering context of the onscreen window for use by
% OpenGL wrapper. After this command, all following OpenGL commands will
% draw into the onscreen window 'win':
Screen('BeginOpenGL', win);

% Get the aspect ratio of the screen:
AspectRatio=winRect(4)/winRect(3);

% Setup default drawing color to yellow (R,G,B)=(1,1,0). This color only
% gets used when lighting is disabled - if you comment out the call to
% glEnable(GL.LIGHTING).
glColor3f(1,1,0);


% Turn on OpenGL local lighting model: The lighting model supported by
% OpenGL is a local Phong model with Gouraud shading. The color values
% at the vertices (corners) of polygons are computed with the Phong lighting
% model and linearly interpolated accross the inner area of the polygon from
% the vertex colors. The Phong lighting model is a coarse approximation of
% real world lighting with ambient light reflection (undirected isotropic light),
% diffuse light reflection (position wrt. light source matters, but observer
% position doesn't) and specular reflection (ideal mirror reflection for highlights).
%
% The model does not take any object relationships into account: Any effects
% of (self-)occlusion, (self-)shadowing or interreflection of light between
% objects are ignored. If you need shadows, interreflections and global illumination
% you will either have to learn advanced OpenGL rendering and shading techniques
% to implement your own realtime shadowing and lighting models, or
% compute parts of the scene offline in some gfx-package like Maya, Blender,
% Radiance or 3D Studio Max...
%
% If you want to do any shape from shading studies, it is very important to
% understand the difference between a local lighting model and a global
% illumination model!!!
glEnable(GL.LIGHTING);

% % Disable two-sided lighting - Back sides of polygons are **NOT** lit.
% glLightModelfv(GL.LIGHT_MODEL_TWO_SIDE,GL.TRUE);
% glLightModelfv(GL.LIGHT_MODEL_LOCAL_VIEWER,GL.TRUE);

% glShadeModel( GL.SMOOTH );
% glEnable(GL.NORMALIZE);

% Enable proper occlusion handling via depth tests:
glEnable(GL.DEPTH_TEST);

% Set background clear color to 'black' (R,G,B,A)=(0,0,0,0):
glClearColor(0,0,0,0);

% Set projection matrix: This defines a perspective projection,
% corresponding to the model of a pin-hole camera - which is a good
% approximation of the human eye and of standard real world cameras --
% well, the best aproximation one can do with 3 lines of code ;-)
glMatrixMode(GL.PROJECTION);
glLoadIdentity;

% Field of view is 25 degrees from line of sight. Objects closer than
% 0.1 distance units or farther away than 100 distance units get clipped
% away, aspect ratio is adapted to the monitors aspect ratio:
gluPerspective(25,1/AspectRatio,0.1,100);

reset_position();

% Enable the first local light source GL.LIGHT_0. Each OpenGL
% implementation is guaranteed to support at least 8 light sources,
% GL.LIGHT0, ..., GL.LIGHT7
glEnable(GL.LIGHT0);

glLightfv(GL.LIGHT0, GL.DIFFUSE , [1 1 1]);
glLightfv(GL.LIGHT0, GL.AMBIENT , [1 1 1]);
glLightfv(GL.LIGHT0, GL.SPECULAR, [1 1 1]);

% LIGHT0
light_pos_0 = [100 100 100];
light_is_point = 0;
glLightfv(GL.LIGHT0,GL.POSITION,[ light_pos_0 light_is_point]);


%% Start drawing

% Clear out the backbuffer: This also cleans the depth-buffer for
% proper occlusion handling: You need to glClear the depth buffer whenever
% you redraw your scene, e.g., in an animation loop. Otherwise occlusion
% handling will screw up in funny ways...
glClear;

draw_canonical_XYZ()

% First tetris on the LEFT side of the screen
reset_position();

% set_camera();

segments = [
     0  0 +2
     0 -3  0
    +2  0  0
     0  0 -3
     0 +2  0
    ];


set_camera_on_tetris_center(segments);
draw_3d_tetris(segments);




%% End of Drawing

% Finish OpenGL rendering into PTB window. This will switch back to the
% standard 2D drawing functions of Screen and will check for OpenGL errors.
Screen('EndOpenGL', win);

% imageArray = Screen('GetImage', win , [], 'backBuffer' );
% imagesc(imageArray)
% drawnow


% Show rendered image at next vertical retrace:
Screen('Flip', win);

KbWait;

% Begin OpenGL rendering into onscreen window again:
Screen('BeginOpenGL', win);


while 1
    
    [keyIsDown, secs, keyCode] = KbCheck();
    if keyIsDown
        if keyCode(ESCAPE)
            break
        end
    end
    
end

% End of OpenGL rendering...
Screen('EndOpenGL', win);

% Close onscreen window and release all other ressources:
sca;
