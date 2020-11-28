require 'tablero.rb'


RSpec.describe Tablero do
    
    before { @tablero = Tablero.new } #arrange

    #it 'debería devolver 64' do
    #    @tablero.insertarMinas()
    #    @tablero.insertarNumerosEnTablero()
    #   expect(@tablero.obtenerTamanioTablero()).to eq(64)
    #end
    #it 'deberia devolver un string con los atributos para el HTML' do
    #    expect(@tablero.generarHTMLParaTablero()).to eq('<div> </div>') #act assert
    #end
    #it 'debería devolver una casilla para HTML' do
    #    @tablero.crearTablero(8,8)
    #    @tablero.insertarMinas()
    #    @tablero.insertarNumeroDeMinasAlrededor()
    #    expect(@tablero.generarHTMLParaUnaCasilla()).to eq('<div class="casilla">1</div>')
    #end
    it 'deberia devolver un string con los atributos para el HTML sin nada dentro' do
        @tablero.crearTablero(1,1)
        expect(@tablero.generarHTMLParaTablero()).to eq('<div class="casilla">0</div>')
    end
    #it 'debería devolver una matriz 1x1' do
    #    @tablero.crearTablero(1,1)
    #    @tablero.mostrarTablero()
    #end
    it 'debería devolver una matriz 2x2 vacia' do
        @tablero.crearTablero(2,2)
        @tablero.mostrarTablero()
    end
    it 'debería devolver una matriz 2x2 vacia' do
        @tablero.crearTablero(2,2)
        @tablero.insertarMinas(2)
        @tablero.insertarNumeroDeMinasAlrededor()
        @tablero.mostrarTablero()
    end

    it 'debería devolver 8 por el numero de filas de un tablero 8x8' do
        @tablero.crearTablero(2,2)
        @tablero.insertarMinas(10)
        @tablero.insertarNumeroDeMinasAlrededor()
        @tablero.mostrarTablero()
    end
    
    #it 'debería devolver 1 porque solo hay una bomba alrededor de esa casilla' do
    #    @tablero.crearTablero(8,8)
    #    @tablero.insertarMinas(10)
    #    @tablero.insertarNumeroDeMinasAlrededor()
    #   expect(@tablero.mostrarUnaCasilla(0, 0)).to eq([1,false])
    #end

    #it 'debería devolver 2 porque hay dos bombas alrededor de esa casilla' do
    #    @tablero.crearTablero(8,8)
    #    @tablero.insertarMinas(10)
    #    @tablero.insertarNumeroDeMinasAlrededor()
    #   expect(@tablero.mostrarUnaCasilla(0, 5)).to eq([2,false])
    #end

    it 'debería devolver true ya que abrimos la casilla' do
        @tablero.crearTablero(8,8)
        @tablero.insertarMinas(10)
        @tablero.insertarNumeroDeMinasAlrededor()
        @tablero.abrirCasilla(0,0)
       expect(@tablero.mostrarUnaCasilla(0, 0)).to eq([1,true])
    end

    #it 'debería mostrar 10 por las 10 minas existentes' do
    #    @tablero.crearTablero(8,8)
    #    @tablero.insertarMinas(10)
    #    expect(@tablero.contarMinas()).to eq(10)
    #end
    it 'debería devolver 10 minas supuestas que nos quedan' do
        @tablero.crearTablero(8,8)
        @tablero.insertarMinas(10)
        expect(@tablero.mostrarBanderas()).to eq(8)
    end
    it 'debería devolver 9 minas supuestas que nos quedan' do
        @tablero.crearTablero(8,8)
        @tablero.quitarUnaBandera()
        @tablero.quitarUnaBandera()
        expect(@tablero.mostrarBanderas()).to eq(6)
    end

end