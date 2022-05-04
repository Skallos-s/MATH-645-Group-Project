% Convert an jpg into a Mat file for (image conversion to plotted points)
function res = jpg2Mat(filename, threshold)
    % Generate the image format into a point format
    fname = split(filename, '.');
    fname_tail = string(fname(2,1));
    P = imread(filename);
    Pout = Jpeg2pointsConverter(P,threshold);

    % Manage Namedefinitions
    fnameout = string(fname(1,1));

    % Save and load points into output
    if isfile(fnameout + ".mat") == 0
        disp("Saving File to " + fnameout + ".mat")
        save(fnameout, 'Pout');
    else
        disp("File " + fnameout + ".mat exists")
    end
    fnameout = fnameout + ".mat";
    res = load(fnameout).Pout;
end