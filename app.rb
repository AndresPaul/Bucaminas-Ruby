require 'sinatra'
require './config'
require './lib/tablero'
require "matrix.rb"
require "matrix/eigenvalue_decomposition.rb" 
require "matrix/lup_decomposition.rb"

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