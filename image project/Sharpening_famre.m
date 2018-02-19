function varargout = edgedetection_sharpening_farme(varargin)
% EDGEDETECTION_SHARPENING_FARME MATLAB code for edgedetection_sharpening_farme.fig
%      EDGEDETECTION_SHARPENING_FARME, by itself, creates a new EDGEDETECTION_SHARPENING_FARME or raises the existing
%      singleton*.
%
%      H = EDGEDETECTION_SHARPENING_FARME returns the handle to a new EDGEDETECTION_SHARPENING_FARME or the handle to
%      the existing singleton*.
%
%      EDGEDETECTION_SHARPENING_FARME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EDGEDETECTION_SHARPENING_FARME.M with the given input arguments.
%
%      EDGEDETECTION_SHARPENING_FARME('Property','Value',...) creates a new EDGEDETECTION_SHARPENING_FARME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before edgedetection_sharpening_farme_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to edgedetection_sharpening_farme_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help edgedetection_sharpening_farme

% Last Modified by GUIDE v2.5 18-Dec-2017 23:44:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @edgedetection_sharpening_farme_OpeningFcn, ...
                   'gui_OutputFcn',  @edgedetection_sharpening_farme_OutputFcn, ...
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


% --- Executes just before edgedetection_sharpening_farme is made visible.
function edgedetection_sharpening_farme_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to edgedetection_sharpening_farme (see VARARGIN)

% Choose default command line output for edgedetection_sharpening_farme
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes edgedetection_sharpening_farme wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = edgedetection_sharpening_farme_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in sharpening.
function sharpening_Callback(hObject, eventdata, handles)
% hObject    handle to sharpening (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
X = str2num(get(handles.maskIndex,'String'));
Y = str2num(get(handles.index,'String'));
oldimage = imread(handles.ImagePath);
axes(handles.image_before);
imshow(oldimage);
newimage = Sharpening(oldimage,X,Y);
axes(handles.image_after);
imshow(newimage);



function maskIndex_Callback(hObject, eventdata, handles)
% hObject    handle to maskIndex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maskIndex as text
%        str2double(get(hObject,'String')) returns contents of maskIndex as a double


% --- Executes during object creation, after setting all properties.
function maskIndex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maskIndex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function index_Callback(hObject, eventdata, handles)
% hObject    handle to index (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of index as text
%        str2double(get(hObject,'String')) returns contents of index as a double


% --- Executes during object creation, after setting all properties.
function index_CreateFcn(hObject, eventdata, handles)
% hObject    handle to index (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
