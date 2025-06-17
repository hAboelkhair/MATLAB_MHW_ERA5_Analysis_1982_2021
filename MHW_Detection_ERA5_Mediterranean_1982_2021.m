
% FIRST, YOU MUST TRANSFERE THIS SCRIPT INTO D:\Ocean\Data

%% An example about how to apply m_mhw to real-world data
% Here we provide an example about how to apply m_mhw to real-world data.

%% 1. Loading .mat file data
addpath D:\Ocean\Data
load ERA5.mat
sst_full=temp
sst_full1=sst_full(:,:,732:end); % to remove the first two years 1980 and 1981 (=731 time)

% This data includes SST in [147-155E, 45-37S] in resolution of 0.25 from
% 1982 to 2016.
lat = ncread('D:\Ocean\Data\ERA5-mediterranean_1980-2021.nc','lat');
lon = ncread('D:\Ocean\Data\ERA5-mediterranean_1980-2021.nc','lon');

lon_used=lon;
lat_used=lat;
i=2021

% Add detect.m script 
addpath D:\Ocean\Data\m_mhw1.0-master\

%load('lon_and_lat');
size(sst_full1); %size of data
datenum(2021,12,31)-datenum(1982,1,1)+1 % The temporal length is 40 years.
i=2021

%% 2. Detecting MHWs and MCSs

% Here we detect marine heatwaves off eastern Tasmania based on the
% traditional definition of MHWs (Hobday et al. 2016). We detected MHWs
% during 1993 to 2016 for climatologies and thresholds in 1982 to 2005.

[MHW,mclim,m90,mhw_ts]=detect(sst_full1,datenum(1982,1,1):datenum(2021,12,31),datenum(1982,1,1),datenum(2021,12,31),datenum(1982,1,1),datenum(2021,12,31));; %take about 30 seconds.
save ('MHW_p_1982_2021.mat', 'MHW', 'mclim', 'm90', 'mhw_ts', '-v7.3')


%% 4. Mean states and trends

% Please note that this section requires the toolbox m_map

% Now we would like to know the mean states and annual trends of MHW
% frequency, i.e. how many MHW events would be detected per year and how it
% changes with time.

[mean_freq,annual_freq,trend_freq,p_freq]=mean_and_trend(MHW,mhw_ts,1982,'Metric','Frequency');

% These four outputs separately represent the total mean, annual mean,
% annual trend and associated p value of frequency.

% This function could detect mean states and trends for six different
% variables (Frequency, mean intensity, max intensity, duration and total
% MHW/MCs days). 

metric_used={'Frequency','MeanInt','MaxInt','CumInt','Duration','Days'};

for i=1:6;
    eval(['[mean_' metric_used{i} ',annual_' metric_used{i} ',trend_' metric_used{i} ',p_' metric_used{i} ']=mean_and_trend(MHW,mhw_ts,1982,' '''' 'Metric' '''' ',' 'metric_used{i}' ');'])
end
save p_1982_2021Main mean_Frequency mean_MeanInt mean_MaxInt mean_CumInt mean_Duration mean_Days
save p_1982_2021MainTrend trend_Frequency trend_MeanInt trend_MaxInt trend_CumInt trend_Duration trend_Days
save p_1982_2021MainAnnual annual_Frequency annual_MeanInt annual_MaxInt annual_CumInt annual_Duration annual_Days
save p_1982_2021Mainp p_Frequency p_MeanInt p_MaxInt p_CumInt p_Duration p_Days
