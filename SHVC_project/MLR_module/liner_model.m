%多元线性拟合模型
clear all
clc
format long g  %不用科学计数法
a=textread('data.txt');

% for k=1:3
    
x=a(:,2:end);  %特征
x=x(:,[1,2,4])
y=a(:,1); %bitrate
%生成测试集的可能组合


num_index=1:19;
combine=nchoosek(num_index,4);
[n,m]=size(combine);
min_error=1000
%遍历所以的可能
R_top5=-25:-21 
min_R=100
max_R=0
 for i=1:n
    val_index=combine(i,:);
    train_index=setdiff(num_index,val_index);
    x_train=x(train_index,:);
    x_val=x(val_index,:);
    y_train=y(train_index);
    y_val=y(val_index);
    
    %中心化
    x_train_norm=(x_train-mean(x_train))./std(x_train);
    y_train_norm=(y_train-mean(y_train))./std(y_train);

    x_val_norm=(x_val-mean(x_train))./std(x_train);
    y_val_norm=(y_val-mean(y_train))./std(y_train);   
    %多元线性拟合
    b=regress(y_train_norm,x_train_norm);
    %拟合结果
    y_train_norm_fit=x_train_norm*b;
    y_val_norm_fit=x_val_norm*b;
    y_val_fit=y_val_norm_fit*std(y_train)+mean(y_train);
    y_train_fit=y_train_norm_fit*std(y_train)+mean(y_train);
    error_value(i)=mean(abs(y_val_fit-y_val)./y_val);  %测试误差
    %计算R方
    y_mean=mean(y_val);
    SSE=sum((y_val_fit-y_val).^2);
    SSR=sum((y_val_fit-y_mean).^2);
    SST=sum((y_val-y_mean).^2);
    R=1-SSE/SST;
    R_result(i)=R;
   
    [R_top5_min,R_top_min_index]=min(R_top5);
    if R>R_top5_min
        R_top5(R_top_min_index)=R;
%         R_top5_10(k,:)=R_top5;
        R_top5_val(R_top_min_index,:)=y_val;
        R_top5_fit(R_top_min_index,:)=y_val_fit;
        R_top5_b(R_top_min_index,:)=b;
    end

    %保存最小误差的数据、修改为最小R方
    
     if   R>=max_R
        max_R=R;
        Rmax_val_index=val_index;
        Rmax_train_index=train_index;
        Rmax_b=b;
        Rmax_x_train_norm=x_train_norm;
        Rmax_y_train_norm=y_train_norm;
        Rmax_y_train_norm_fit= y_train_norm_fit;
        Rmax_x_val_norm=x_val_norm;
        Rmax_y_val_norm=y_val_norm;
        Rmax_y_val_norm_fit=y_val_norm_fit;
        Rmax_y_val_fit=y_val_fit;
        Rmax_y_train=y_train;
        Rmax_y_train_fit=y_train_fit;   
        Rmax_residual=abs(Rmax_y_val_fit-y(Rmax_val_index));
        Rmax_y_val=y(Rmax_val_index);
        Rmax_error= error_value;
    end
     
 end
 
 


R_top5=sort(R_top5,2,'descend')
media=median(R_result,2)
A=find((R_result>0)&(R_result<1));
media_left=median(R_result(A));
pecent=size(A)/size(R_result)
error_value=roundn(error_value,-4) ;

% end

% figure(1);
% plot([Rmax_y_train_norm,Rmax_y_train_norm_fit])
% 
% figure(2)
% plot([Rmax_y_val_norm,Rmax_y_val_norm_fit])
% legend('Normed-y-val','Fitted-normed-y-val')

