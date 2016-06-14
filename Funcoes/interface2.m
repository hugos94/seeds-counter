function varargout = interface2(varargin)
% INTERFACE2 MATLAB code for interface2.fig
%      INTERFACE2, by itself, creates a new INTERFACE2 or raises the existing
%      singleton*.
%
%      H = INTERFACE2 returns the handle to a new INTERFACE2 or the handle to
%      the existing singleton*.
%
%      INTERFACE2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE2.M with the given input arguments.
%
%      INTERFACE2('Property','Value',...) creates a new INTERFACE2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interface2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interface2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interface2

% Last Modified by GUIDE v2.5 13-Jun-2016 21:31:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface2_OpeningFcn, ...
                   'gui_OutputFcn',  @interface2_OutputFcn, ...
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

% --- Executes just before interface2 is made visible.
function interface2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interface2 (see VARARGIN)

% Choose default command line output for interface2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using interface2.

% UIWAIT makes interface2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global count
global tamanhoDoElementoEstruturanteDeteccaoDeBordas
global tamanhoDoElementoEstruturanteFechamento
global removerElementosDeTamanho
global removerElementosDeTamanho2

count = 0;
tamanhoDoElementoEstruturanteDeteccaoDeBordas = 1;
tamanhoDoElementoEstruturanteFechamento = 1;
removerElementosDeTamanho = 1000;
removerElementosDeTamanho2= 2150;


% --- Outputs from this function are returned to the command line.
function varargout = interface2_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function open_file_Callback(hObject, eventdata, handles)
% hObject    handle to open_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global imgsArray %Array com todas as imagens utilizadas
global count
global labels
global labelsArray %Array com as Labels de todas as operações

labels = {'Imagem Original'; 'Detecção de Bordas';'Fechamento';'Abertura';'Preenchimento';'Abertura';'Classificação';};

set(handles.contador_label, 'String', strcat('Quantidade de Sementes: ', num2str(0))); %Altera o contador de elementos encontrados

cla(handles.axes1); %Limpa o axes 1
cla(handles.axes2); %Limpa o axes 2

[filename,canceled] = imgetfile;
if ~canceled
    count = 1;
    imgsArray = [];
    labelsArray = [];
    
    handles.arquivo = filename;
    handles.atual = imread(filename);

    imgsArray{count} = handles.atual;
    trocaHandles( hObject, handles );
    
    labelsArray{count} = labels(1);
    set(handles.anterior_label, 'String', 'Anterior'); %Altera o contador de elementos encontrados
    set(handles.proximo_label, 'String', labelsArray{count}); %Altera o contador de elementos encontrados
    
    set(handles.feijao_input, 'String', strcat('Feijão: ', num2str(0))); %Altera o contador de elementos encontrados
	set(handles.uvapassa_input, 'String', strcat('Uva Passa: ', num2str(0))); %Altera o contador de elementos encontrados
    set(handles.uva_input, 'String', strcat('Uva: ', num2str(0))); %Altera o contador de elementos encontrados
    set(handles.tomate_input, 'String', strcat('Tomate: ', num2str(0))); %Altera o contador de elementos encontrados
    set(handles.uvadedo_input, 'String', strcat('Uva Dedo: ', num2str(0))); %Altera o contador de elementos encontrados
    set(handles.azeitona_input, 'String', strcat('Azeitona: ', num2str(0))); %Altera o contador de elementos encontrados
    set(handles.contador_label, 'String', strcat('Quantidade de Sementes: ', num2str(0))); %Altera o contador de elementos encontrados

end

handles.px2min = NaN;
guidata(hObject,handles)

% --------------------------------------------------------------------
function save_file_Callback(hObject, eventdata, handles)
% hObject    handle to save_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global imgsArray
global count

    if count > 0
        [path_file, user_cancel] = imsave();
        if ~user_cancel
            imwrite(imgsArray{count}, path_file);
            handles.px2min = NaN;
            guidata(hObject, handles);
        end
    else
        msgbox('Imagem atual não foi gerada!', 'Error', 'Error');
    end

% --- Executes on button press in next_button.
function next_button_Callback(hObject, eventdata, handles)
% hObject    handle to next_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global imgsArray
    global count
    global labels
    global labelsArray
    global tamanhoDoElementoEstruturanteDeteccaoDeBordas
    global tamanhoDoElementoEstruturanteFechamento
    global removerElementosDeTamanho
    global removerElementosDeTamanho2
    
    count = count + 1;
    
    switch count
        case 2
            if isfield( handles, 'atual' )
                
                CMYK = rgb2cmyk(imgsArray{count - 1});

                K = CMYK(:,:,4);

                hsv = rgb2hsv(imgsArray{count - 1});

                s = hsv(:,:,2);
                
                imSuavizadaK = filtroMediana(K);

                imSuavizadaS = filtroMediana(s);

                imBordasK = detectarBordasBanda(imSuavizadaK,tamanhoDoElementoEstruturanteDeteccaoDeBordas,1,1,1);

                imBordasS = detectarBordasBanda(imSuavizadaS,tamanhoDoElementoEstruturanteDeteccaoDeBordas,0,1,1);

                imSomaBordas = imBordasK+imBordasS;
                
                imgsArray{count} = imSomaBordas;
                trocaHandles(hObject, handles);
                
                labelsArray{count} = labels(count);
                set(handles.anterior_label, 'String', labelsArray{count - 1}); %Altera o contador de elementos encontrados
                set(handles.proximo_label, 'String', labelsArray{count}); %Altera o contador de elementos encontrados
            else
                msgbox('Imagem não foi carregada!', 'Error', 'Error');
            end
            
        case 3
            if isfield( handles, 'atual' )
                imgsArray{count} = fechamento(imgsArray{count - 1},tamanhoDoElementoEstruturanteFechamento);
                trocaHandles(hObject, handles);
                
                labelsArray{count} = labels(count);
                set(handles.anterior_label, 'String', labelsArray{count - 1}); %Altera o contador de elementos encontrados
                set(handles.proximo_label, 'String', labelsArray{count}); %Altera o contador de elementos encontrados
            else
                msgbox('Imagem não foi carregada!', 'Error', 'Error');
            end
            
        case 4
            if isfield( handles, 'atual' )
                imgsArray{count} = bwareaopen(imgsArray{count - 1},removerElementosDeTamanho);
                trocaHandles(hObject, handles);
                
                labelsArray{count} = labels(count);
                set(handles.anterior_label, 'String', labelsArray{count - 1}); %Altera o contador de elementos encontrados
                set(handles.proximo_label, 'String', labelsArray{count}); %Altera o contador de elementos encontrados
            else
                msgbox('Imagem não foi carregada!', 'Error', 'Error');
            end
            
        case 5
            if isfield( handles, 'atual' )
                imgsArray{count} = preencherEspacos(imgsArray{count - 1},8);
                trocaHandles(hObject, handles);
                
                labelsArray{count} = labels(count);
                set(handles.anterior_label, 'String', labelsArray{count - 1}); %Altera o contador de elementos encontrados
                set(handles.proximo_label, 'String', labelsArray{count}); %Altera o contador de elementos encontrados
            else
                msgbox('Imagem não foi carregada!', 'Error', 'Error');
            end
            
        case 6
            if isfield( handles, 'atual' )
                imgsArray{count} = bwareaopen(imgsArray{count - 1},removerElementosDeTamanho2);
                trocaHandles(hObject, handles);
                
                labelsArray{count} = labels(count);
                set(handles.anterior_label, 'String', labelsArray{count - 1}); %Altera o contador de elementos encontrados
                set(handles.proximo_label, 'String', labelsArray{count}); %Altera o contador de elementos encontrados
            else
                msgbox('Imagem não foi carregada!', 'Error', 'Error');
            end
            
        case 7
            if isfield( handles, 'atual' )
                [imgsArray{count}, feijao, uvapassa, uva, tomate, uvadedo, azeitona, numeroDeRotulos] = classificacaoNovos(imgsArray{count - 1},imgsArray{1});
                trocaHandles(hObject, handles);
                
                set(handles.feijao_input, 'String', strcat('Feijão: ', num2str(feijao))); %Altera o contador de elementos encontrados
                set(handles.uvapassa_input, 'String', strcat('Uva Passa: ', num2str(uvapassa))); %Altera o contador de elementos encontrados
                set(handles.uva_input, 'String', strcat('Uva: ', num2str(uva))); %Altera o contador de elementos encontrados
                set(handles.tomate_input, 'String', strcat('Tomate: ', num2str(tomate))); %Altera o contador de elementos encontrados
                set(handles.uvadedo_input, 'String', strcat('Uva Dedo: ', num2str(uvadedo))); %Altera o contador de elementos encontrados
                set(handles.azeitona_input, 'String', strcat('Azeitona: ', num2str(azeitona))); %Altera o contador de elementos encontrados
                set(handles.contador_label, 'String', strcat('Quantidade de Sementes: ', num2str(numeroDeRotulos))); %Altera o contador de elementos encontrados

                
                labelsArray{count} = labels(count);
                set(handles.anterior_label, 'String', labelsArray{count - 1}); %Altera o contador de elementos encontrados
                set(handles.proximo_label, 'String', labelsArray{count}); %Altera o contador de elementos encontrados
            else
                msgbox('Imagem não foi carregada!', 'Error', 'Error');
            end
    end

function trocaHandles(hObject, handles)
    global count
    global imgsArray
    
    if count > 1
        % Imagem Anterior
        axes(handles.axes1);
        imshow(imgsArray{count - 1});
        handles.px2min = NaN;
        guidata(hObject, handles);
        
        % Imagem Atual
        axes(handles.axes2);
        imshow(imgsArray{count});
        handles.px2min = NaN;
        guidata(hObject, handles);
    elseif count == 1
        % Imagem Anterior
        axes(handles.axes1);
        imshow([]);
        handles.px2min = NaN;
        guidata(hObject, handles);
        
        % Imagem Atual
        axes(handles.axes2);
        imshow(imgsArray{count});
        handles.px2min = NaN;
        guidata(hObject, handles);
    end


% --- Executes on button press in previous_button.
function previous_button_Callback(hObject, eventdata, handles)
% hObject    handle to previous_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global imgsArray
    global count
    global labelsArray

    % Nao tenta retirar a imagem lida
    if count > 1
        imgsArray{count} = [];  % Apaga imagem atual do array
        labelsArray{count} = [];  % Apaga texto atual do array
        count = count - 1;      % Volta 1 imagem
        
        % Troca texto atual pelo anterior e anterior por uma mais anterior ainda
        if count ~= 1
            set(handles.anterior_label, 'String', labelsArray{count - 1}); %Altera o contador de elementos encontrados
        else
            set(handles.anterior_label, 'String', 'Anterior'); %Altera o contador de elementos encontrados
        end
        set(handles.proximo_label, 'String', labelsArray{count}); %Altera o contador de elementos encontrados

        % Troca imagem atual pela anterior e anterior por uma mais anterior ainda
        trocaHandles(hObject, handles);
    end
