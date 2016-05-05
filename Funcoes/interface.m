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

% Last Modified by GUIDE v2.5 05-May-2016 09:48:29

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

set(handles.contador_label, 'String', strcat('Elementos encontrados: ', num2str(0))); %Altera o contador de elementos encontrados
set(handles.table_text, 'String', ''); %Altera o contador de elementos encontrados

cla(handles.axes1);
cla(handles.axes2);


[filename,canceled] = imgetfile;
if ~canceled
     handles.proportion = '1';
     set(handles.axes1, 'visible', 'on');
     handles.arquivo = filename;
     handles.image = imread(filename);
     axes(handles.axes1);
     [x,y,~] = size(handles.image);
     set(handles.image_size_label, 'String', strcat('Tamanho da imagem: ', num2str(x), 'x', num2str(y))); %Altera o contador de elementos encontrados
     imshow(handles.image);
end

handles.qtClasses = 3;
handles.classes = zeros(handles.qtClasses,1);
handles.limiarInferior = zeros(handles.qtClasses,1);
handles.limiarSuperior = zeros(handles.qtClasses,1);
handles.qtPixelsNaClasse = zeros(handles.qtClasses,1);


handles.tamanhoDaJanela = 3;
handles.tamanhoDoElementoEstruturanteDeteccaoDeBordas = 10;
handles.tamanhoDoElementoEstruturanteDilatacao = 18;
handles.tamanhoDoElementoEstruturanteErosao = 70;
handles.tamanhoQuadrado = 90;


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

handles.red_band = handles.image(:,:,1); %Captura a banda R da imagem original

hsv = rgb2hsv(handles.image); %Converte a imagem original para HSV
        
handles.s_component = hsv(:,:,2); %Captura a component S da imagem original

handles.result = filtroMediana(handles.s_component); %Aplica o filtro da mediana na componente S

set(handles.axes2, 'visible', 'on');
axes(handles.axes2);
imshow(handles.result);
guidata(hObject,handles)


% --- Executes on button press in edge_detection_button.
function edge_detection_button_Callback(hObject, eventdata, handles)
% hObject    handle to edge_detection_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.result = deteccaoBordasDilatacao(handles.result,handles.tamanhoDoElementoEstruturanteDeteccaoDeBordas); % parametro tamanho do elemento estruturante

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


% --- Executes on button press in erosion_button.
function dilatation_button_Callback(hObject, eventdata, handles)
% hObject    handle to erosion_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.result = dilatacao(handles.result,handles.tamanhoDoElementoEstruturanteDilatacao);

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


% --- Executes on button press in erosion_button.
function erosion_button_Callback(hObject, eventdata, handles)
% hObject    handle to erosion_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.result = erosao(handles.result,handles.tamanhoDoElementoEstruturanteErosao);

set(handles.axes2, 'visible', 'on');
axes(handles.axes2);
imshow(handles.result);
guidata(hObject,handles)


% --- Executes on button press in elements_counter_button.
function elements_counter_button_Callback(hObject, eventdata, handles)
% hObject    handle to elements_counter_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[handles.total,handles.imRotulada] = contarComponentesConectadas(handles.result);

propriedadeCentroide = regionprops(handles.imRotulada,'centroid');

handles.tamanhoDoIncrementoDeIntensidade = uint8((252/handles.qtClasses));

handles.limiarInferior(1,1) = 1;

handles.limiarSuperior(1,1) = handles.tamanhoDoIncrementoDeIntensidade+1;

for cont = 2:handles.qtClasses

        handles.limiarInferior(cont,1) = handles.limiarInferior(cont-1,1)+handles.tamanhoDoIncrementoDeIntensidade+1;

        handles.limiarSuperior(cont,1) = handles.limiarSuperior(cont-1,1)+handles.tamanhoDoIncrementoDeIntensidade+1;

end

handles.imSaidaQuadrados = uint8(zeros(size(handles.red_band)));

for cont = 1:handles.total

    xCentroide = uint16(propriedadeCentroide(cont).Centroid(2));
    yCentroide = uint16(propriedadeCentroide(cont).Centroid(1));

    janela = handles.red_band(xCentroide-handles.tamanhoDaJanela:xCentroide+handles.tamanhoDaJanela,yCentroide-handles.tamanhoDaJanela:yCentroide+handles.tamanhoDaJanela);

    janela = filtroMediana(janela);

    binarioClasse1 = limiar(janela,handles.limiarInferior(1,1),handles.limiarSuperior(1,1));
    binarioClasse2 = limiar(janela,handles.limiarInferior(2,1),handles.limiarSuperior(2,1));
    binarioClasse3 = limiar(janela,handles.limiarInferior(3,1),handles.limiarSuperior(3,1));

    qtPixelsNaClasse(1,1) = sum(binarioClasse1(:));
    qtPixelsNaClasse(2,1) = sum(binarioClasse2(:));
    qtPixelsNaClasse(3,1) = sum(binarioClasse3(:));

    maximoAux = max(qtPixelsNaClasse(1,1),qtPixelsNaClasse(2,1));
    maximo = max(qtPixelsNaClasse(3,1),maximoAux);

    indice = find(qtPixelsNaClasse == maximo);

    handles.classes(indice,1) = handles.classes(indice,1)+1;

    imSaidaQuadrados(xCentroide-handles.tamanhoQuadrado:xCentroide+handles.tamanhoQuadrado,yCentroide-handles.tamanhoQuadrado:yCentroide+handles.tamanhoQuadrado) = uint8(indice*(255/3));

    imSaidaQuadrados = desenharBordaDoQuadrado(imSaidaQuadrados,xCentroide-handles.tamanhoQuadrado,xCentroide+handles.tamanhoQuadrado,yCentroide-handles.tamanhoQuadrado,yCentroide+handles.tamanhoQuadrado);

end

handles.quantidadesEncontradas = ''
    
for cont = 1:handles.qtClasses
    handles.quantidadesEncontradas = strcat(handles.quantidadesEncontradas, 'Classe ',num2str(cont), ' =  ', num2str(handles.classes(cont,1)),  ' grãos.');
end

set(handles.contador_label, 'String', strcat('Elementos encontrados: ', num2str(handles.total))); %Altera o contador de elementos encontrados
set(handles.table_text, 'String', handles.quantidadesEncontradas); %Altera o contador de elementos encontrados

set(handles.axes2, 'visible', 'on'); %Coloca o axes2 como visivel
axes(handles.axes2);
imshow(imSaidaQuadrados);

figure, imshow(handles.red_band),title('BANDA R');


% --- Executes on button press in execute_complete_button.
function execute_complete_button_Callback(hObject, eventdata, handles)
% hObject    handle to execute_complete_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    qtClasses = 3
    classes = zeros(qtClasses,1);
    limiarInferior = zeros(qtClasses,1);
    limiarSuperior = zeros(qtClasses,1);
    qtPixelsNaClasse = zeros(qtClasses,1);
    
    hsv = rgb2hsv(handles.image);

    s = hsv(:,:,2);

    R = handles.image(:,:,1);

    imSemRuido = filtroMediana(s);
        
    imBordas = deteccaoBordasDilatacao(imSemRuido,handles.tamanhoDoElementoEstruturanteDeteccaoDeBordas); % parametro tamanho do elemento estruturante

    imLimiarAutomatico = limiarAutomatico(imBordas);
        
    imDilatada = dilatacao(imLimiarAutomatico,handles.tamanhoDoElementoEstruturanteDilatacao);

    imPreenchida = preencherEspacos(imDilatada,8); % parametro tamanho do elemento estruturante
    
    imErodida = erosao(imPreenchida,handles.tamanhoDoElementoEstruturanteErosao);

    [total,imRotulada] = contarComponentesConectadas(imErodida);

    propriedadeCentroide = regionprops(imRotulada,'centroid');

    tamanhoDoIncrementoDeIntensidade = uint8((252/qtClasses));

    limiarInferior(1,1) = 1;

    limiarSuperior(1,1) = tamanhoDoIncrementoDeIntensidade+1;

    for cont = 2:qtClasses
        limiarInferior(cont,1) = limiarInferior(cont-1,1)+tamanhoDoIncrementoDeIntensidade+1;

        limiarSuperior(cont,1) = limiarSuperior(cont-1,1)+tamanhoDoIncrementoDeIntensidade+1;
    end

    imSaidaQuadrados = uint8(zeros(size(R)));

    for cont = 1:total

        xCentroide = uint16(propriedadeCentroide(cont).Centroid(2));
        yCentroide = uint16(propriedadeCentroide(cont).Centroid(1));

        janela = R(xCentroide-handles.tamanhoDaJanela:xCentroide+handles.tamanhoDaJanela,yCentroide-handles.tamanhoDaJanela:yCentroide+handles.tamanhoDaJanela);

        janela = filtroMediana(janela);

        binarioClasse1 = limiar(janela,limiarInferior(1,1),limiarSuperior(1,1));
        binarioClasse2 = limiar(janela,limiarInferior(2,1),limiarSuperior(2,1));
        binarioClasse3 = limiar(janela,limiarInferior(3,1),limiarSuperior(3,1));

        qtPixelsNaClasse(1,1) = sum(binarioClasse1(:));
        qtPixelsNaClasse(2,1) = sum(binarioClasse2(:));
        qtPixelsNaClasse(3,1) = sum(binarioClasse3(:));

        maximoAux = max(qtPixelsNaClasse(1,1),qtPixelsNaClasse(2,1));
        maximo = max(qtPixelsNaClasse(3,1),maximoAux);

        indice = find(qtPixelsNaClasse == maximo);

        classes(indice,1) = classes(indice,1)+1;
        
        imSaidaQuadrados(xCentroide-handles.tamanhoQuadrado:xCentroide+handles.tamanhoQuadrado,yCentroide-handles.tamanhoQuadrado:yCentroide+handles.tamanhoQuadrado) = uint8(indice*(255/3));
        
        imSaidaQuadrados = desenharBordaDoQuadrado(imSaidaQuadrados,xCentroide-handles.tamanhoQuadrado,xCentroide+handles.tamanhoQuadrado,yCentroide-handles.tamanhoQuadrado,yCentroide+handles.tamanhoQuadrado);

    end
    
    handles.quantidadesEncontradas = ''
    
    for cont = 1:qtClasses
        handles.quantidadesEncontradas = [handles.quantidadesEncontradas 'Classe ' num2str(cont) ' =  ' num2str(classes(cont,1))  ' grãos.';];
    end
            
    set(handles.contador_label, 'String', strcat('Elementos encontrados: ', num2str(total))); %Altera o contador de elementos encontrados
    set(handles.table_text, 'String', handles.quantidadesEncontradas); %Altera o contador de elementos encontrados

    set(handles.axes2, 'visible', 'on'); %Coloca o axes2 como visivel
    axes(handles.axes2);
    imshow(imSaidaQuadrados);
    
    figure, imshow(R),title('BANDA R');


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



function tamanho_janela_input_Callback(hObject, eventdata, handles)
% hObject    handle to tamanho_janela_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tamanho_janela_input as text
%        str2double(get(hObject,'String')) returns contents of tamanho_janela_input as a double

handles.tamanhoDaJanela = str2num(get(hObject,'String'));
guidata(hObject,handles)



% --- Executes during object creation, after setting all properties.
function tamanho_janela_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tamanho_janela_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tamanho_quadrado_input_Callback(hObject, eventdata, handles)
% hObject    handle to tamanho_quadrado_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tamanho_quadrado_input as text
%        str2double(get(hObject,'String')) returns contents of tamanho_quadrado_input as a double

handles.tamanhoQuadrado = str2num(get(hObject,'String'));
guidata(hObject,handles)



% --- Executes during object creation, after setting all properties.
function tamanho_quadrado_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tamanho_quadrado_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function tamanho_deteccao_bordas_input_Callback(hObject, eventdata, handles)
% hObject    handle to tamanho_deteccao_bordas_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tamanho_deteccao_bordas_input as text
%        str2double(get(hObject,'String')) returns contents of tamanho_deteccao_bordas_input as a double

handles.tamanhoDoElementoEstruturanteDeteccaoDeBordas = str2num(get(hObject,'String'));
guidata(hObject,handles)



% --- Executes during object creation, after setting all properties.
function tamanho_deteccao_bordas_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tamanho_deteccao_bordas_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tamanho_dilatacao_input_Callback(hObject, eventdata, handles)
% hObject    handle to tamanho_dilatacao_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tamanho_dilatacao_input as text
%        str2double(get(hObject,'String')) returns contents of tamanho_dilatacao_input as a double

handles.tamanhoDoElementoEstruturanteDilatacao = str2num(get(hObject,'String'));
guidata(hObject,handles)



% --- Executes during object creation, after setting all properties.
function tamanho_dilatacao_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tamanho_dilatacao_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tamanho_erosao_input_Callback(hObject, eventdata, handles)
% hObject    handle to tamanho_erosao_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tamanho_erosao_input as text
%        str2double(get(hObject,'String')) returns contents of tamanho_erosao_input as a double

handles.tamanhoDoElementoEstruturanteErosao = str2num(get(hObject,'String'));
guidata(hObject,handles)



% --- Executes during object creation, after setting all properties.
function tamanho_erosao_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tamanho_erosao_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
