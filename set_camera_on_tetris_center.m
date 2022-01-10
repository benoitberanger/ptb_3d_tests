function set_camera_on_tetris_center(segments, distance)

cam_center = barycenter(segments); % local function, see below

gluLookAt(...
    cam_center(1)+distance,cam_center(2)+distance,cam_center(3)+distance,...
    cam_center(1),cam_center(2),cam_center(3),...
    0,1,0);

end % function

function coords = barycenter(segments)

% empty array that will contain the middle point of each segement
middles = NaN(size(segments));

nSegment = size(segments,1);

for iSegment = 1 : nSegment
    
    seg = segments(iSegment,:); % curent segement
    
    if iSegment == 1
        start_point = [0 0 0];
    else
        % start_point is simply the sum of each previous displacement
        start_point = sum(segments(1:(iSegment-1),:));
    end
    
    middles(iSegment,:) = start_point + seg/2;
    
end

weights = abs(sum(segments,2)); % the weigth is the length of each segment
coords = sum( middles.*weights ) / sum(weights); % weigted sum

end