%{
function to parse the path to a test file
%}

function [data_directory,in_nl,fr_nl,shape,amplitude,time_scaling] = scanf_test_file_path(test_file_path,dir_params)
    % '%s/%s-%s/%s-%g-%g.csv'
    [data_directory,remain] = strtok(test_file_path,'/');
    [tmp,remain] = strtok(remain(2:end),'-');
    in_nl = find(tmp==dir_params.inl_names)-1;
    [tmp,remain] = strtok(remain(2:end),'/');
    fr_nl = find(tmp==dir_params.fnl_names)-1;
    [shape,remain] = strtok(remain(2:end),'-');
    % next elements need to be formattetd
    [tmp,remain] = strtok(remain(2:end),'-');
    amplitude = sscanf(tmp,'%f');
    [tmp,remain] = strtok(remain(2:end),'c'); % the dot here creates confusion
    tmp = tmp(1:end-1); % remove the dot of the file extension
    time_scaling = sscanf(tmp,'%f');
    
    if ~strcmp(remain, 'csv')
        disp('ERROR -- scan_test_file_path: in parsing testfile name')
    end
end