%%
clear all
path='C:\Users\Lsk\Desktop\RGB_N\matlab\��ȡ����\masks';%����ָ��������,��Ϊ�ҰѶ�ֵ�����ͼ�񶼱�������mat��
files=dir(fullfile(path, strcat('*', '.png')));
for i = 1:length(files)
%     Process_data= size(Z(i).imageCroped,2);
%     if Process_data == 6  %�������������6ʱ������ִ��
        srcName = files(i).name;
        I=imread(fullfile(path, srcName));
        %I = Z(i).btnimage{1,1};%����ͼ��  ��һ���ǹؼ��������ڴ˳���������޸ģ�����ת���ɶ�ֵ����ͼƬ
        BW = im2bw(I, graythresh(I));%ת����2����ͼ��
        BW=~BW;
        [B,L] = bwboundaries(BW,'noholes');%Ѱ�ұ�Ե����������
        mid_arug = cell(length(B),2);
     for k = 1:length(B)%B ÿ�����Ӧ�ı߽�����
         boundary = B{k}; %boundary��ʾ���е���������,Ϊ�˽�ʡ�ڴ棬����ȡ��1/4
         x_coordinate =  boundary(1:4:end,2);%ÿ����߽�ĺ�����
         y_coordinate =  boundary(1:4:end,1);
         mid_arug{k,1} = {boundary(1:4:end,2)};
         mid_arug{k,2} = {boundary(1:4:end,1)};
     end
     assignin('base',['img_',num2str(i)],mid_arug);
%      save(['H:/' '/' ['img_',num2Rstr(i)] '.mat'],'mid_arug');
     save(['C:\Users\Lsk\Desktop\RGB_N\matlab\��ȡ����\coordinate2\' srcName(1:end-4) '.mat'],'mid_arug');
%     end
end
