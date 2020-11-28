require 'sinatra'
require './config'
require './lib/tablero'
require "matrix.rb"
require "matrix/eigenvalue_decomposition.rb" 
require "matrix/lup_decomposition.rb"

#testtt
def initialize()
    @buscaminas=Tablero.new()
end

get '/' do
    erb :menu
end   

post '/personalizado' do
    @filas=params[:filas].to_i
    @columnas=params[:columnas].to_i
    @buscaminas.crearTablero(@filas,@columnas)
    #@tab = @buscaminas.getTablero()
    #@minRes=@buscaminas.mostrarBanderas()  
    @tablero=@buscaminas.generarHTMLParaTablero()
    erb :tablero
end
post '/principiante' do
    @buscaminas.crearTablero(8,8)
    @filas = @buscaminas.mostrarFilasDeTablero()
    @columnas = @buscaminas.mostrarColumnasDelTablero()
    @buscaminas.insertarMinas(10)
    @buscaminas.insertarNumeroDeMinasAlrededor()
    #@tab = @buscaminas.getTablero()
    #@minRes=@buscaminas.mostrarBanderas()  
    @tablero=@buscaminas.generarHTMLParaTablero()
    erb :tablero
end

post '/intermedio' do
    @buscaminas.crearTablero(16,16)
    @filas = @buscaminas.mostrarFilasDeTablero()
    @columnas = @buscaminas.mostrarColumnasDelTablero()
    @buscaminas.insertarMinas(20)
    @buscaminas.insertarNumeroDeMinasAlrededor()
    #@tab = @buscaminas.getTablero()
    #@minRes=@buscaminas.mostrarBanderas()  
    @tablero=@buscaminas.generarHTMLParaTablero()
    erb :tablero
end

post '/abrirCasilla' do
    @filas=params[:filas].to_i
    @columnas=params[:columnas].to_i
    @mensaje = @buscaminas.abrirCasilla(@filas,@columnas)
    @filas = @buscaminas.mostrarFilasDeTablero()
    @columnas = @buscaminas.mostrarColumnasDelTablero()
    @tablero=@buscaminas.generarHTMLParaTablero()
    if @mensaje == 'Perdiste'
        erb :perdiste
    else
        erb :tablero
    end
end
post '/marcarCasilla' do
    @filas=params[:filas].to_i
    @columnas=params[:columnas].to_i
    @buscaminas.insertarNumeroDeMinasAlrededor()
    #@tab = @buscaminas.getTablero()
    #@minRes=@buscaminas.mostrarBanderas()  
    @tablero=@buscaminas.generarHTMLParaTablero()
    erb :tablero
end

#Test GIT