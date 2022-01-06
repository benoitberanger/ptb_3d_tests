function set_camera_on_tetris_center(segments)

% nSegment = size(segments,1);

cam_center = mean(segments,1);

distance = 15;

gluLookAt(...
    cam_center(1)+distance,cam_center(2)+distance,cam_center(3)+distance,...
    cam_center(1),cam_center(2),cam_center(3),...
    0,1,0);

end