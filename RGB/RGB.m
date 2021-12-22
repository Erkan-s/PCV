function varargout = RGB(varargin)
% RGB MATLAB code for RGB.fig
%      RGB, by itself, creates a new RGB or raises the existing
%      singleton*.
%
%      H = RGB returns the handle to a new RGB or the handle to
%      the existing singleton*.
%
%      RGB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RGB.M with the given input arguments.
%
%      RGB('Property','Value',...) creates a new RGB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RGB_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RGB_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RGB

% Last Modified by GUIDE v2.5 22-Dec-2021 23:23:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RGB_OpeningFcn, ...
                   'gui_OutputFcn',  @RGB_OutputFcn, ...
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


% --- Executes just before RGB is made visible.
function RGB_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RGB (see VARARGIN)

% Choose default command line output for RGB
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RGB wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RGB_OutputFcn(hObject, eventdata, handles) 
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

% memanggil menu "browse file"
[nama_file, nama_folder] = uigetfile('*.jpg');

%jika ada nama file yang dipilih maka akan mengeksekusi 
%perintah dibawah ini
if ~isequal(nama_file,0)
    % membaca file citra asli
    img = imread(fullfile(nama_folder,nama_file));
    
    % menghitung rata-rata nilai citra asli ke nilai rgb
    a = imread(fullfile(nama_folder,nama_file));
%     red = mean(mean(a(:,:,1)));
%     green = mean(mean(a(:,:,2)));
%     blue = mean(mean(a(:,:,3)));
%     fitur = [red green blue]; % mematrikkan fitur
%     %xlswrite('fiturwarna.xls',fitur); % menyimpan fitur ke file excel
%     %figure, imshow(a)
    
    % mengkonversi citra asli menjadi citra hsv
    hsv = rgb2hsv(a);
    h = hsv(:,:,1);
    s = hsv(:,:,2);
    v = hsv(:,:,3);
    
    % menampilkan citra asli pada axes
    axes(handles.axes1)
    imshow(img)
    title('Citra Asli')
    
    % menampilkan citra hsv
    axes(handles.axes2)
    imshow(hsv)
    title('Citra HSV')
    
    % menghitung nilai citra asli ke nilai rgb
    red = mean(mean(a(:,:,1)));
    green = mean(mean(a(:,:,2)));
    blue = mean(mean(a(:,:,3)));
    fitur = [red green blue]; % mematrikkan fitur
    
    % menampilkan nilai RGB
    set(handles.edit1,'string',red);
    set(handles.edit2,'string',green);
    set(handles.edit3,'string',blue);
    
    % mencari nilai hsv
    hue = hsv(:,:,1);
    saturation = hsv(:,:,2);
    value = hsv(:,:,3);
    
    
    meanhue = mean2(hue);
    meansaturation = mean2(saturation);
    meanvalue = mean2(value);
    display(meanhue);
    
    % menampilkan nilai HSV
    set(handles.edit4,'string',meanhue);
    set(handles.edit5,'string',meansaturation);
    set(handles.edit6,'string',meanvalue);
    
    % mengubah nilai piksel background menjadi nol
    %hue(~fitur) = 0;
    %saturation(~fitur) = 0;
    %value(~fitur) = 0;
 
    % menghitung rata-rata nilai hue, saturation, dan value
    %data_uji(1,1) = sum(sum(hue))/sum(sum(fitur));
    %data_uji(1,2) = sum(sum(saturation))/sum(sum(fitur));
    %data_uji(1,3) = sum(sum(value))/sum(sum(fitur));

    % menyimpan variabel img pada lokasi handles agar dapat dipanggil
    % pushbutton lain
    %handles.img = img;
    %handles.hsv = hsv;
    %handles.hue = hue;
    %handles.saturation = saturation;
    %handles.v = value;
    %guidata(hObject, handles)
    
    % memanggil model hasil pelatihan
    %load Mdl

    % membaca kelas keluaran hasil pengujian
    %kelas_keluaran = predict(Mdl,data_uji);

    % menampilkan kelas keluaran hasil pengujian pada edit text
    %set(handles.edit7,'String',kelas_keluaran{1})
    
    
else
    %jika ada nama file yang dipilih maka akan kembali
    return
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% mereset tampilan gui
set(handles.edit1,'String',[])
set(handles.edit2,'String',[])
set(handles.edit3,'String',[])
set(handles.edit4,'String',[])
set(handles.edit5,'String',[])
set(handles.edit6,'String',[])

axes(handles.axes1)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])

axes(handles.axes2)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
