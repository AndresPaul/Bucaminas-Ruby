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
    #    @tablero.insertarNumeroDeMinasAlrededor()
    #    expect(@tablero.generarHTMLParaCasilla()).to eq('<div class="casilla"> </div>')
    #end
    it 'debería devolver una matriz 1x1 sin datos' do
        @tablero.crearTablero(1,1)
        @tablero.mostrarTablero()
    end
    it 'debería devolver una matriz 2x2 sin datos' do
        @tablero.crearTablero(2,2)
        @tablero.mostrarTablero()
    end
    it 'debería devolver una matriz 2x2' do
        @tablero.crearTablero(2,2)
        @tablero.insertarMinas(2)
        @tablero.insertarNumeroDeMinasAlrededor()
        @tablero.mostrarTablero()
    end
    it 'debería devolver una matriz 8x8' do
        @tablero.crearTablero(8,8)
        @tablero.insertarMinas(10)
        @tablero.insertarNumeroDeMinasAlrededor()
        @tablero.mostrarTablero()
    end
    it 'deberia devoler 0 ya que no hay minas' do
        @tablero.crearTablero(8,8)
        expect(@tablero.mostrarNumeroDeMinas()).to eq(0)
    end
    it 'deberia devoler 4 ya que no hay minas' do
        @tablero.crearTablero(8,8)
        @tablero.insertarMinas(4)
        @tablero.contarMinas()
        expect(@tablero.mostrarNumeroDeMinas()).to eq(4)
    end
    it 'debería mostrar 10 por las 10 minas existentes' do
        @tablero.crearTablero(8,8)
        @tablero.insertarMinas(10)
        @tablero.contarMinas()
        expect(@tablero.mostrarNumeroDeMinas()).to eq(10)
    end
    it 'deberia devolver 0 ya que hay 0 banderas' do
        @tablero.crearTablero(2,2)
        expect(@tablero.mostrarNumeroDeBanderas()).to eq(0)
    end
    it 'deberia devolver 4 ya que hay 4 banderas' do
        @tablero.crearTablero(2,2)
        @tablero.insertarMinas(4)
        @tablero.contarMinas()
        expect(@tablero.mostrarNumeroDeBanderas()).to eq(4)
    end
    it 'deberia devolver 2 por el numero de filas' do
        @tablero.crearTablero(2,2)
        expect(@tablero.mostrarFilasDelTablero()).to eq(2)
    end
    it 'deberia devolver 2 por el numero de columnas' do
        @tablero.crearTablero(2,2)
        expect(@tablero.mostrarColumnasDelTablero()).to eq(2)
    end
    #it 'deberia devolver un string con los atributos para el HTML sin nada dentro para una casilla cerrada' do
    #    @tablero.crearTablero(1,1)
    #    expect(@tablero.generarHTMLParaTablero()).to eq('<div class="casilla"> </div>')
    #end
    #it 'deberia devolver un string con los atributos para el HTML para una mina para una casilla cerrada' do
    #    @tablero.crearTablero(1,1)
    #     @tablero.insertarMinas(1)
    #    expect(@tablero.generarHTMLParaTablero()).to eq('<div class="casilla">100</div>')
    #end
    #it 'deberia devolver un string con los atributos para el HTML sin nada dentro para una casilla abierta' do
    #    @tablero.crearTablero(1,1)
    #    @tablero.abrirCasilla(0,0)
    #    expect(@tablero.generarHTMLParaTablero()).to eq('<div> </div>')
    #end
    #it 'deberia devolver un string con los atributos para el HTML sin nada dentro para una casilla cerrada' do
    #    @tablero.crearTablero(1,1)
    #    expect(@tablero.generarHTMLParaTablero()).to eq('<td><div class="casilla"> </div></td>')
    #end
    #it 'deberia devolver un string con los atributos para el HTML sin nada dentro para una casilla abierta' do
    #    @tablero.crearTablero(1,1)
    #    @tablero.abrirCasilla(0,0)
    #    expect(@tablero.generarHTMLParaTablero()).to eq('<td><div> </div></td>')
    #end
    #it 'deberia devolver un string con los atributos para el HTML sin nada dentro para una casilla cerrada' do
    #    @tablero.crearTablero(1,1)
    #    expect(@tablero.generarHTMLParaTablero()).to eq('<tr><td><div class="casilla"> </div></td></tr>')
    #end
    #it 'deberia devolver un string con los atributos para el HTML sin nada dentro para una casilla abierta' do
    #    @tablero.crearTablero(1,1)
    #    @tablero.abrirCasilla(0,0)
    #    expect(@tablero.generarHTMLParaTablero()).to eq('<tr><td><div> </div></td></tr>')
    #end
    it 'deberia devolver un encabezado vacio para la tabla' do
        @tablero.crearTablero(1,1)
        expect(@tablero.generarEncabezadoDeTableroHTML()).to eq('<th>0</th>')
    end
    it 'deberia devolver un encabezado vacio para la tabla' do
        @tablero.crearTablero(2,2)
        expect(@tablero.generarEncabezadoDeTableroHTML()).to eq('<th>0</th><th>1</th>')
    end
    it 'deberia devolver un string con los atributos para el HTML sin nada dentro para una casilla cerrada' do
        @tablero.crearTablero(1,1)
        expect(@tablero.generarHTMLParaTablero()).to eq('<th>0</th><tr><td><div class="casilla"> </div></td></tr>')
    end
    it 'deberia devolver un string con los atributos para el HTML sin nada dentro para una casilla abierta' do
        @tablero.crearTablero(1,1)
        @tablero.abrirCasilla(0,0)
        expect(@tablero.generarHTMLParaTablero()).to eq('<th>0</th><tr><td><div> </div></td></tr>')
    end
    
    #it 'debería devolver 1 porque solo hay una bomba alrededor de esa casilla' do
    #    @tablero.crearTablero(8,8)
    #    @tablero.insertarMinasEstaticas()
    #    @tablero.insertarNumeroDeMinasAlrededor()
    #   expect(@tablero.mostrarUnaCasilla(0, 0)).to eq([1,false])
    #end
    #it 'debería devolver 2 porque hay dos bombas alrededor de esa casilla' do
    #    @tablero.crearTablero(8,8)
    #    @tablero.insertarMinasEstaticas()
    #    @tablero.insertarNumeroDeMinasAlrededor()
    #   expect(@tablero.mostrarUnaCasilla(0, 5)).to eq([2,false])
    #end
    #it 'debería devolver true ya que abrimos la casilla' do
    #    @tablero.crearTablero(8,8)
    #    @tablero.insertarMinasEstaticas()
    #    @tablero.insertarNumeroDeMinasAlrededor()
    #    @tablero.abrirCasilla(0,0)
    #   expect(@tablero.mostrarUnaCasilla(0, 0)[1]).to eq(true)
    #end
    #it 'deberia devolver true ya que la casilla esta abierta' do
    #    @tablero.crearTablero(8,8)
    #    @tablero.abrirCasilla(0,0)
    #    expect(@tablero.verificarCasillaAbierta()).to eq(true)
    #end
    it 'deberia devolver 0 porque ninguna casilla esta abierta' do 
        @tablero.crearTablero(8,8)
        expect(@tablero.contarCasillasAbiertas()).to eq(0)
    end
    it 'deberia devolver 4 por el numero de casillas que abiertas' do
        @tablero.crearTablero(2,2)
        @tablero.abrirCasilla(0,0)
        @tablero.abrirCasilla(0,1)
        @tablero.abrirCasilla(1,0)
        @tablero.abrirCasilla(1,1)
        expect(@tablero.contarCasillasAbiertas()).to eq(4)
    end
    
    #it 'debería devolver 10 banderas que nos quedan' do
    #    @tablero.crearTablero(8,8)
    #    @tablero.insertarMinas(10)
    #    expect(@tablero.mostrarNumeroDeBanderas()).to eq(10)
    #end
    #it 'debería devolver 6 banderas que nos quedan' do
    #    @tablero.crearTablero(8,8)
    #    @tablero.insertarMinas(8)
    #    @tablero.quitarUnaBandera()
    #    @tablero.quitarUnaBandera()
    #    expect(@tablero.mostrarNumeroDeBanderas()).to eq(6)
    #end
    it 'debería devolver 6 banderas que nos quedan' do
        @tablero.crearTablero(8,8)
        @tablero.insertarMinas(8)
        @tablero.contarMinas()
        @tablero.marcarCasilla(0,0)
        @tablero.marcarCasilla(2,2)
        expect(@tablero.mostrarNumeroDeBanderas()).to eq(6)
    end
    it 'debería devolver B ya que la casilla fue marcada' do
        @tablero.crearTablero(1,1)
        @tablero.insertarMinas(1)
        @tablero.contarMinas()
        @tablero.marcarCasilla(0,0)
        expect(@tablero.generarHTMLParaTablero()).to eq('<th>0</th><tr><td><div>B</div></td></tr>')
    end
    #it 'no deberia devolver nada' do
    #    expect(@tablero.perderPartida()).to eq(' ')
    #end
    #it 'deberia devolver perdiste' do
    #    expect(@tablero.perderPartida()).to eq('Perdiste')
    #end
    it 'deberia devolver perdiste ya que abrio una mina' do
        @tablero.crearTablero(2,2)
        @tablero.insertarMinas(4)
        expect(@tablero.abrirCasilla(0,0)).to eq('Perdiste') 
    end
    #it 'deberia devolver perdiste ya que abrio una mina' do
    #    @tablero.crearTablero(2,2)
    #    @tablero.insertarMinas(3)
    #    expect(@tablero.abrirCasilla(0,0)).to eq('Perdiste') #esta prueba no siempre pasara debido a que las minas son insertadas aleatoriamente
    #end
    #it 'no deberia devolver nada' do
    #    expect(@tablero.ganarPartida()).to eq(' ')
    #end
    #it 'deberia devolver ganaste' do
    #    expect(@tablero.ganarPartida()).to eq('Ganaste')
    #end
    #it 'deberia devolver ganaste ya que abrio todas las minas sin bombas, esta prueba se realizo con bombas estaticas' do
    #    @tablero.crearTablero(2,2)
    #    @tablero.insertarMinas(2)
    #    @tablero.abrirCasilla(0,0)
    #    @tablero.abrirCasilla(0,1)
    #    @tablero.abrirCasilla(1,0)
    #    expect(@tablero.abrirCasilla(1,1)).to eq('Ganaste') 
    #end
     #it 'deberia devolver ganaste ya que abrio todas las minas sin bombas' do
    #    @tablero.crearTablero(2,2)
    #    @tablero.insertarMinas(3)
    #    @tablero.abrirCasilla(0,0)
    #    expect(@tablero.abrirCasilla(1,1)).to eq('Ganaste') #esta prueba no siempre pasara debido a que las minas son insertadas aleatoriamente
    #end
    it 'deberia devolver ganaste ya que abrio todas las minas sin bombas' do
        @tablero.crearTablero(2,2)
        @tablero.abrirCasilla(0,0)
        @tablero.abrirCasilla(0,1)
        @tablero.abrirCasilla(1,0)
        expect(@tablero.abrirCasilla(1,1)).to eq('Ganaste') 
    end
   
end