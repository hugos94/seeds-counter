function varargout = interface(varargin)
% INTERFACE MATLAB code for interface.fig
%      INTERFACE, by itself, creates a new INTERFACE or raises the existing
%      singleton*.
%
%      H = INTERFACE returns the handle to a new INTERFACE or the handle to
%      the existing singleton*.
%
%      INTERFACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE.M with the given input arguments.
%
%      INTERFACE('Property','Value',...) creates a new INTERFACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interface_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interface_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interface

% Last Modified by GUIDE v2.5 26-Apr-2016 23:15:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface_OpeningFcn, ...
                   'gui_OutputFcn',  @interface_OutputFcn, ...
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


% --- Executes just before interface is made visible.
function interface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interface (see VARARGIN)

% Choose default command line output for interface
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interface wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interface_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function arquivo_Callback(hObject, eventdata, handles)
% hObject    handle to arquivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function open_file_Callback(hObject, eventdata, handles)
% hObject    handle to open_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,canceled] = imgetfile;
if ~canceled
     set(handles.axes1, 'visible', 'on');
     handles.arquivo = filename;
     handles.image = imread(filename);
     axes(handles.axes1);
     [x,y,~] = size(handles.image);
     set(handles.image_size_label, 'String', strcat('Tamanho da imagem: ', num2str(x), 'x', num2str(y))); %Altera o contador de elementos encontrados
     imshow(handles.image);
     handles.proportion = 0.1;
     %set(handles.axes2, 'visible', 'off'); %Coloca o axes2 como visivel
     %axes(handles.axes2);
     %imshow();
end
handles.px2min = NaN;
guidata(hObject,handles)


% --------------------------------------------------------------------
function save_file_Callback(hObject, eventdata, handles)
% hObject    handle to save_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,canceled] = imsave;
if ~canceled
     imwrite(handles.result, filename);
end
handles.px2min = NaN;
guidata(hObject,handles)


% --- Executes on button press in median_filter_button.
function median_filter_button_Callback(hObject, eventdata, handles)
% hObject    handle to median_filter_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.red_band = handles.image(:,:,1);
handles.result = filtroMediana(handles.red_band);
set(handles.axes2, 'visible', 'on');
axes(handles.axes2);
imshow(handles.result);
guidata(hObject,handles)


% --- Executes on button press in histogram_equalizer_button.
function histogram_equalizer_button_Callback(hObject, eventdata, handles)
% hObject    handle to histogram_equalizer_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.result = equalizarHistograma(handles.result);
set(handles.axes2, 'visible', 'on');
axes(handles.axes2);
imshow(handles.result);
guidata(hObject,handles)


% --- Executes on button press in edge_detection_button.
function edge_detection_button_Callback(hObject, eventdata, handles)
% hObject    handle to edge_detection_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.result = deteccaoBordasDilatacao(handles.result,20);
set(handles.axes2, 'visible', 'on');
axes(handles.axes2);
imshow(handles.result);
guidata(hObject,handles)


% --- Executes on button press in thresholding_button.
function thresholding_button_Callback(hObject, eventdata, handles)
% hObject    handle to thresholding_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.result = limiarAutomatico(handles.result);
set(handles.axes2, 'visible', 'on');
axes(handles.axes2);
imshow(handles.result);
guidata(hObject,handles)


% --- Executes on button press in apperture_button.
function apperture_button_Callback(hObject, eventdata, handles)
% hObject    handle to apperture_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.result = abertura(handles.result,5);
set(handles.axes2, 'visible', 'on');
axes(handles.axes2);
imshow(handles.result);
guidata(hObject,handles)


% --- Executes on button press in dilatation_button.
function dilatation_button_Callback(hObject, eventdata, handles)
% hObject    handle to dilatation_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.result = dilatacao(handles.result,5);
set(handles.axes2, 'visible', 'on');
axes(handles.axes2);
imshow(handles.result);
guidata(hObject,handles)


% --- Executes on button press in fill_spaces_button.
function fill_spaces_button_Callback(hObject, eventdata, handles)
% hObject    handle to fill_spaces_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.result = preencherEspacos(handles.result,8);
set(handles.axes2, 'visible', 'on');
axes(handles.axes2);
imshow(handles.result);
guidata(hObject,handles)


% --- Executes on button press in elements_counter_button.
function elements_counter_button_Callback(hObject, eventdata, handles)
% hObject    handle to elements_counter_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[quantidade,~] = contarComponentesConectadas(handles.result);

handles.result = aplicarMascara(handles.red_band,imPreenchida);

set(handles.contador_label, 'String', strcat('Elementos encontrados:  ', num2str(quantidade))); %Altera o contador de elementos encontrados
set(handles.axes2, 'visible', 'on'); %Coloca o axes2 como visivel
axes(handles.axes2);
imshow(handles.result);
guidata(hObject,handles)

% --- Executes on button press in execute_complete_button.
function execute_complete_button_Callback(hObject, eventdata, handles)
% hObject    handle to execute_complete_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    red_band = handles.image(:,:,1); %Captura apenas a banda vermelha
    
    pre = preprocessamento(red_band);
    
    imBordas = deteccaoBordasDilatacao(pre,20); % parametro tamanho do elemento estruturante
    
    imLimiarAutomatico = limiarAutomatico(imBordas);
    
%     figure, imshow(imLimiarAutomatico);
    
    imAberta = abertura(imLimiarAutomatico,5);
    
%     figure, imshow(imAberta);

    imDilatada = dilatacao(imAberta,5);
    
%     figure, imshow(imDilatada);
    
    imPreenchida = preencherEspacos(imDilatada,8); % parametro tamanho do elemento estruturante

%     figure, imshow(imPreenchida);
    
    [total,~] = contarComponentesConectadas(imPreenchida);
    
    disp(['Total de grãos = ' num2str(total)]);
    
    imComMascara = aplicarMascara(red_band,imPreenchida);
    
%     figure, imshow(imComMascara);

    qtClasses = 3
    
    tamanhoDoIncrementoDeIntensidade = uint8(253/qtClasses);
    
    disp(['Tamanho do incremento =' num2str(tamanhoDoIncrementoDeIntensidade)]);
    
    limiteInferior = 0;
    
    limiteSuperior = tamanhoDoIncrementoDeIntensidade;
    
    for i = 1:qtClasses-1
       
       imClasse = limiar(imComMascara,limiteInferior,limiteSuperior);
       
%        figure, imshow(imClasse);
       
       imErodida = erosao(imClasse,2);
       
%        figure, imshow(imErodida);

       imPreenchida = preencherEspacos(imErodida,8); % parametro tamanho do elemento estruturante

%        figure, imshow(imPreenchida);
       
       imAberta = abertura(imPreenchida,20);
    
%        figure, imshow(imAberta);
       
       limiteInferior = limiteInferior+tamanhoDoIncrementoDeIntensidade;
       
       limiteSuperior = limiteSuperior+tamanhoDoIncrementoDeIntensidade;
       
       [quantidade,imLabel] = contarComponentesConectadas(imAberta);
    
%     figure, imshow(imLabel);

       disp(['A classe ' num2str(i) ' tem ' num2str(quantidade) ' grãos']);
       
       imAberta = ~imAberta;
       
       imComMascara = aplicarMascara(imComMascara,imAberta);
       
       total = total-quantidade;
       
%        figure, imshow(imComMascara);
    end
    
    disp(['A classe ' num2str(qtClasses) ' tem ' num2str(total) ' graos']);
    
    set(handles.contador_label, 'String', strcat('Elementos encontrados:  ', num2str(quantidade))); %Altera o contador de elementos encontrados
    set(handles.axes2, 'visible', 'on'); %Coloca o axes2 como visivel
    axes(handles.axes2);
    imshow(imComMascara);


% --- Executes on selection change in proportion_popup_menu.
function proportion_popup_menu_Callback(hObject, eventdata, handles)
% hObject    handle to proportion_popup_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns proportion_popup_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from proportion_popup_menu

str = get(hObject, 'String');
val = get(hObject,'Value');

handles.proportion = str{val};
% Save the handles structure.
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function proportion_popup_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to proportion_popup_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in resize_button.
function resize_button_Callback(hObject, eventdata, handles)
% hObject    handle to resize_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.image = imresize(handles.image, str2double(handles.proportion));

axes(handles.axes1);
[x,y,~] = size(handles.image);
set(handles.image_size_label, 'String', strcat('Tamanho da imagem: ', num2str(x), 'x', num2str(y))); %Altera o contador de elementos encontrados
imshow(handles.image);
guidata(hObject,handles)
