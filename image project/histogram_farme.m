function varargout = histogram_farme(varargin)
% HISTOGRAM_FARME MATLAB code for histogram_farme.fig
%      HISTOGRAM_FARME, by itself, creates a new HISTOGRAM_FARME or raises the existing
%      singleton*.
%
%      H = HISTOGRAM_FARME returns the handle to a new HISTOGRAM_FARME or the handle to
%      the existing singleton*.
%
%      HISTOGRAM_FARME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HISTOGRAM_FARME.M with the given input arguments.
%
%      HISTOGRAM_FARME('Property','Value',...) creates a new HISTOGRAM_FARME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before histogram_farme_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to histogram_farme_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help histogram_farme

% Last Modified by GUIDE v2.5 16-Dec-2017 15:34:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @histogram_farme_OpeningFcn, ...
                   'gui_OutputFcn',  @histogram_farme_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before histogram_farme is made visible.
function histogram_farme_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to histogram_farme (see VARARGIN)

% Choose default command line output for histogram_farme
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes histogram_farme wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = histogram_farme_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,FilePath]=uigetfile({'*.*','All Files'});
handles.ImagePath = [FilePath FileName];
set(handles.path,'String',handles.ImagePath);
guidata(hObject, handles);



function path_Callback(hObject, eventdata, handles)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of path as text
%        str2double(get(hObject,'String')) returns contents of path as a double


% --- Executes during object creation, after setting all properties.
function path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in histogram.
function histogram_Callback(hObject, eventdata, handles)
% hObject    handle to histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oldimage = imread(handles.ImagePath);
axes(handles.image_before);
imshow(oldimage);
newimage = histogram_fun(oldimage);
axes(handles.image_after);
bar(newimage);


% --- Executes on button press in histogram_equailze.
function histogram_equailze_Callback(hObject, eventdata, handles)
% hObject    handle to histogram_equailze (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oldimage = imread(handles.ImagePath);
axes(handles.image_before);
imshow(oldimage);
newimage = HistogramEquailze(oldimage);
axes(handles.image_after);
bar(newimage);


% --- Executes on button press in convoluation.
function convoluation_Callback(hObject, eventdata, handles)
% hObject    handle to convoluation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
