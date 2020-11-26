require 'sinatra'
require './config'
require './lib/tablero'
require 'Matrix'

def initialize()
    @buscaminas=Tablero.new()
    @buscaminas.insertarMinas()
    @buscaminas.insertarNumerosEnTablero()
    @x=0
    
end

get '/' do
    @tab = @buscaminas.getTablero()
    @minRes=@buscaminas.getMinasSupuestas()  
    erb :tablero
end    


#Test GIT