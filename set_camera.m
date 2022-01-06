function set_camera()

% Setup modelview matrix: This defines the position, orientation and
% looking direction of the virtual camera:

gluLookAt(...
    10,10,10,...
    0,0,0,...
    0,1,0);

end % function
