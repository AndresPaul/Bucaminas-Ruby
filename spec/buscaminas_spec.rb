require 'tablero.rb'


RSpec.describe Tablero do
    
    before { @tablero = Tablero.new }
    
    #it 'debería devolver 64' do
    #    @tablero.insertarMinas()
    #    @tablero.insertarNumerosEnTablero()
    #   expect(@tablero.obtenerTamanioTablero()).to eq(64)
    #end

    it 'debería devolver 1 porque solo hay una bomba alrededor de esa casilla' do
        @tablero.insertarMinas()
        @tablero.insertarNumerosEnTablero()
       expect(@tablero.getCasilla(0, 0)).to eq(1)
    end

    it 'debería devolver 2 porque hay dos bombas alrededor de esa casilla' do
        @tablero.insertarMinas()
        @tablero.insertarNumerosEnTablero()
       expect(@tablero.getCasilla(0, 5)).to eq(2)
    end

    it 'debería mostrar 10 por las 10 minas existentes' do
        @tablero.insertarMinas()
        expect(@tablero.getContMinasReales()).to eq(10)
    end
    it 'debería devolver 10 minas supuestas que nos quedan' do
        @tablero.insertarMinas()
        expect(@tablero.getMinasSupuestas()).to eq(10)
    end
    it 'debería devolver 9 minas supuestas que nos quedan' do
        @tablero.menos1MinaSupuesta()
        @tablero.menos1MinaSupuesta()
        expect(@tablero.getMinasSupuestas()).to eq(8)
    end

end