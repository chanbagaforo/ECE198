[file,path] = uigetfile('*.wav','Select WAV file(s) to analyze',...
    'Multiselect','on'); % file select

file = string(file);
path = string(path);

if ~strcmp(file,"0") & ~strcmp(path,"0")
    for i = 1:numel(file)
            filename = [char(path) char(file(i))];

            a = mirzerocross(filename);
            b = mircentroid(filename);
            c = mirattacktime(filename);

            [~,name,~] = fileparts(file(i));
            mirexport(char(strcat(path,name,'.txt')),a,b,c);
    end
else
    disp('Analysis Cancelled')
end