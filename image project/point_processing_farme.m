function varargout = point_processing_farme(varargin)
% POINT_PROCESSING_FARME MATLAB code for point_processing_farme.fig
%      POINT_PROCESSING_FARME, by itself, creates a new POINT_PROCESSING_FARME or raises the existing
%      singleton*.
%
%      H = POINT_PROCESSING_FARME returns the handle to a new POINT_PROCESSING_FARME or the handle to
%      the existing singleton*.
%
%      POINT_PROCESSING_FARME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POINT_PROCESSING_FARME.M with the given input arguments.
%
%      POINT_PROCESSING_FARME('Property','Value',...) creates a new POINT_PROCESSING_FARME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before point_processing_farme_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to point_processing_farme_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help point_processing_farme

% Last Modified by GUIDE v2.5 14-Dec-2017 19:59:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @point_processing_farme_OpeningFcn, ...
                   'gui_OutputFcn',  @point_processing_farme_OutputFcn, ...
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


% --- Executes just before point_processing_farme is made visible.
function point_processing_farme_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to point_processing_farme (see VARARGIN)

% Choose default command line output for point_processing_farme
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes point_processing_farme wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = point_processing_farme_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,FilePath]=uigetfile({'*.*','All Files'});
handles.ImagePath = [FilePath FileName];
set(handles.path,'String',handles.ImagePath);
guidata(hObject, handles);


% --- Executes on button press in brightness.
function brightness_Callback(hObject, eventdata, handles)
% hObject    handle to brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = str2num(get(handles.brightness_value,'String'));
choice = get(handles.brightness_choice,'String');
oldimage = imread(handles.ImagePath);
axes(handles.image_before);
imshow(oldimage);
newimage = brightness_fun(oldimage,value,choice);
axes(handles.image_after);
imshow(newimage);




function brightness_value_Callback(hObject, eventdata, handles)
% hObject    handle to brightness_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of brightness_value as text
%        str2double(get(hObject,'String')) returns contents of brightness_value as a double


% --- Executes during object creation, after setting all properties.
function brightness_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to brightness_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function brightness_choice_Callback(hObject, eventdata, handles)
% hObject    handle to brightness_choice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of brightness_choice as text
%        str2double(get(hObject,'String')) returns contents of brightness_choice as a double


% --- Executes during object creation, after setting all properties.
function brightness_choice_CreateFcn(hObject, eventdata, handles)
% hObject    handle to brightness_choice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in negative.
function negative_Callback(hObject, eventdata, handles)
% hObject    handle to negative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oldimage = imread(handles.ImagePath);
axes(handles.image_before);
imshow(oldimage);
newimage = negative_fun(oldimage);
axes(handles.image_after);
imshow(newimage);



% --- Executes on button press in gamma.
function gamma_Callback(hObject, eventdata, handles)
% hObject    handle to gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = str2num(get(handles.value_cor,'String'));
oldimage = imread(handles.ImagePath);
axes(handles.image_before);
imshow(oldimage);
newimage = gamma_correction(oldimage,value);
axes(handles.image_after);
imshow(newimage);


% --- Executes on button press in log.
function log_Callback(hObject, eventdata, handles)
% hObject    handle to log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oldimage = imread(handles.ImagePath);
axes(handles.image_before);
imshow(oldimage);
newimage = log_transformation(oldimage);
axes(handles.image_after);
imshow(newimage);


% --- Executes on button press in constrast.
function constrast_Callback(hObject, eventdata, handles)
% hObject    handle to constrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
min = str2num(get(handles.min_con,'String'));
max = str2num(get(handles.max_con,'String'));
oldimage = imread(handles.ImagePath);
axes(handles.image_before);
imshow(oldimage);
newimage = contrast_stretching(oldimage,min,max);
axes(handles.image_after);
imshow(newimage);


function min_con_Callback(hObject, eventdata, handles)
% hObject    handle to min_con (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min_con as text
%        str2double(get(hObject,'String')) returns contents of min_con as a double


% --- Executes during object creation, after setting all properties.
function min_con_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min_con (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_con_Callback(hObject, eventdata, handles)
% hObject    handle to max_con (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max_con as text
%        str2double(get(hObject,'String')) returns contents of max_con as a double


% --- Executes during object creation, after setting all properties.
function max_con_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_con (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function value_cor_Callback(hObject, eventdata, handles)
% hObject    handle to value_cor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value_cor as text
%        str2double(get(hObject,'String')) returns contents of value_cor as a double


% --- Executes during object creation, after setting all properties.
function value_cor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value_cor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
