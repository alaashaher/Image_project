function varargout = conversion_farme(varargin)
% CONVERSION_FARME MATLAB code for conversion_farme.fig
%      CONVERSION_FARME, by itself, creates a new CONVERSION_FARME or raises the existing
%      singleton*.
%
%      H = CONVERSION_FARME returns the handle to a new CONVERSION_FARME or the handle to
%      the existing singleton*.
%
%      CONVERSION_FARME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONVERSION_FARME.M with the given input arguments.
%
%      CONVERSION_FARME('Property','Value',...) creates a new CONVERSION_FARME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before conversion_farme_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to conversion_farme_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help conversion_farme

% Last Modified by GUIDE v2.5 14-Dec-2017 15:17:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @conversion_farme_OpeningFcn, ...
                   'gui_OutputFcn',  @conversion_farme_OutputFcn, ...
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


% --- Executes just before conversion_farme is made visible.
function conversion_farme_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to conversion_farme (see VARARGIN)

% Choose default command line output for conversion_farme
handles.output = hObject;
handles.ImagePath = [] ;
handles.X = 0 ;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes conversion_farme wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = conversion_farme_OutputFcn(hObject, eventdata, handles) 
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


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over browse.
function browse_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




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

% --- Executes on button press in gray_to_binary.
function gray_to_binary_Callback(hObject, eventdata, handles)
% hObject    handle to gray_to_binary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
X = get(handles.value,'String');
oldimage = imread(handles.ImagePath);
axes(handles.image_before);
imshow(oldimage);
newimage = Gray2Binary_(oldimage,X);
axes(handles.image_after);
imshow(newimage);



% --- Executes on button press in rgb_to_gray.
function rgb_to_gray_Callback(hObject, eventdata, handles)
% hObject    handle to rgb_to_gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oldimage = imread(handles.ImagePath);
axes(handles.image_before);
imshow(oldimage);
newimage = RGBToGray_fun(oldimage);
axes(handles.image_after);
imshow(newimage);


% --- Executes on button press in rgb_to_binary.
function rgb_to_binary_Callback(hObject, eventdata, handles)
% hObject    handle to rgb_to_binary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
X = get(handles.value,'String');
oldimage = imread(handles.ImagePath);
axes(handles.image_before);
imshow(oldimage);
newimage = rgbtobinary(oldimage,X);
axes(handles.image_after);
imshow(newimage);



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over gray_to_binary.
function gray_to_binary_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to gray_to_binary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
