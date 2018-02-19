function varargout = ferquancy_farme(varargin)
% FERQUANCY_FARME MATLAB code for ferquancy_farme.fig
%      FERQUANCY_FARME, by itself, creates a new FERQUANCY_FARME or raises the existing
%      singleton*.
%
%      H = FERQUANCY_FARME returns the handle to a new FERQUANCY_FARME or the handle to
%      the existing singleton*.
%
%      FERQUANCY_FARME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FERQUANCY_FARME.M with the given input arguments.
%
%      FERQUANCY_FARME('Property','Value',...) creates a new FERQUANCY_FARME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ferquancy_farme_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ferquancy_farme_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ferquancy_farme

% Last Modified by GUIDE v2.5 19-Dec-2017 01:44:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ferquancy_farme_OpeningFcn, ...
                   'gui_OutputFcn',  @ferquancy_farme_OutputFcn, ...
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


% --- Executes just before ferquancy_farme is made visible.
function ferquancy_farme_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ferquancy_farme (see VARARGIN)

% Choose default command line output for ferquancy_farme
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ferquancy_farme wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ferquancy_farme_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in butterworthlow.
function butterworthlow_Callback(hObject, eventdata, handles)
% hObject    handle to butterworthlow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
d = str2num(get(handles.value,'String'));
oldimage = imread(handles.ImagePath);
axes(handles.image_before);
imshow(oldimage);
newimage = low_butterworth(oldimage,d);
axes(handles.image_after);
imshow(newimage);


% --- Executes on button press in ideallow.
function ideallow_Callback(hObject, eventdata, handles)
% hObject    handle to ideallow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
d = str2num(get(handles.value,'String'));
oldimage = imread(handles.ImagePath);
axes(handles.image_before);
imshow(oldimage);
newimage = low_ideal(oldimage,d);
axes(handles.image_after);
imshow(newimage);


% --- Executes on button press in gaussianlow.
function gaussianlow_Callback(hObject, eventdata, handles)
% hObject    handle to gaussianlow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
d = str2num(get(handles.value,'String'));
oldimage = imread(handles.ImagePath);
axes(handles.image_before);
imshow(oldimage);
newimage = low_guassian(oldimage,d);
axes(handles.image_after);
imshow(newimage);


% --- Executes on button press in idealhigh.
function idealhigh_Callback(hObject, eventdata, handles)
% hObject    handle to idealhigh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
d = str2num(get(handles.value,'String'));
oldimage = imread(handles.ImagePath);
axes(handles.image_before);
imshow(oldimage);
newimage = high_ideal(oldimage,d);
axes(handles.image_after);
imshow(newimage);


% --- Executes on button press in gaussianhigh.
function gaussianhigh_Callback(hObject, eventdata, handles)
% hObject    handle to gaussianhigh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
d = str2num(get(handles.value,'String'));
oldimage = imread(handles.ImagePath);
axes(handles.image_before);
imshow(oldimage);
newimage = high_guassian(oldimage,d);
axes(handles.image_after);
imshow(newimage);


% --- Executes on button press in butterworthhigh.
function butterworthhigh_Callback(hObject, eventdata, handles)
% hObject    handle to butterworthhigh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
d = str2num(get(handles.value,'String'));
oldimage = imread(handles.ImagePath);
axes(handles.image_before);
imshow(oldimage);
newimage = high_butterworth(oldimage,d);
axes(handles.image_after);
imshow(newimage);



function value_Callback(hObject, eventdata, handles)
% hObject    handle to value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value as text
%        str2double(get(hObject,'String')) returns contents of value as a double


% --- Executes during object creation, after setting all properties.
function value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ferquancyfilter.
function ferquancyfilter_Callback(hObject, eventdata, handles)
% hObject    handle to ferquancyfilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oldimage = imread(handles.ImagePath);
axes(handles.image_before);
imshow(oldimage);
newimage = ferqancy_filter(oldimage);
axes(handles.image_after);
imshow(newimage);


% --- Executes on button press in gaussianfilter.
function gaussianfilter_Callback(hObject, eventdata, handles)
% hObject    handle to gaussianfilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oldimage = imread(handles.ImagePath);
axes(handles.image_before);
imshow(oldimage);
% newimage = gussain_filter(oldimage);
% axes(handles.image_after);
% imshow(newimage);


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oldimage = imread(handles.ImagePath);
axes(handles.image_before);
imshow(oldimage);
newimage = InverseFouierTransform(oldimage);
axes(handles.image_after);
imshow(newimage);
