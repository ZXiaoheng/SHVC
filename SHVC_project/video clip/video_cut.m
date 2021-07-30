%1、把所有的长视频YUV文件放在一个文件下
% 2、把Path_01的路径修改为YUV文件路径
% 3、修改N的值


clear all
Path_01 = 'E:\zeng\ffmpeg_code_test\';                   % 设置数据存放的文件夹路径File = dir(fullfile(Path_01,'*.ti'));  % 显示文件夹下所有符合后缀名为.txt文件的完整信息
N=10 %每小段视频的帧数

file_video=[Path_01 'video']
file_pic=[Path_01 'pic']
mkdir(file_video)
mkdir(file_pic)

File = dir(fullfile(Path_01,'*.yuv'));
FileNames = {File.name}           % 提取符合后缀名为.txt的所有文件的文件名，转换为n行1列
len = size(FileNames,2)

for k=1:len
    path_video = strcat(Path_01, FileNames(k))
    file_child=dir(path_video{1,1})
    size=file_child.bytes
    frame=size/(1920*1080*1.5)
    clip_N=floor(frame/N)
    
    file_video_child=[file_video '/' num2str(k)]
    file_pic_child=[file_pic '/clip' num2str(k)]
    mkdir(file_video_child)
    mkdir(file_pic_child)
    file_downfilter=[Path_01 'downfilter']
    mkdir(file_downfilter)
    cmd_line_down=['ffmpeg -s 1920x1080 -y -i ' path_video{1,1} ' -vf scale=640:360,setsar=1:1 ' file_downfilter '/360p_' FileNames{1,k} ' -hide_banner'] %ffmpeg -s 3840x1920 -i erp.yuv -vf scale=1920:1080,setsar=1:1 1080.yuv -hide_banner
    system(cmd_line_down)
    
    for j=1:clip_N
        
        path_clip=[file_video_child '/' num2str(j) '.yuv']
        cmd_line_video = ['ffmpeg -s 1920x1080 -y -i ' path_video{1,1} ' -c:v rawvideo -filter:v select="between(n\, ' num2str(1+(j-1)*N) '\, '  num2str(j*N) ')" ' path_clip] %ffmpeg -s 1920x1080 -i input.yuv -c:v rawvideo -filter:v select="between(n\, 10\, 50)" trip_test.yuv
        system(cmd_line_video)
        path_pic_child_child=[file_pic_child '/sequence' num2str(j)]
        mkdir( path_pic_child_child)
        cmd_line_pic = ['ffmpeg -s 1920x1080 -y -i ' path_clip ' -q:v 2 -f image2 ' path_pic_child_child '/%04d.png'] %ffmpeg -i "haircut.avi" -r 25 -q:v 2 -f image2 %d.png
        system(cmd_line_pic)
        
    end
    %data(:,k)=textread(path_pic{1,1},'%.4f');
    
   
%     I=imread(path_pic{1,1});
end