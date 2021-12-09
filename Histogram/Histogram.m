function varargout = Histogram(varargin)
% HISTOGRAM MATLAB code for Histogram.fig
%      HISTOGRAM, by itself, creates a new HISTOGRAM or raises the existing
%      singleton*.
%
%      H = HISTOGRAM returns the handle to a new HISTOGRAM or the handle to
%      the existing singleton*.
%
%      HISTOGRAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HISTOGRAM.M with the given input arguments.
%
%      HISTOGRAM('Property','Value',...) creates a new HISTOGRAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Histogram_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Histogram_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Histogram

% Last Modified by GUIDE v2.5 10-Dec-2021 01:43:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Histogram_OpeningFcn, ...
                   'gui_OutputFcn',  @Histogram_OutputFcn, ...
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


% --- Executes just before Histogram is made visible.
function Histogram_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Histogram (see VARARGIN)

% Choose default command line output for Histogram
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Histogram wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Histogram_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.*');
drawnow
figure(app.UIFigure)
if ~isequal(filename,0)
    Img = imread(fullfile(pathname, filename));
    imshow(Img, 'Parent', app.UIaxes)
    title(app.UIaxes, 'RGB Image')
    R = Img(:,:,1);
    G = Img(:,:,2);
    B = Img(:,:,3);
    h = histogram(R(:), 'Parent', app.UIaxes_2)
    h.faceColor = [1 0 0];
    grid(app.UIaxes_2, 'on')
    title(app.UIaxes_2, 'Histogram')
    xlim(app.UIaxes_2,[0,255])
    ylim(app.UIaxes_2, [0,30000])
    xticks(app.UIaxes_2,0:50:250)
    yticks(app.UIaxes_2, [0:5000:30000])
    xlabel(app.UIaxes_2, 'Intensitas Piksel')
    ylabel(app.UIaxes_2, 'Frekuensi')
    hold(app.UIaxes_2,'on')
    h = histogram(G(:), 'Parent' ,app.UIaxes_2);
    h.faceColor = [0 1 0];
    h = histogram(B(:), 'Parent' , app.UIaxes_2);
    h.faceColor = [0 0 1];
    hold(app.UIaxes_2, 'off')
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
