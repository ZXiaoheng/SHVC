clear all
path='E:/zeng'
mkdir_video=[path '/vieo']
mkdir_pic=[path '/pic']
mkdir(mkdir_pic)
mkdir(mkdir_video)


 file=dir('E:\zeng\ffmpeg_code_test\trip.yuv')
 size=file.bytes
 frame=size/(1920*1080*1.5)
 
