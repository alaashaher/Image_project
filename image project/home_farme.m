function varargout = home_farme(varargin)
% HOME_FARME MATLAB code for home_farme.fig
%      HOME_FARME, by itself, creates a new HOME_FARME or raises the existing
%      singleton*.
%
%      H = HOME_FARME returns the handle to a new HOME_FARME or the handle to
%      the existing singleton*.
%
%      HOME_FARME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOME_FARME.M with the given input arguments.
%
%      HOME_FARME('Property','Value',...) creates a new HOME_FARME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before home_farme_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to home_farme_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help home_farme

% Last Modified by GUIDE v2.5 18-Dec-2017 23:53:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @home_farme_OpeningFcn, ...
                   'gui_OutputFcn',  @home_farme_OutputFcn, ...
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


% --- Executes just before home_farme is made visible.
function home_farme_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to home_farme (see VARARGIN)

% Choose default command line output for home_farme
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes home_farme wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = home_farme_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in conversion.
function conversion_Callback(hObject, eventdata, handles)
% hObject    handle to conversion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
conversion_farme();


% --- Executes on button press in point_processing.
function point_processing_Callback(hObject, eventdata, handles)
% hObject    handle to point_processing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
point_processing_farme();


% --- Executes on button press in histogram.
function histogram_Callback(hObject, eventdata, handles)
% hObject    handle to histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
histogram_farme();


% --- Executes on button press in ferqancy_filters.
function ferqancy_filters_Callback(hObject, eventdata, handles)
% hObject    handle to ferqancy_filters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ferquancy_farme();


% --- Executes on button press in edge_detection.
function edge_detection_Callback(hObject, eventdata, handles)
% hObject    handle to edge_detection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
edgedetection_farme();


% --- Executes on button press in sharpening.
function sharpening_Callback(hObject, eventdata, handles)
% hObject    handle to sharpening (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in blurring.
function blurring_Callback(hObject, eventdata, handles)
% hObject    handle to blurring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
blurring_farme();


% --- Executes on button press in noise.
function noise_Callback(hObject, eventdata, handles)
% hObject    handle to noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
noise_farme();


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over conversion.
function conversion_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to conversion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
