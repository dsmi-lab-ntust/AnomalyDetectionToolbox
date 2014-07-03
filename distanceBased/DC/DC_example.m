% Note the parameter refers origin code from
% http://www.cs.ucr.edu/~eamonn/selected_publications.htm

[C, C_index, C_dist] = DC('../DC_data/lightcurves/TS', 2, '.txt', 10, 10);

for i = 1:size(C,1)
    figure;
    plot(C(i,:), 'b', 'LineWidth', 2);
    title(['Discord #' num2str(i) ' Indx=' num2str(C_index(i)) ' NNDist=' num2str(C_dist(i))]);
end;