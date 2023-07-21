function varargout = project_org(varargin)
% PROJECT_ORG MATLAB code for project_org.fig
% PROJECT_ORG, by itself, creates a new PROJECT_ORG or raises the existing
% singleton*.
%
% H = PROJECT_ORG returns the handle to a new PROJECT_ORG or the handle to
% the existing singleton*.
%
% PROJECT_ORG('CALLBACK',hObject,eventData,handles,...) calls the local
% function named CALLBACK in PROJECT_ORG.M with the given input arguments.
%
% PROJECT_ORG('Property','Value',...) creates a new PROJECT_ORG or raises the
% existing singleton*. Starting from the left, property value pairs are
% applied to the GUI before project_org_OpeningFcn gets called. An
% unrecognized property name or invalid value makes property application
% stop. All inputs are passed to project_org_OpeningFcn via varargin.
%
% *See GUI Options on GUIDE's Tools menu. Choose "GUI allows only one
% instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
% Edit the above text to modify the response to help project_org
% Last Modified by GUIDE v2.5 12-Jun-2023 12:19:43
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name', mfilename, ...
 'gui_Singleton', gui_Singleton, ...
'gui_OpeningFcn', @project_org_OpeningFcn, 
...
 'gui_OutputFcn', @project_org_OutputFcn, 
...
 'gui_LayoutFcn', [] , ...
 'gui_Callback', []);
if nargin && ischar(varargin{1})
 gui_State.gui_Callback = str2func(varargin{1});
end
if nargout
 [varargout{1:nargout}] = gui_mainfcn(gui_State, 
varargin{:});
else
 gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
% --- Executes just before project_org is made visible.
function project_org_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject handle to figure
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
% varargin command line arguments to project_org (see VARARGIN)
% Choose default command line output for project_org
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes project_org wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% --- Outputs from this function are returned to the command line.
function varargout = project_org_OutputFcn(hObject, eventdata, handles) 
% varargout cell array for returning output args (see VARARGOUT);
% hObject handle to figure
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Executes on button press in subplot.
function subplot_Callback(hObject, eventdata, handles)
% hObject handle to subplot (see GCBO)
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
% absPath = get(handles.edit2,'string');
% t = load(absPath);
[file,path] = uigetfile('*.*','select the "manu"file');
if isequal(file,0)
 disp('no file selected');
 return;
end
fullfilepath= fullfile(path,file);
t= load(fullfilepath);
figure;
v1=t(:,1)
v2=t(:,2)
v3=t(:,3)
v4=t(:,4)
v5=t(:,5)
% v5=t(:,6)
% v5=t(:,7)
subplot(4,1,1)
plot(v1,v2);
qq=plot(v1,v2,'r')
grid on
xlabel('{Time(msec)}')
ylabel({'V1 V2X(Hz)'})
title('Vibration')
hold on
subplot(4,1,2)
plot(v1,v3);
ww=plot(v1,v3,'b')
xlabel({'Time(msec)'})
ylabel({'V2 V2Y(Hz)'})
hold on
subplot(4,1,3)
plot(v1,v4);
ee=plot(v1,v4,'green')
xlabel({'Time(msec)'})
ylabel({'V3 V2Z(Hz)'})
hold on
subplot(4,1,4)
plot(v1,v5);
rr=plot(v1,v5,'yellow')
xlabel({'Time(msec)'})
ylabel({'V4 V1Y(Hz)'})
% --- Executes on button press in combineplot.
function combineplot_Callback(hObject, eventdata, handles)
% hObject handle to combineplot (see GCBO)
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
% absPath = get(handles.edit2,'string');
% t = load(absPath);
[file,path] = uigetfile('*.*','select the "manu"file');
if isequal(file,0)
 disp('no file selected');
 return;
end
fullfilepath= fullfile(path,file);
t = load(fullfilepath);
figure;
v1=t(:,1)
v2=t(:,2)
v3=t(:,3)
v4=t(:,4)
v5=t(:,5)
plot(v1,v2)
qq=plot(v1,v2,'r')
grid on
xlabel('{Time(msec)}')
ylabel({'(Hz)'})
title('Vibration')
hold on
 
plot(v1,v3)
ww=plot(v1,v3,'b')
hold on
plot(v1,v4)
ee=plot(v1,v4,'green')
hold on
plot(v1,v5)
rr=plot(v1,v5,'yellow')
legend([qq,ww,ee,rr],'V1 V2X','V2 V2Y','V3 V2Z','V4 V1Y')
% --- Executes on button press in plot.
function plot_Callback(hObject, eventdata, handles)
% hObject handle to plot (see GCBO)
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('*.*','select the "manu"file');
if isequal(file,0)
 disp('no file selected');
 return;
end
fullfilepath = fullfile(path,file);
para_file = load(fullfilepath);
[row,col]=size(para_file);
for i=2:col
figureTitle = strcat('Parameter:',num2str(i));
figurex = strcat('Time:',num2str(i));
figurey = strcat('y:',num2str(i));
figure( 'Name',figureTitle);
filteredCol = medfilt1(para_file(:,i),10);
plot(filteredCol)
xlabel({figurex});
ylabel({figurey});
title({figureTitle});
grid on;
end
% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject handle to pushbutton7 (see GCBO)
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('*.*','select the "manu"file');
if isequal(file,0)
 disp('no file selected');
 return;
end
fullfilepath= fullfile(path,file);
t = load(fullfilepath);
figure;
v1=t(:,1)
v2=t(:,2)
v3=t(:,3)
v4=t(:,4)
v5=t(:,5)
scatter(v1,v2);
scatter(v1,v3);
scatter(v1,v4);
scatter(v1,v5);
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject handle to pushbutton5 (see GCBO)
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('*.*','select the "manu"file');
if isequal(file,0)
 disp('no file selected');
 return;
end
fullfilepath= fullfile(path,file);
t = load(fullfilepath);
figure;
v1=t(:,1)
v2=t(:,2)
v3=t(:,3)
v4=t(:,4)
v5=t(:,5)
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject handle to pushbutton6 (see GCBO)
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('*.*','select the "manu"file');
if isequal(file,0)
 disp('no file selected');
 return;
end
fullfilepath= fullfile(path,file);
t = load(fullfilepath);
figure;
v1=t(:,1)
v2=t(:,2)
v3=t(:,3)
v4=t(:,4)
v5=t(:,5)
[X,Y] = meshgrid(1:0.5:10,1:20);
surf(X,Y,v2,v3,v4,v5);
